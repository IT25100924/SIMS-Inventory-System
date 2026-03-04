package com.inventory.sims.controller;

import com.inventory.sims.model.StockIn;
import com.inventory.sims.service.StockInService;
import com.inventory.sims.service.ProductService;
import com.inventory.sims.service.SupplierService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/stockin")
public class StockInController {

    @Autowired
    private StockInService stockInService;
    
    @Autowired
    private ProductService productService;
    
    @Autowired
    private SupplierService supplierService;

    @GetMapping
    public String viewStockIn(Model model) {
        model.addAttribute("stockIns", stockInService.getAllStockIns());
        return "viewStockIn";
    }

    @GetMapping("/add")
    public String showAddStockInForm(Model model) {
        model.addAttribute("stockIn", new StockIn());
        model.addAttribute("products", productService.getAllProducts());
        model.addAttribute("suppliers", supplierService.getAllSuppliers());
        return "addStockIn";
    }

    @PostMapping("/add")
    public String addStockIn(@ModelAttribute StockIn stockIn) {
        stockInService.addStockIn(stockIn);
        return "redirect:/stockin";
    }
}
