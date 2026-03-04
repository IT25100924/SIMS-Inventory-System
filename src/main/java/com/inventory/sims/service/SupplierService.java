package com.inventory.sims.service;

import com.inventory.sims.model.Supplier;
import com.inventory.sims.repository.SupplierRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
public class SupplierService {

    @Autowired
    private SupplierRepository supplierRepository;

    public void addSupplier(Supplier supplier) {
        if (supplier.getId() == null || supplier.getId().isEmpty()) {
            supplier.setId(UUID.randomUUID().toString());
        }
        supplierRepository.save(supplier);
    }

    public List<Supplier> getAllSuppliers() {
        return supplierRepository.findAll();
    }

    public Supplier getSupplierById(String id) {
        return supplierRepository.findAll().stream()
                .filter(s -> s.getId().equals(id))
                .findFirst()
                .orElse(null);
    }

    public void updateSupplier(Supplier supplier) {
        supplierRepository.update(supplier);
    }

    public void deleteSupplier(String id) {
        supplierRepository.delete(id);
    }
}
