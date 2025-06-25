package com.xworkz.bikeshowroom.controller;

import com.xworkz.bikeshowroom.dto.BikeDto;
import com.xworkz.bikeshowroom.dto.BranchDto;
import com.xworkz.bikeshowroom.entity.BikeEntity;
import com.xworkz.bikeshowroom.entity.BranchEntity;
import com.xworkz.bikeshowroom.service.DashBoardService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

@Controller
@Slf4j
@RequestMapping("/")
public class DashboardController {

    @Autowired
    DashBoardService dashBoardService;

    @RequestMapping("/addnewbike")
    public String addNewBike(BikeDto bikeDto, Model model) throws IOException {
        log.info("------------------Add new Bike--------------------");
        byte[] bytes1 = bikeDto.getFrontview().getBytes();
        Path path1 = Paths.get("C:\\modules\\front\\" + bikeDto.getBikename() + System.currentTimeMillis());

        String frontimgfile = path1.getFileName().toString();
        bikeDto.setFrontimage(frontimgfile);

        byte[] bytes2 = bikeDto.getBackview().getBytes();
        Path path2 = Paths.get("C:\\modules\\left\\" + bikeDto.getBikename() + System.currentTimeMillis());

        String backimgfile = path2.getFileName().toString();
        bikeDto.setBackimage(backimgfile);

        byte[] bytes3 = bikeDto.getRightview().getBytes();
        Path path3 = Paths.get("C:\\modules\\right\\" + bikeDto.getBikename() + System.currentTimeMillis());

        String rightimgfile = path3.getFileName().toString();
        bikeDto.setRightimage(rightimgfile);

        byte[] bytes4 = bikeDto.getLeftview().getBytes();
        Path path4 = Paths.get("C:\\modules\\left\\" + bikeDto.getBikename() + System.currentTimeMillis());

        String leftimgfile = path4.getFileName().toString();
        bikeDto.setBackimage(leftimgfile);

        boolean result = dashBoardService.addNewBike(bikeDto);
        if (result) {
            Files.write(path1, bytes1);
            Files.write(path2, bytes2);
            Files.write(path3, bytes3);
            Files.write(path4, bytes4);
            model.addAttribute("bikeresult", "Bike added");
        } else {
            model.addAttribute("bikeresult", "Bike not added successfully!!");
        }
        return this.dashboard(model);

    }

    @RequestMapping("/addbranch")
    public String addNewBranch(BranchDto branchDto, Model model) throws IOException {
        byte[] bytes = branchDto.getImage().getBytes();
        Path path = Paths.get("C:\\modules\\Branches\\" + branchDto.getBranchName() + System.currentTimeMillis());
        String imagefile = path.getFileName().toString();
        branchDto.setBranchImage(imagefile);
        boolean result = dashBoardService.addNewBranch(branchDto, model);
        if (result) {
            Files.write(path, bytes);
            model.addAttribute("branchresult", "Branch added");
        } else {
            model.addAttribute("branchresult", "Branch not added!!");
        }
        return this.dashboard(model);

    }

    @RequestMapping("/dashboard")
    public String dashboard(Model model) {
        model.addAttribute("unsoldbikelist", dashBoardService.listOfBikesNotSelected());
        model.addAttribute("notfullbranchlist", dashBoardService.notFullBranchList());
        model.addAttribute("totalbikes", dashBoardService.totalBikes());
        model.addAttribute("totalbranches", dashBoardService.totalBranches());
        return "dashboard";
    }
    @RequestMapping("/addbikeandbranchtoshowroom")
    public String addBikeAndBranchToShowroom(@RequestParam String branchId, @RequestParam String bikeId, Model model) {
        int branchid = Integer.parseInt(branchId);
        int bikeid = Integer.parseInt(bikeId);
        Boolean result = dashBoardService.addBikeAndBranchToShowroom(branchid, bikeid);
        if (result) {
            model.addAttribute("showroomresult", "Bike and branch added successfully");
        } else {
            model.addAttribute("showroomresult", "bike and branch not added!!");
        }
        return this.dashboard(model);
    }

    @GetMapping("/view-bikes")
    public String viewBikes(Model model) {
        List<BikeEntity> bikes = dashBoardService.getAllBikes();
        model.addAttribute("bikelist", bikes);
        return "view-bikes";
    }

    @GetMapping("/view-branches")
    public String viewBranches(Model model) {
        List<BranchEntity> branches = dashBoardService.getAllBranches();
        model.addAttribute("branchlist", branches);
        return "view-branches";
    }






}
