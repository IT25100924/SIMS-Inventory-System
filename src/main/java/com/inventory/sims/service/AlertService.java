package com.inventory.sims.service;

import com.inventory.sims.model.Alert;
import com.inventory.sims.repository.AlertRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;
import com.inventory.sims.util.IdGenerator;

@Service
public class AlertService {

    @Autowired
    private AlertRepository alertRepository;

    public void addAlert(Alert alert) {
        if (alert.getId() == null || alert.getId().isEmpty()) {
            List<String> existingIds = alertRepository.findAll().stream()
                    .map(Alert::getId)
                    .collect(Collectors.toList());
            alert.setId(IdGenerator.generateId(existingIds));
        }
        alertRepository.save(alert);
    }

    public List<Alert> getAllAlerts() {
        return alertRepository.findAll();
    }

    public void deleteAlert(String id) {
        alertRepository.delete(id);
    }
}
