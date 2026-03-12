package com.inventory.sims.util;

import com.inventory.sims.model.*;
import com.inventory.sims.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import jakarta.annotation.PostConstruct;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Component
public class DataMigrationRunner {

    @Autowired
    private UserRepository userRepository;
    @Autowired
    private ProductRepository productRepository;
    @Autowired
    private SupplierRepository supplierRepository;
    @Autowired
    private StockInRepository stockInRepository;
    @Autowired
    private StockOutRepository stockOutRepository;
    @Autowired
    private AlertRepository alertRepository;

    @PostConstruct
    public void migrateLegacyIds() {
        Map<String, String> productMap = new HashMap<>();
        Map<String, String> supplierMap = new HashMap<>();

        // Migrate Users
        List<User> users = userRepository.findAll();
        for (User u : users) {
            String newId = migrateId(u.getId(), users.stream().map(User::getId).collect(Collectors.toList()));
            if (!newId.equals(u.getId())) {
                String oldId = u.getId();
                u.setId(newId);
                userRepository.delete(oldId);
                userRepository.save(u);
            }
        }

        // Migrate Products and Build Map
        List<Product> products = productRepository.findAll();
        for (Product p : products) {
            String newId = migrateId(p.getId(), products.stream().map(Product::getId).collect(Collectors.toList()));
            if (!newId.equals(p.getId())) {
                String oldId = p.getId();
                p.setId(newId);
                productRepository.delete(oldId);
                productRepository.save(p);
                productMap.put(oldId, newId);
            }
        }

        // Migrate Suppliers and Build Map
        List<Supplier> suppliers = supplierRepository.findAll();
        for (Supplier s : suppliers) {
            String newId = migrateId(s.getId(), suppliers.stream().map(Supplier::getId).collect(Collectors.toList()));
            if (!newId.equals(s.getId())) {
                String oldId = s.getId();
                s.setId(newId);
                supplierRepository.delete(oldId);
                supplierRepository.save(s);
                supplierMap.put(oldId, newId);
            }
        }

        // Migrate StockIn (includes foreign keys)
        List<StockIn> stockIns = stockInRepository.findAll();
        for (StockIn in : stockIns) {
            boolean changed = false;
            String oldId = in.getId();
            String newId = migrateId(oldId, stockIns.stream().map(StockIn::getId).collect(Collectors.toList()));

            if (!newId.equals(oldId)) {
                in.setId(newId);
                changed = true;
            }
            if (productMap.containsKey(in.getProductId())) {
                in.setProductId(productMap.get(in.getProductId()));
                changed = true;
            }
            if (supplierMap.containsKey(in.getSupplierId())) {
                in.setSupplierId(supplierMap.get(in.getSupplierId()));
                changed = true;
            }

            if (changed) {
                stockInRepository.delete(oldId);
                stockInRepository.save(in);
            }
        }

        // Migrate StockOut (includes foreign keys)
        List<StockOut> stockOuts = stockOutRepository.findAll();
        for (StockOut out : stockOuts) {
            boolean changed = false;
            String oldId = out.getId();
            String newId = migrateId(oldId, stockOuts.stream().map(StockOut::getId).collect(Collectors.toList()));

            if (!newId.equals(oldId)) {
                out.setId(newId);
                changed = true;
            }
            if (productMap.containsKey(out.getProductId())) {
                out.setProductId(productMap.get(out.getProductId()));
                changed = true;
            }

            if (changed) {
                stockOutRepository.delete(oldId);
                stockOutRepository.save(out);
            }
        }

        // Migrate Alerts
        List<Alert> alerts = alertRepository.findAll();
        for (Alert a : alerts) {
            String newId = migrateId(a.getId(), alerts.stream().map(Alert::getId).collect(Collectors.toList()));
            if (!newId.equals(a.getId())) {
                String oldId = a.getId();
                a.setId(newId);
                alertRepository.delete(oldId);
                alertRepository.save(a);
            }
        }
    }

    private String migrateId(String currentId, List<String> existingIds) {
        if (currentId != null && currentId.matches("\\d{6}")) {
            return currentId;
        }
        return IdGenerator.generateId(existingIds);
    }
}
