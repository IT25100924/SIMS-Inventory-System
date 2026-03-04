package com.inventory.sims.repository;

import com.inventory.sims.model.Supplier;
import org.springframework.stereotype.Repository;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Repository to manage Supplier data in suppliers.txt
 * Delimiter: "!"
 */
@Repository
public class SupplierRepository implements FileRepository<Supplier> {
    private static final String FILE_PATH = "suppliers.txt";

    @Override
    public void save(Supplier supplier) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH, true))) {
            String line = supplier.getId() + "!" + supplier.getName() + "!" + supplier.getEmail() + "!" + 
                          supplier.getPhone() + "!" + supplier.getCompanyName();
            writer.write(line);
            writer.newLine();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Supplier> findAll() {
        List<Supplier> suppliers = new ArrayList<>();
        File file = new File(FILE_PATH);
        if (!file.exists()) return suppliers;

        try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
            String line;
            while ((line = reader.readLine()) != null) {
                if (line.trim().isEmpty()) continue;
                String[] parts = line.split("!");
                if (parts.length >= 5) {
                    suppliers.add(new Supplier(parts[0], parts[1], parts[2], parts[3], parts[4]));
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return suppliers;
    }

    @Override
    public void update(Supplier mergedSupplier) {
        List<Supplier> suppliers = findAll();
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH, false))) {
            for (Supplier s : suppliers) {
                if (s.getId().equals(mergedSupplier.getId())) {
                    s = mergedSupplier;
                }
                String line = s.getId() + "!" + s.getName() + "!" + s.getEmail() + "!" + 
                              s.getPhone() + "!" + s.getCompanyName();
                writer.write(line);
                writer.newLine();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void delete(String id) {
        List<Supplier> suppliers = findAll();
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH, false))) {
            for (Supplier s : suppliers) {
                if (!s.getId().equals(id)) {
                    String line = s.getId() + "!" + s.getName() + "!" + s.getEmail() + "!" + 
                                  s.getPhone() + "!" + s.getCompanyName();
                    writer.write(line);
                    writer.newLine();
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
