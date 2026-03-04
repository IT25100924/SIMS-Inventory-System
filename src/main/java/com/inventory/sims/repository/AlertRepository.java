package com.inventory.sims.repository;

import com.inventory.sims.model.Alert;
import org.springframework.stereotype.Repository;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Repository to manage Alert data in alerts.txt
 * Delimiter: "!"
 */
@Repository
public class AlertRepository implements FileRepository<Alert> {
    private static final String FILE_PATH = "alerts.txt";

    @Override
    public void save(Alert alert) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH, true))) {
            String line = alert.getId() + "!" + alert.getMessage() + "!" + alert.getLevel() + "!" + alert.getDate();
            writer.write(line);
            writer.newLine();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Alert> findAll() {
        List<Alert> alerts = new ArrayList<>();
        File file = new File(FILE_PATH);
        if (!file.exists()) return alerts;

        try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
            String line;
            while ((line = reader.readLine()) != null) {
                if (line.trim().isEmpty()) continue;
                String[] parts = line.split("!");
                if (parts.length >= 4) {
                    alerts.add(new Alert(parts[0], parts[1], parts[2], parts[3]));
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return alerts;
    }

    @Override
    public void update(Alert mergedAlert) {
        List<Alert> alerts = findAll();
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH, false))) {
            for (Alert a : alerts) {
                if (a.getId().equals(mergedAlert.getId())) {
                    a = mergedAlert;
                }
                String line = a.getId() + "!" + a.getMessage() + "!" + a.getLevel() + "!" + a.getDate();
                writer.write(line);
                writer.newLine();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void delete(String id) {
        List<Alert> alerts = findAll();
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH, false))) {
            for (Alert a : alerts) {
                if (!a.getId().equals(id)) {
                    String line = a.getId() + "!" + a.getMessage() + "!" + a.getLevel() + "!" + a.getDate();
                    writer.write(line);
                    writer.newLine();
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
