package com.inventory.sims.model;

/**
 * Supplier model extending Person
 */
public class Supplier extends Person {
    private String companyName;

    public Supplier() {}

    public Supplier(String id, String name, String email, String phone, String companyName) {
        super(id, name, email, phone);
        this.companyName = companyName;
    }

    public String getCompanyName() { return companyName; }
    public void setCompanyName(String companyName) { this.companyName = companyName; }

    @Override
    public String displayDetails() {
        return "Supplier: " + getName() + " from " + companyName;
    }
}
