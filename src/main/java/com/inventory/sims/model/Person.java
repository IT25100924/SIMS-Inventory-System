package com.inventory.sims.model;

/**
 * Base abstract class for People in the system (OOP Inheritance base)
 */
public abstract class Person {
    private String id;
    private String name;
    private String email;
    private String phone;

    public Person() {}

    public Person(String id, String name, String email, String phone) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.phone = phone;
    }

    // Encapsulation: getters and setters
    public String getId() { return id; }
    public void setId(String id) { this.id = id; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }

    public abstract String displayDetails();
}
