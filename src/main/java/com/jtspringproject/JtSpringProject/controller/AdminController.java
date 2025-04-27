package com.jtspringproject.JtSpringProject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.sql.*;

@Controller
public class AdminController {
    private int adminLogCheck = 0;
    private String usernameForClass = "";

    @RequestMapping(value = {"/", "/logout"})
    public String returnIndex() {
        adminLogCheck = 0;
        usernameForClass = "";
        return "userLogin";
    }

    @GetMapping("/index")
    public String index(Model model) {
        if (usernameForClass.isEmpty()) {
            return "userLogin";
        } else {
            model.addAttribute("username", usernameForClass);
            return "index";
        }
    }

    @GetMapping("/userloginvalidate")
    public String userLog(Model model) {
        return "userLogin";
    }

    @PostMapping("/userloginvalidate")
    public String userLogin(@RequestParam("username") String username, @RequestParam("password") String pass, Model model) {
        try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/springproject", "root", "");
             PreparedStatement ps = con.prepareStatement("SELECT * FROM users WHERE username = ? AND password = ?")) {
            ps.setString(1, username);
            ps.setString(2, pass);
            ResultSet rst = ps.executeQuery();
            if (rst.next()) {
                usernameForClass = rst.getString("username");
                return "redirect:/index";
            } else {
                model.addAttribute("message", "Invalid Username or Password");
                return "userLogin";
            }
        } catch (SQLException e) {
            System.out.println("Exception: " + e.getMessage());
            return "userLogin";
        }
    }

    @GetMapping("/admin")
    public String adminLogin(Model model) {
        return "adminlogin";
    }

    @GetMapping("/adminhome")
    public String adminHome(Model model) {
        return adminLogCheck != 0 ? "adminHome" : "redirect:/admin";
    }

    @GetMapping("/loginvalidate")
    public String adminLog(Model model) {
        return "adminlogin";
    }

    @PostMapping("/loginvalidate")
    public String adminLogin(@RequestParam("username") String username, @RequestParam("password") String pass, Model model) {
        if ("admin".equalsIgnoreCase(username) && "123".equals(pass)) {
            adminLogCheck = 1;
            return "redirect:/adminhome";
        } else {
            model.addAttribute("message", "Invalid Username or Password");
            return "adminlogin";
        }
    }

    @GetMapping("/admin/categories")
    public String getCategory() {
        return "categories";
    }

    @GetMapping("/admin/sendcategory")
    public String addCategoryToDb(@RequestParam("categoryname") String catName) {
        try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/springproject", "root", "");
             PreparedStatement ps = con.prepareStatement("INSERT INTO categories(name) VALUES (?)")) {
            ps.setString(1, catName);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Exception: " + e.getMessage());
        }
        return "redirect:/admin/categories";
    }

    @GetMapping("/admin/categories/delete")
    public String removeCategoryDb(@RequestParam("id") int id) {
        try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/springproject", "root", "");
             PreparedStatement ps = con.prepareStatement("DELETE FROM categories WHERE categoryid = ?")) {
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Exception: " + e.getMessage());
        }
        return "redirect:/admin/categories";
    }

    @GetMapping("/admin/categories/update")
    public String updateCategoryDb(@RequestParam("categoryid") int id, @RequestParam("categoryname") String categoryName) {
        try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/springproject", "root", "");
             PreparedStatement ps = con.prepareStatement("UPDATE categories SET name = ? WHERE categoryid = ?")) {
            ps.setString(1, categoryName);
            ps.setInt(2, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Exception: " + e.getMessage());
        }
        return "redirect:/admin/categories";
    }

    @GetMapping("/admin/books")
    public String getProduct(Model model) {
        return "books";
    }

    @GetMapping("/admin/books/add")
    public String addProduct(Model model) {
        return "booksAdd";
    }

    @GetMapping("/admin/books/update")
    public String updateProduct(@RequestParam("pid") int id, Model model) {
        try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/springproject", "root", "");
             PreparedStatement ps = con.prepareStatement("SELECT * FROM books WHERE id = ?")) {
            ps.setInt(1, id);
            ResultSet rst = ps.executeQuery();
            if (rst.next()) {
                model.addAttribute("pid", rst.getInt("id"));
                model.addAttribute("pname", rst.getString("name"));
                model.addAttribute("pimage", rst.getString("image"));
                model.addAttribute("pquantity", rst.getInt("quantity"));
                model.addAttribute("pprice", rst.getInt("price"));
                model.addAttribute("pweight", rst.getInt("weight"));
                model.addAttribute("pdescription", rst.getString("description"));

                try (PreparedStatement ps2 = con.prepareStatement("SELECT * FROM categories WHERE categoryid = ?")) {
                    ps2.setInt(1, rst.getInt("categoryid"));
                    ResultSet rst2 = ps2.executeQuery();
                    if (rst2.next()) {
                        model.addAttribute("pcategory", rst2.getString("name"));
                    }
                }
            }
        } catch (SQLException e) {
            System.out.println("Exception: " + e.getMessage());
        }
        return "booksUpdate";
    }

    @PostMapping("/admin/books/updateData")
    public String updateProductToDb(@RequestParam("id") int id, @RequestParam("name") String name,
                                    @RequestParam("price") int price, @RequestParam("weight") int weight,
                                    @RequestParam("quantity") int quantity, @RequestParam("description") String description,
                                    @RequestParam("productImage") String picture) {
        try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/springproject", "root", "");
             PreparedStatement ps = con.prepareStatement(
                     "UPDATE books SET name = ?, image = ?, quantity = ?, price = ?, weight = ?, description = ? WHERE id = ?")) {
            ps.setString(1, name);
            ps.setString(2, picture);
            ps.setInt(3, quantity);
            ps.setInt(4, price);
            ps.setInt(5, weight);
            ps.setString(6, description);
            ps.setInt(7, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Exception: " + e.getMessage());
        }
        return "redirect:/admin/books";
    }

    @GetMapping("/admin/books/delete")
    public String removeProductDb(@RequestParam("id") int id) {
        try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/springproject", "root", "");
             PreparedStatement ps = con.prepareStatement("DELETE FROM books WHERE id = ?")) {
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Exception: " + e.getMessage());
        }
        return "redirect:/admin/books";
    }

    @PostMapping("/admin/books")
    public String postProduct() {
        return "redirect:/admin/categories";
    }

    @PostMapping("/admin/books/sendData")
    public String addProductToDb(@RequestParam("name") String name, @RequestParam("categoryid") String catId,
                                 @RequestParam("price") int price, @RequestParam("weight") int weight,
                                 @RequestParam("quantity") int quantity, @RequestParam("description") String description,
                                 @RequestParam("productImage") String picture) {
        try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/springproject", "root", "");
             PreparedStatement psCat = con.prepareStatement("SELECT * FROM categories WHERE name = ?")) {
            psCat.setString(1, catId);
            ResultSet rs = psCat.executeQuery();
            if (rs.next()) {
                int categoryId = rs.getInt("categoryid");
                try (PreparedStatement ps = con.prepareStatement(
                        "INSERT INTO books(name, image, categoryid, quantity, price, weight, description) VALUES (?, ?, ?, ?, ?, ?, ?)")) {
                    ps.setString(1, name);
                    ps.setString(2, picture);
                    ps.setInt(3, categoryId);
                    ps.setInt(4, quantity);
                    ps.setInt(5, price);
                    ps.setInt(6, weight);
                    ps.setString(7, description);
                    ps.executeUpdate();
                }
            }
        } catch (SQLException e) {
            System.out.println("Exception: " + e.getMessage());
        }
        return "redirect:/admin/books";
    }

    @GetMapping("/admin/members")
    public String getMemberDetail() {
        return "displayMembers";
    }

    @GetMapping("/profileDisplay")
    public String profileDisplay(Model model) {
        try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/springproject", "root", "");
             PreparedStatement ps = con.prepareStatement("SELECT * FROM users WHERE username = ?")) {
            ps.setString(1, usernameForClass);
            ResultSet rst = ps.executeQuery();
            if (rst.next()) {
                model.addAttribute("userid", rst.getInt("uid"));
                model.addAttribute("username", rst.getString("username"));
                model.addAttribute("email", rst.getString("email"));
                model.addAttribute("password", rst.getString("password"));
                model.addAttribute("address", rst.getString("address"));
            }
        } catch (SQLException e) {
            System.out.println("Exception: " + e.getMessage());
        }
        return "updateProfile";
    }

    @PostMapping("/updateuser")
    public String updateUserProfile(@RequestParam("userid") int userId, @RequestParam("username") String username,
                                    @RequestParam("email") String email, @RequestParam("password") String password,
                                    @RequestParam("address") String address) {
        try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/springproject", "root", "");
             PreparedStatement ps = con.prepareStatement(
                     "UPDATE users SET username = ?, email = ?, password = ?, address = ? WHERE uid = ?")) {
            ps.setString(1, username);
            ps.setString(2, email);
            ps.setString(3, password);
            ps.setString(4, address);
            ps.setInt(5, userId);
            ps.executeUpdate();
            usernameForClass = username;
        } catch (SQLException e) {
            System.out.println("Exception: " + e.getMessage());
        }
        return "redirect:/index";
    }
}