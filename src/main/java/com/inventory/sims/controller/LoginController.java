package com.inventory.sims.controller;

import com.inventory.sims.model.User;
import com.inventory.sims.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import jakarta.servlet.http.HttpSession;

@Controller
public class LoginController {

    @Autowired
    private UserService userService;

    @GetMapping("/login")
    public String showLoginForm(HttpSession session) {
        if (session.getAttribute("loggedInUser") != null) {
            return "redirect:/";
        }
        return "login";
    }

    @PostMapping("/login")
    public String processLogin(@RequestParam String email,
            @RequestParam String password,
            HttpSession session,
            Model model) {
        User user = userService.findByEmailAndPassword(email, password);
        if (user != null) {
            session.setAttribute("loggedInUser", user);
            return "redirect:/";
        }
        model.addAttribute("error", "Invalid email or password. Please try again.");
        return "login";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login";
    }
}
