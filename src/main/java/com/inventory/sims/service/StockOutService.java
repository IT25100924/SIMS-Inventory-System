package com.inventory.sims.service;

import com.inventory.sims.model.Product;
import com.inventory.sims.model.StockOut;
import com.inventory.sims.repository.ProductRepository;
import com.inventory.sims.repository.StockOutRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;
import com.inventory.sims.util.IdGenerator;

@Service
public class StockOutService {

    @Autowired
    private StockOutRepository stockOutRepository;

    @Autowired
    private ProductRepository productRepository;

    public void addStockOut(StockOut stockOut) {
        if (stockOut.getId() == null || stockOut.getId().isEmpty()) {
            List<String> existingIds = stockOutRepository.findAll().stream()
                    .map(StockOut::getId)
                    .collect(Collectors.toList());
            stockOut.setId(IdGenerator.generateId(existingIds));
        }
        stockOutRepository.save(stockOut);
        applyStockOut(stockOut);
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

    public void updateStockOut(StockOut stockOut) {
        StockOut existing = getStockOutById(stockOut.getId());
        if (existing == null) {
            return;
        }
        revertStockOut(existing);
        stockOutRepository.update(stockOut);
        applyStockOut(stockOut);
    }

    public void deleteStockOut(String id) {
        StockOut existing = getStockOutById(id);
        if (existing == null) {
            return;
        }
        revertStockOut(existing);
        stockOutRepository.delete(id);
    }

    private void applyStockOut(StockOut stockOut) {
        adjustProductQuantity(stockOut.getProductId(), -stockOut.getQuantity());
    }

    private void revertStockOut(StockOut stockOut) {
        adjustProductQuantity(stockOut.getProductId(), stockOut.getQuantity());
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
