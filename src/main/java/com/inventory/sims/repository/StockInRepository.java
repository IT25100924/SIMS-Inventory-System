package com.inventory.sims.repository;

import com.inventory.sims.model.StockIn;
import org.springframework.stereotype.Repository;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Repository to manage StockIn data in purchases.txt
 * Delimiter: "!"
 */
@Repository
public class StockInRepository implements FileRepository<StockIn> {
    private static final String FILE_PATH = "purchases.txt";

    @Override
    public void save(StockIn stockIn) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH, true))) {
            String line = stockIn.getId() + "!" + stockIn.getProductId() + "!" + stockIn.getQuantity() + "!" + 
                          stockIn.getDate() + "!" + stockIn.getSupplierId() + "!" + stockIn.getUnitCost();
            writer.write(line);
            writer.newLine();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<StockIn> findAll() {
        List<StockIn> stockIns = new ArrayList<>();
        File file = new File(FILE_PATH);
        if (!file.exists()) return stockIns;

        try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
            String line;
            while ((line = reader.readLine()) != null) {
                if (line.trim().isEmpty()) continue;
                String[] parts = line.split("!");
                if (parts.length >= 6) {
                    stockIns.add(new StockIn(parts[0], parts[1], Integer.parseInt(parts[2]), parts[3], parts[4], Double.parseDouble(parts[5])));
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return stockIns;
    }

    @Override
    public void update(StockIn mergedStockIn) {
        List<StockIn> stockIns = findAll();
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH, false))) {
            for (StockIn s : stockIns) {
                if (s.getId().equals(mergedStockIn.getId())) {
                    s = mergedStockIn;
                }
                String line = s.getId() + "!" + s.getProductId() + "!" + s.getQuantity() + "!" + 
                              s.getDate() + "!" + s.getSupplierId() + "!" + s.getUnitCost();
                writer.write(line);
                writer.newLine();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void delete(String id) {
        List<StockIn> stockIns = findAll();
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH, false))) {
            for (StockIn s : stockIns) {
                if (!s.getId().equals(id)) {
                    String line = s.getId() + "!" + s.getProductId() + "!" + s.getQuantity() + "!" + 
                                  s.getDate() + "!" + s.getSupplierId() + "!" + s.getUnitCost();
                    writer.write(line);
                    writer.newLine();
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
