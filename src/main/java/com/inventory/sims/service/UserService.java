package com.inventory.sims.service;

import com.inventory.sims.model.User;
import com.inventory.sims.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;
import com.inventory.sims.util.IdGenerator;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    public void addUser(User user) {
        if (user.getId() == null || user.getId().isEmpty()) {
            List<String> existingIds = userRepository.findAll().stream()
                    .map(User::getId)
                    .collect(Collectors.toList());
            user.setId(IdGenerator.generateId(existingIds));
        }
        userRepository.save(user);
    }

    public List<User> getAllUsers() {
        return userRepository.findAll();
    }

    public User getUserById(String id) {
        return userRepository.findAll().stream()
                .filter(u -> u.getId().equals(id))
                .findFirst()
                .orElse(null);
    }

    public void updateUser(User user) {
        userRepository.update(user);
    }

    public void deleteUser(String id) {
        userRepository.delete(id);
    }

    public User findByEmailAndPassword(String email, String password) {
        return userRepository.findAll().stream()
                .filter(u -> u.getEmail().equalsIgnoreCase(email) && u.getPassword().equals(password))
                .findFirst()
                .orElse(null);
    }
}
