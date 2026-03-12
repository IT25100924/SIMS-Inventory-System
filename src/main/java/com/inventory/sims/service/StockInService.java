package com.inventory.sims.service;

import com.inventory.sims.model.Product;
import com.inventory.sims.model.StockIn;
import com.inventory.sims.repository.ProductRepository;
import com.inventory.sims.repository.StockInRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;
import com.inventory.sims.util.IdGenerator;

@Service
public class StockInService {

    @Autowired
    private StockInRepository stockInRepository;

    @Autowired
    private ProductRepository productRepository;

    public void addStockIn(StockIn stockIn) {
        if (stockIn.getId() == null || stockIn.getId().isEmpty()) {
            List<String> existingIds = stockInRepository.findAll().stream()
                    .map(StockIn::getId)
                    .collect(Collectors.toList());
            stockIn.setId(IdGenerator.generateId(existingIds));
        }
        stockInRepository.save(stockIn);

        // Business logic: Update product quantity
        Product p = productRepository.findAll().stream()
                .filter(prod -> prod.getId().equals(stockIn.getProductId()))
                .findFirst()
                .orElse(null);
        if (p != null) {
            p.setQuantity(p.getQuantity() + stockIn.getQuantity());
            productRepository.update(p);
        }
    }

    public List<StockIn> getAllStockIns() {
        return stockInRepository.findAll();
    }

    public StockIn getStockInById(String id) {
        return stockInRepository.findAll().stream()
                .filter(s -> s.getId().equals(id))
                .findFirst()
                .orElse(null);
    }
}
