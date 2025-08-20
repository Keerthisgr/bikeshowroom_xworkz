package com.xworkz.bikeshowroom.controller;

import com.xworkz.bikeshowroom.dto.UserRegistrationDto;
import com.xworkz.bikeshowroom.entity.BikeEntity;
import com.xworkz.bikeshowroom.entity.BranchEntity;
import com.xworkz.bikeshowroom.service.DashBoardService;
import com.xworkz.bikeshowroom.service.UserRegistrationService;
import org.hibernate.engine.jdbc.StreamUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.util.List;

@Controller
@RequestMapping("/")
public class UserRegistrationController {

    @Autowired
    UserRegistrationService userRegistrationService;



    @GetMapping("/userprofile")
    public String viewUserProfile(@RequestParam("email") String email, Model model) {
        UserRegistrationDto user = userRegistrationService.getUserProfile(email);
        List<BranchEntity> branchList = userRegistrationService.getAllBranchesList();
        List<BikeEntity> bikeModelList = userRegistrationService.getAllBikesList();

        model.addAttribute("user", user);
        model.addAttribute("branchdata", branchList);
        model.addAttribute("bikeModels", bikeModelList);

        return "userprofile";
    }
    @GetMapping("/getProfileImage")
    public void getProfileImage(@RequestParam("email") String email, HttpServletResponse response) throws IOException {
        UserRegistrationDto user = userRegistrationService.getUserProfile(email);
        if (user != null && user.getProfilePicture() != null) {
            String path = "C:/modules/profile/" + user.getProfilePicture();
            File imgFile = new File(path);
            if (imgFile.exists()) {
                response.setContentType(Files.probeContentType(imgFile.toPath()));
                StreamUtils.copy(new FileInputStream(imgFile), response.getOutputStream());
            }
        }
    }
    @PostMapping("/updateprofile")
    public String updateProfile(@ModelAttribute UserRegistrationDto dto,
                                @RequestParam("profilePhoto") MultipartFile photoFile,
                                RedirectAttributes redirectAttributes) {
        boolean updated = userRegistrationService.updateUserProfile(dto, photoFile);
        redirectAttributes.addFlashAttribute("msg", updated ? "Profile updated successfully" : "Update failed");
        return "redirect:/userprofile?email=" + dto.getEmail();
    }

}
