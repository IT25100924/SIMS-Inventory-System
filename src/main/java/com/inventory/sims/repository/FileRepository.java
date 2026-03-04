package com.inventory.sims.repository;

import java.util.List;

/**
 * Abstraction: Interface for standard repository operations.
 * Implemented across all specific file repositories.
 * 
 * @param <T> The model type
 */
public interface FileRepository<T> {
    void save(T item);
    List<T> findAll();
    void update(T item);
    void delete(String id);
}
