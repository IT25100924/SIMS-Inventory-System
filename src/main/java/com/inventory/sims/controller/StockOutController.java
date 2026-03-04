package com.inventory.sims.controller;

import com.inventory.sims.model.StockOut;
import com.inventory.sims.service.StockOutService;
import com.inventory.sims.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/stockout")
public class StockOutController {

    @Autowired
    private StockOutService stockOutService;
    
    @Autowired
    private ProductService productService;

    @GetMapping
    public String viewStockOut(Model model) {
        model.addAttribute("stockOuts", stockOutService.getAllStockOuts());
        return "viewStockOut";
    }

    @GetMapping("/add")
    public String showAddStockOutForm(Model model) {
        model.addAttribute("stockOut", new StockOut());
        model.addAttribute("products", productService.getAllProducts());
        return "addStockOut";
    }

    @PostMapping("/add")
    public String addStockOut(@ModelAttribute StockOut stockOut) {
        stockOutService.addStockOut(stockOut);
        return "redirect:/stockout";
    }
}
