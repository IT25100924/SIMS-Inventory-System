package com.inventory.sims.repository;

import com.inventory.sims.model.Product;
import org.springframework.stereotype.Repository;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Repository to manage Product data in products.txt
 * Delimiter: "!"
 */
@Repository
public class ProductRepository implements FileRepository<Product> {
    private static final String FILE_PATH = "products.txt";

    @Override
    public void save(Product product) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH, true))) {
            String line = product.getId() + "!" + product.getName() + "!" + product.getPrice() + "!" + product.getQuantity();
            writer.write(line);
            writer.newLine();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Product> findAll() {
        List<Product> products = new ArrayList<>();
        File file = new File(FILE_PATH);
        if (!file.exists()) return products;

        try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
            String line;
            while ((line = reader.readLine()) != null) {
                if (line.trim().isEmpty()) continue;
                String[] parts = line.split("!");
                if (parts.length >= 4) {
                    products.add(new Product(parts[0], parts[1], Double.parseDouble(parts[2]), Integer.parseInt(parts[3])));
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return products;
    }

    @Override
    public void update(Product mergedProduct) {
        List<Product> products = findAll();
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH, false))) {
            for (Product p : products) {
                if (p.getId().equals(mergedProduct.getId())) {
                    p = mergedProduct;
                }
                String line = p.getId() + "!" + p.getName() + "!" + p.getPrice() + "!" + p.getQuantity();
                writer.write(line);
                writer.newLine();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void delete(String id) {
        List<Product> products = findAll();
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH, false))) {
            for (Product p : products) {
                if (!p.getId().equals(id)) {
                    String line = p.getId() + "!" + p.getName() + "!" + p.getPrice() + "!" + p.getQuantity();
                    writer.write(line);
                    writer.newLine();
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
