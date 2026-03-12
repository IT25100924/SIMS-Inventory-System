package com.inventory.sims.controller;

import com.inventory.sims.model.*;
import com.inventory.sims.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import jakarta.servlet.http.HttpSession;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Controller
public class HomeController {

    @Autowired
    private ProductService productService;
    @Autowired
    private StockInService stockInService;
    @Autowired
    private StockOutService stockOutService;
    @Autowired
    private SupplierService supplierService;

    @GetMapping("/")
    public String home(Model model, HttpSession session) {
        // 1. Total Items (Sum of all product quantities)
        int totalItems = productService.getAllProducts().stream()
                .mapToInt(Product::getQuantity).sum();
        model.addAttribute("totalItems", totalItems);

        // 2. Low Stock Alerts (Products with quantity < 10)
        long lowStockCount = productService.getAllProducts().stream()
                .filter(p -> p.getQuantity() < 10).count();
        model.addAttribute("lowStockAlerts", lowStockCount);

        // 3. Today's Shipments / Transactions (StockIn + StockOut today)
        String today = LocalDate.now().toString();
        long todayStockIn = stockInService.getAllStockIns().stream()
                .filter(s -> s.getDate().equals(today)).count();
        long todayStockOut = stockOutService.getAllStockOuts().stream()
                .filter(s -> s.getDate().equals(today)).count();
        model.addAttribute("todayShipments", todayStockIn + todayStockOut);

        // 4. Total Suppliers
        int totalSuppliers = supplierService.getAllSuppliers().size();
        model.addAttribute("totalSuppliers", totalSuppliers);

        // 5. Recent Transactions
        List<Transaction> recentTransactions = new ArrayList<>();
        recentTransactions.addAll(stockInService.getAllStockIns());
        recentTransactions.addAll(stockOutService.getAllStockOuts());

        recentTransactions = recentTransactions.stream()
                .sorted(Comparator.comparing(Transaction::getDate).reversed())
                .limit(4)
                .collect(Collectors.toList());

        // Map Product IDs to Product Names for the UI
        Map<String, String> productNames = new java.util.HashMap<>();
        if (productService.getAllProducts() != null) {
            for (Product p : productService.getAllProducts()) {
                if (p.getId() != null && p.getName() != null) {
                    productNames.put(p.getId(), p.getName());
                }
            }
        }

        model.addAttribute("productNames", productNames);
        model.addAttribute("recentTransactions", recentTransactions);

        return "index";
    }
}
