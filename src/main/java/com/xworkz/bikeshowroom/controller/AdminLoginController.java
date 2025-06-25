package com.xworkz.bikeshowroom.controller;

import com.xworkz.bikeshowroom.entity.AdminEntity;
import com.xworkz.bikeshowroom.service.AdminLoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class AdminLoginController {
    @Autowired
    AdminLoginService adminLogin;

    @RequestMapping("/adminLogin")
    public String adminLogin(String email, String otp, Model model) {
        AdminEntity result = adminLogin.verifyEmail(email);
        if (result != null) {
            if (result.getOtp().equals(otp)) {
                return "dashboard";
            } else {
                model.addAttribute("result", "Password mismatch! Enter valid password");
                return "adminLogin";
            }
        }
        model.addAttribute("result", "Email not exist");
        return "adminLogin";
    }
}
