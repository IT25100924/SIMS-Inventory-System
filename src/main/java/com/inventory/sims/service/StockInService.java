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
        applyStockIn(stockIn);
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

    public void updateStockIn(StockIn stockIn) {
        StockIn existing = getStockInById(stockIn.getId());
        if (existing == null) {
            return;
        }
        revertStockIn(existing);
        stockInRepository.update(stockIn);
        applyStockIn(stockIn);
    }

    public void deleteStockIn(String id) {
        StockIn existing = getStockInById(id);
        if (existing == null) {
            return;
        }
        revertStockIn(existing);
        stockInRepository.delete(id);
    }

    private void applyStockIn(StockIn stockIn) {
        adjustProductQuantity(stockIn.getProductId(), stockIn.getQuantity());
    }

    private void revertStockIn(StockIn stockIn) {
        adjustProductQuantity(stockIn.getProductId(), -stockIn.getQuantity());
    }

    private void adjustProductQuantity(String productId, int quantityDelta) {
        Product product = productRepository.findAll().stream()
                .filter(prod -> prod.getId().equals(productId))
                .findFirst()
                .orElse(null);
        if (product != null) {
            product.setQuantity(product.getQuantity() + quantityDelta);
            productRepository.update(product);
        }
    }
}
