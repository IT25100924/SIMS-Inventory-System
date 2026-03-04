package com.inventory.sims.model;

/**
 * Abstract Transaction class
 */
public abstract class Transaction {
    private String id;
    private String productId;
    private int quantity;
    private String date; // simple date representation for file

    public Transaction() {
    }

    public Transaction(String id, String productId, int quantity, String date) {
        this.id = id;
        this.productId = productId;
        this.quantity = quantity;
        this.date = date;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getType() {
        return this.getClass().getSimpleName();
    }

    public abstract String displayDetails();
}
