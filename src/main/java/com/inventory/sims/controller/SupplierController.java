package com.inventory.sims.controller;

import com.inventory.sims.model.Supplier;
import com.inventory.sims.service.SupplierService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/suppliers")
public class SupplierController {

    @Autowired
    private SupplierService supplierService;

    @GetMapping
    public String viewSuppliers(Model model) {
        model.addAttribute("suppliers", supplierService.getAllSuppliers());
        return "viewSuppliers";
    }

    @GetMapping("/add")
    public String showAddSupplierForm(Model model) {
        model.addAttribute("supplier", new Supplier());
        return "addSupplier";
    }

    @PostMapping("/add")
    public String addSupplier(@ModelAttribute Supplier supplier) {
        supplierService.addSupplier(supplier);
        return "redirect:/suppliers";
    }

    @GetMapping("/edit/{id}")
    public String showEditSupplierForm(@PathVariable String id, Model model) {
        Supplier supplier = supplierService.getSupplierById(id);
        if (supplier != null) {
            model.addAttribute("supplier", supplier);
            return "editSupplier";
        }
        return "redirect:/suppliers";
    }

    @PostMapping("/edit")
    public String editSupplier(@ModelAttribute Supplier supplier) {
        supplierService.updateSupplier(supplier);
        return "redirect:/suppliers";
    }

    @GetMapping("/delete/{id}")
    public String deleteSupplier(@PathVariable String id) {
        supplierService.deleteSupplier(id);
        return "redirect:/suppliers";
    }
}
