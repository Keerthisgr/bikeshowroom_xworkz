package com.xworkz.bikeshowroom.controller;

import com.xworkz.bikeshowroom.dto.BikeDto;
import com.xworkz.bikeshowroom.dto.BranchDto;
import com.xworkz.bikeshowroom.entity.BranchEntity;
import com.xworkz.bikeshowroom.service.DashBoardService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@Slf4j
@RequestMapping("/")
public class EditAndUpdateController {

    @Autowired
    DashBoardService dashBoardService;

    @GetMapping("/editbranch")
    public String editBranch(@RequestParam("id") int id, Model model) {
        BranchDto entity = dashBoardService.getBranchById(id);
        model.addAttribute("branch", entity);
        return "editbranch";
    }
    @PostMapping("/updatebranch")
    public String updateBranch(@ModelAttribute BranchDto dto, RedirectAttributes redirectAttributes) {
        try {
            dashBoardService.updateBranch(dto);
            redirectAttributes.addFlashAttribute("success", "Branch updated successfully!");

        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/view-branches";
    }

    @GetMapping("/editbikes")
    public String editBike(@RequestParam("id") int id, Model model) {
        BikeDto entity = dashBoardService.getBikeById(id);
        model.addAttribute("bike", entity);
        return "editbikes";
    }

    @PostMapping("/updatebike")
    public String updateBike(@ModelAttribute BikeDto dto, RedirectAttributes redirectAttributes) {
        try {
            dashBoardService.updateBike(dto);
            redirectAttributes.addFlashAttribute("success", "Bike updated successfully!");

        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/view-bikes";
    }
    @GetMapping("/deletebranch")
    public String deleteBranch(@RequestParam int id, Model model) {
        boolean deleted = dashBoardService.deleteBranchById(id);
        if (deleted) {
            model.addAttribute("msg", "Branch deleted successfully");
        } else {
            model.addAttribute("error", "Branch not found or could not be deleted");
        }
        return "redirect:/view-branches";
    }

    @GetMapping("/deletebike")
    public String deleteBike(@RequestParam int id, Model model) {
        boolean deleted = dashBoardService.deleteBikeById(id);
        if (deleted) {
            model.addAttribute("msg", "Bike deleted successfully");
        } else {
            model.addAttribute("error", "Bike not found or could not be deleted");
        }
        return "redirect:/view-bikes";
    }
}
