package com.inventory.sims.service;

import com.inventory.sims.model.Product;
import com.inventory.sims.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;
import com.inventory.sims.util.IdGenerator;

@Service
public class ProductService {

    @Autowired
    private ProductRepository productRepository;

    public void addProduct(Product product) {
        if (product.getId() == null || product.getId().isEmpty()) {
            List<String> existingIds = productRepository.findAll().stream()
                    .map(Product::getId)
                    .collect(Collectors.toList());
            product.setId(IdGenerator.generateId(existingIds));
        }
        productRepository.save(product);
    }

    public List<Product> getAllProducts() {
        return productRepository.findAll();
    }

    public Product getProductById(String id) {
        return productRepository.findAll().stream()
                .filter(p -> p.getId().equals(id))
                .findFirst()
                .orElse(null);
    }

    public void updateProduct(Product product) {
        productRepository.update(product);
    }

    public void deleteProduct(String id) {
        productRepository.delete(id);
    }
}
