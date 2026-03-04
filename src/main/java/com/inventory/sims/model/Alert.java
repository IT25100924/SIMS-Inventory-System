package com.inventory.sims.model;

/**
 * Alert model
 */
public class Alert {
    private String id;
    private String message;
    private String level; // INFO, WARNING, CRITICAL
    private String date;

    public Alert() {}

    public Alert(String id, String message, String level, String date) {
        this.id = id;
        this.message = message;
        this.level = level;
        this.date = date;
    }

    public String getId() { return id; }
    public void setId(String id) { this.id = id; }
    public String getMessage() { return message; }
    public void setMessage(String message) { this.message = message; }
    public String getLevel() { return level; }
    public void setLevel(String level) { this.level = level; }
    public String getDate() { return date; }
    public void setDate(String date) { this.date = date; }
}
