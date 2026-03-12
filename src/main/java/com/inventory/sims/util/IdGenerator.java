package com.inventory.sims.util;

import java.util.List;

public class IdGenerator {

    /**
     * Generates a 6-digit sequential ID based on the existing IDs.
     * Starts at "000001".
     *
     * @param existingIds List of currently existing IDs (can be empty)
     * @return A 6-digit string ID (e.g., "000105")
     */
    public static String generateId(List<String> existingIds) {
        if (existingIds == null || existingIds.isEmpty()) {
            return "000001";
        }

        int maxId = 0;
        for (String id : existingIds) {
            try {
                // If the ID is an old UUID, this parsing will fail and we ignore it.
                // It helps seamlessly transition to numeric IDs.
                int numericId = Integer.parseInt(id);
                if (numericId > maxId) {
                    maxId = numericId;
                }
            } catch (NumberFormatException e) {
                // Ignore non-numeric IDs (like old UUIDs)
            }
        }

        int nextId = maxId + 1;
        // Format as a 6-digit string, padded with leading zeros
        return String.format("%06d", nextId);
    }
}
