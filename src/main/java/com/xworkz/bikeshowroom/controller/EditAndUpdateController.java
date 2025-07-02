package com.xworkz.bikeshowroom.controller;

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
}
