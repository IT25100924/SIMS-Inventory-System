package com.inventory.sims.repository;

import com.inventory.sims.model.User;
import org.springframework.stereotype.Repository;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Repository to manage User data in users.txt using BufferedReader/BufferedWriter.
 * Delimiter: "!"
 */
@Repository
public class UserRepository implements FileRepository<User> {
    private static final String FILE_PATH = "users.txt";

    @Override
    public void save(User user) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH, true))) {
            String line = user.getId() + "!" + user.getName() + "!" + user.getEmail() + "!" + 
                          user.getPhone() + "!" + user.getRole() + "!" + user.getPassword();
            writer.write(line);
            writer.newLine();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<User> findAll() {
        List<User> users = new ArrayList<>();
        File file = new File(FILE_PATH);
        if (!file.exists()) return users;

        try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
            String line;
            while ((line = reader.readLine()) != null) {
                if (line.trim().isEmpty()) continue;
                String[] parts = line.split("!");
                if (parts.length >= 6) {
                    users.add(new User(parts[0], parts[1], parts[2], parts[3], parts[4], parts[5]));
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return users;
    }

    @Override
    public void update(User mergedUser) {
        List<User> users = findAll();
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH, false))) {
            for (User u : users) {
                if (u.getId().equals(mergedUser.getId())) {
                    u = mergedUser;
                }
                String line = u.getId() + "!" + u.getName() + "!" + u.getEmail() + "!" + 
                              u.getPhone() + "!" + u.getRole() + "!" + u.getPassword();
                writer.write(line);
                writer.newLine();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void delete(String id) {
        List<User> users = findAll();
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH, false))) {
            for (User u : users) {
                if (!u.getId().equals(id)) {
                    String line = u.getId() + "!" + u.getName() + "!" + u.getEmail() + "!" + 
                                  u.getPhone() + "!" + u.getRole() + "!" + u.getPassword();
                    writer.write(line);
                    writer.newLine();
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
