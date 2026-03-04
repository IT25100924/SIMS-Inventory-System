package com.inventory.sims.repository;

import com.inventory.sims.model.StockOut;
import org.springframework.stereotype.Repository;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Repository to manage StockOut data in sales.txt
 * Delimiter: "!"
 */
@Repository
public class StockOutRepository implements FileRepository<StockOut> {
    private static final String FILE_PATH = "sales.txt";

    @Override
    public void save(StockOut stockOut) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH, true))) {
            String line = stockOut.getId() + "!" + stockOut.getProductId() + "!" + stockOut.getQuantity() + "!" + 
                          stockOut.getDate() + "!" + stockOut.getDestination() + "!" + stockOut.getUnitPrice();
            writer.write(line);
            writer.newLine();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<StockOut> findAll() {
        List<StockOut> stockOuts = new ArrayList<>();
        File file = new File(FILE_PATH);
        if (!file.exists()) return stockOuts;

        try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
            String line;
            while ((line = reader.readLine()) != null) {
                if (line.trim().isEmpty()) continue;
                String[] parts = line.split("!");
                if (parts.length >= 6) {
                    stockOuts.add(new StockOut(parts[0], parts[1], Integer.parseInt(parts[2]), parts[3], parts[4], Double.parseDouble(parts[5])));
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return stockOuts;
    }

    @Override
    public void update(StockOut mergedStockOut) {
        List<StockOut> stockOuts = findAll();
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH, false))) {
            for (StockOut s : stockOuts) {
                if (s.getId().equals(mergedStockOut.getId())) {
                    s = mergedStockOut;
                }
                String line = s.getId() + "!" + s.getProductId() + "!" + s.getQuantity() + "!" + 
                              s.getDate() + "!" + s.getDestination() + "!" + s.getUnitPrice();
                writer.write(line);
                writer.newLine();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void delete(String id) {
        List<StockOut> stockOuts = findAll();
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH, false))) {
            for (StockOut s : stockOuts) {
                if (!s.getId().equals(id)) {
                    String line = s.getId() + "!" + s.getProductId() + "!" + s.getQuantity() + "!" + 
                                  s.getDate() + "!" + s.getDestination() + "!" + s.getUnitPrice();
                    writer.write(line);
                    writer.newLine();
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
