package com.xworkz.bikeshowroom.controller;

import com.xworkz.bikeshowroom.dto.UserRegistrationDto;
import com.xworkz.bikeshowroom.entity.BikeEntity;
import com.xworkz.bikeshowroom.entity.BranchEntity;
import com.xworkz.bikeshowroom.service.DashBoardService;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.List;

@Controller
@Slf4j
@RequestMapping("/")
public class ViewController {

    @Autowired
    DashBoardService dashBoardService;

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

    @RequestMapping("/getfrontimage")
    public void getFrontImage(@RequestParam("image") String image, HttpServletResponse response) throws IOException {
        if (image == null || image.trim().isEmpty()) {
            System.out.println("Image name is empty. Skipping rendering.");
            return; // Exit early if image is missing
        }

        File file = new File("C:\\modules\\front\\" + image);

        // Check if file exists and is a file (not a directory)
        if (!file.exists() || !file.isFile()) {
            System.out.println("File not found: " + file.getAbsolutePath());
            return;
        }

        response.setContentType("image/jpeg");

        try (
                InputStream in = new BufferedInputStream(new FileInputStream(file));
                ServletOutputStream out = response.getOutputStream()
        ) {
            IOUtils.copy(in, out);
            response.flushBuffer();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    @RequestMapping("/getbacksideimage")
    public void getBackSideImage(@RequestParam("image") String image, HttpServletResponse response) throws IOException {
        if (image == null || image.trim().isEmpty()) {
            System.out.println("Back image name is empty. Skipping.");
            return;
        }

        File file = new File("C:\\modules\\back\\" + image);

        // Check if file exists and is not a directory
        if (!file.exists() || !file.isFile()) {
            System.out.println("Back image file not found: " + file.getAbsolutePath());
            return;
        }

        response.setContentType("image/jpeg");

        try (
                InputStream in = new BufferedInputStream(new FileInputStream(file));
                ServletOutputStream out = response.getOutputStream()
        ) {
            IOUtils.copy(in, out);
            response.flushBuffer();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping("/getrightsideimage")
    public void getRightSideImage(@RequestParam("image") String image, HttpServletResponse response) throws IOException {
        if (image == null || image.trim().isEmpty()) {
            System.out.println("Right image name is empty. Skipping.");
            return;
        }

        File file = new File("C:\\modules\\right\\" + image);

        if (!file.exists() || !file.isFile()) {
            System.out.println("Right side image not found: " + file.getAbsolutePath());
            return;
        }

        response.setContentType("image/jpeg");

        try (
                InputStream in = new BufferedInputStream(new FileInputStream(file));
                ServletOutputStream out = response.getOutputStream()
        ) {
            IOUtils.copy(in, out);
            response.flushBuffer();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping("/getleftsideimage")
    public void getLeftSideImage(@RequestParam("image") String image, HttpServletResponse response) throws IOException {
        if (image == null || image.trim().isEmpty()) {
            System.out.println("Left side image is empty.");
            return;
        }

        File file = new File("C:\\modules\\left\\" + image);
        if (!file.exists() || !file.isFile()) {
            System.out.println("Left side image file not found: " + file.getAbsolutePath());
            return;
        }

        response.setContentType("image/jpeg");
        try (
                InputStream in = new BufferedInputStream(new FileInputStream(file));
                ServletOutputStream out = response.getOutputStream()
        ) {
            IOUtils.copy(in, out);
            response.flushBuffer();
        }
    }

    @RequestMapping("/getbranchimage")
    public void getBranchImage(@RequestParam("image")String image,Model model,HttpServletResponse response) throws IOException {
        response.setContentType("image/jpg");
        File file=new File("C:\\modules\\Branches\\"+image);
        InputStream in=new BufferedInputStream(new FileInputStream(file));
        ServletOutputStream out = response.getOutputStream();
        IOUtils.copy(in,out);
        response.flushBuffer();
    }


}
