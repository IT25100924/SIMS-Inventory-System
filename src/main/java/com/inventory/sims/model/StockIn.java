package com.inventory.sims.model;

/**
 * StockIn model extending Transaction
 */
public class StockIn extends Transaction {
    private String supplierId;
    private double unitCost;

    public StockIn() {}

    public StockIn(String id, String productId, int quantity, String date, String supplierId, double unitCost) {
        super(id, productId, quantity, date);
        this.supplierId = supplierId;
        this.unitCost = unitCost;
    }

    public String getSupplierId() { return supplierId; }
    public void setSupplierId(String supplierId) { this.supplierId = supplierId; }
    public double getUnitCost() { return unitCost; }
    public void setUnitCost(double unitCost) { this.unitCost = unitCost; }

    @Override
    public String displayDetails() {
        return "StockIn: " + getQuantity() + " units of " + getProductId() + " from " + supplierId + " on " + getDate();
    }
}
