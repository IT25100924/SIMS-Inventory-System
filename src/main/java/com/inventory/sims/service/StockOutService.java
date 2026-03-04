package com.inventory.sims.service;

import com.inventory.sims.model.Product;
import com.inventory.sims.model.StockOut;
import com.inventory.sims.repository.ProductRepository;
import com.inventory.sims.repository.StockOutRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
public class StockOutService {

    @Autowired
    private StockOutRepository stockOutRepository;
    
    @Autowired
    private ProductRepository productRepository;

    public void addStockOut(StockOut stockOut) {
        if (stockOut.getId() == null || stockOut.getId().isEmpty()) {
            stockOut.setId(UUID.randomUUID().toString());
        }
        stockOutRepository.save(stockOut);
        
        // Business logic: Update product quantity
        Product p = productRepository.findAll().stream()
                .filter(prod -> prod.getId().equals(stockOut.getProductId()))
                .findFirst()
                .orElse(null);
        if (p != null) {
            p.setQuantity(p.getQuantity() - stockOut.getQuantity());
            productRepository.update(p);
        }
    }

    public List<StockOut> getAllStockOuts() {
        return stockOutRepository.findAll();
    }

    public StockOut getStockOutById(String id) {
        return stockOutRepository.findAll().stream()
                .filter(s -> s.getId().equals(id))
                .findFirst()
                .orElse(null);
    }
}
