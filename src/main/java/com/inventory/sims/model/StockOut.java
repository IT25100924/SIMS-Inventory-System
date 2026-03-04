package com.inventory.sims.model;

/**
 * StockOut model extending Transaction
 */
public class StockOut extends Transaction {
    private String destination; // Where it went, e.g., store front
    private double unitPrice;

    public StockOut() {}

    public StockOut(String id, String productId, int quantity, String date, String destination, double unitPrice) {
        super(id, productId, quantity, date);
        this.destination = destination;
        this.unitPrice = unitPrice;
    }

    public String getDestination() { return destination; }
    public void setDestination(String destination) { this.destination = destination; }
    public double getUnitPrice() { return unitPrice; }
    public void setUnitPrice(double unitPrice) { this.unitPrice = unitPrice; }

    @Override
    public String displayDetails() {
        return "StockOut: " + getQuantity() + " units of " + getProductId() + " to " + destination + " on " + getDate();
    }
}
