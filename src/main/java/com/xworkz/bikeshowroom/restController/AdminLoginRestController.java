package com.xworkz.bikeshowroom.restController;

import com.xworkz.bikeshowroom.entity.AdminEntity;
import com.xworkz.bikeshowroom.mailSender.EmailSender;
import com.xworkz.bikeshowroom.otpGenerator.OtpGenerator;
import com.xworkz.bikeshowroom.service.AdminLoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/")
public class AdminLoginRestController {
    @Autowired
    AdminLoginService adminLoginService;

    @RequestMapping(value = "/email")
    public String sendMail(@RequestParam("email") String email, Model model) {
        AdminEntity result = adminLoginService.verifyEmail(email);
        if (result != null) {
            String otp = OtpGenerator.generateOtp(6);
            boolean reset = adminLoginService.addOtp(email, otp);
            System.out.println(reset);
            boolean result1 = EmailSender.sendEmail(email, otp);
            if (result1) {
                return "otp sent to your mail";
            } else {
                return "otp not sent to your mail!";
            }

        } else {
            return "email not found";
        }
    }
}
