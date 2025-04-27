package com.jtspringproject.JtSpringProject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.sql.*;

@Controller
public class UserController {

    @GetMapping("/register")
    public String registerUser() {
        return "register";
    }

    @GetMapping("/contact")
    public String contact() {
        return "contact";
    }

    @GetMapping("/rent")
    public String rent() {
        return "rent";
    }

    @GetMapping("/user/books")
    public String getProduct(Model model) {
        return "uproduct";
    }

    @PostMapping("/newuserregister")
    public String newUserRegister(@RequestParam("username") String username,
                                  @RequestParam("password") String password,
                                  @RequestParam("email") String email) {
        try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/springproject", "root", "");
             PreparedStatement ps = con.prepareStatement("INSERT INTO users(username, password, email) VALUES (?, ?, ?)")) {
            ps.setString(1, username);
            ps.setString(2, password);
            ps.setString(3, email);
            int i = ps.executeUpdate();
            System.out.println("Database updated: " + i);
        } catch (SQLException e) {
            System.out.println("Exception: " + e.getMessage());
        }
        return "redirect:/";
    }
}