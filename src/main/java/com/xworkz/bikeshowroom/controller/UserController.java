package com.xworkz.bikeshowroom.controller;

import com.xworkz.bikeshowroom.dto.UserRegistrationDto;
import com.xworkz.bikeshowroom.entity.BikeEntity;
import com.xworkz.bikeshowroom.entity.BranchEntity;
import com.xworkz.bikeshowroom.entity.UserRegistrationEntity;
import com.xworkz.bikeshowroom.service.AdminLoginService;
import com.xworkz.bikeshowroom.service.DashBoardService;
import com.xworkz.bikeshowroom.service.UserRegistrationService;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.List;

@Controller
@Slf4j
@RequestMapping("/")
public class UserController {

    @Autowired
    DashBoardService dashBoardService;

    @Autowired
    UserRegistrationService userRegistrationService;

    @PostMapping("/userLogin")
    public String userLogin(String email, String password, Model model){
        int result1=userRegistrationService.userLogin(email,password,model);
        if (result1==-1){
            model.addAttribute("email",email);
            return "resetpassword";
        }else if (result1==1){
            model.addAttribute("email",email);
            return bikesViewPage(model);
        }
        else {
            model.addAttribute("email",email);
            return "userLogin";
        }
    }

    @RequestMapping("/viewpage")
    private String bikesViewPage(Model model) {
        List<BikeEntity> list = dashBoardService.getAllBikes();
        model.addAttribute("bikelist",list);
        return "viewpage";
    }

    @RequestMapping("/updatepassword")
    public String resetPassword(String email,String password,String confirmPassword,Model model){
        if (password.equals(confirmPassword)){
            userRegistrationService.setPassword(email,password);
            userRegistrationService.resetLogin(email);
            model.addAttribute("msg","Login now!!");
            return "userLogin";
        }else {
            model.addAttribute("msg","password mismatch! Enter correct password");
            model.addAttribute("email",email);
            return "resetpassword";
        }
    }
    @RequestMapping("/userside-viewbikes")
    public String userSideBikes( Model model){
        List<BikeEntity> list = dashBoardService.userSideBikes();
        model.addAttribute("bikelist", list);

        return "userside-viewbikes";
    }
    @RequestMapping("/userside-viewshowrooms")
    public String userSideShowrooms(Model model){
        List<BranchEntity> list=dashBoardService.userSideShowrooms();
        model.addAttribute("showroomlist",list);
        return "userside-viewshowrooms";

    }
}
