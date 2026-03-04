package com.inventory.sims.controller;

import com.inventory.sims.model.Alert;
import com.inventory.sims.service.AlertService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/alerts")
public class AlertController {

    @Autowired
    private AlertService alertService;

    @GetMapping
    public String viewAlerts(Model model) {
        model.addAttribute("alerts", alertService.getAllAlerts());
        return "viewAlerts";
    }

    @GetMapping("/add")
    public String showAddAlertForm(Model model) {
        model.addAttribute("alert", new Alert());
        return "addAlert";
    }

    @PostMapping("/add")
    public String addAlert(@ModelAttribute Alert alert) {
        alertService.addAlert(alert);
        return "redirect:/alerts";
    }

    @GetMapping("/delete/{id}")
    public String deleteAlert(@PathVariable String id) {
        alertService.deleteAlert(id);
        return "redirect:/alerts";
    }
}
