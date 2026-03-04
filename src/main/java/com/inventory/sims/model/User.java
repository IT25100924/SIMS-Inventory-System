package com.inventory.sims.model;

/**
 * User model extending Person
 */
public class User extends Person {
    private String role; // e.g., ADMIN, MANAGER
    private String password;

    public User() {}

    public User(String id, String name, String email, String phone, String role, String password) {
        super(id, name, email, phone);
        this.role = role;
        this.password = password;
    }

    public String getRole() { return role; }
    public void setRole(String role) { this.role = role; }
    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }

    @Override
    public String displayDetails() {
        return "User: " + getName() + " (" + role + ")";
    }
}
