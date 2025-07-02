package com.xworkz.bikeshowroom.controller;

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
    public void getFrontImage(@RequestParam("image")String image,Model model,HttpServletResponse response) throws IOException {
        response.setContentType("image/jpg");
        File file=new File("C:\\modules\\front\\"+image);
        InputStream in=new BufferedInputStream(new FileInputStream(file));
        ServletOutputStream out = response.getOutputStream();
        IOUtils.copy(in,out);
        response.flushBuffer();

    }

    @RequestMapping("/getbacksideimage")
    public void getBackSideImage(@RequestParam("image")String image, Model model, HttpServletResponse response) throws IOException {
        response.setContentType("image/jpg");
        File file=new File("C:\\modules\\back\\"+image);
        InputStream in=new BufferedInputStream(new FileInputStream(file));
        ServletOutputStream out = response.getOutputStream();
        IOUtils.copy(in,out);
        response.flushBuffer();

    }
    @RequestMapping("/getrightsideimage")
    public void getRightSideImage(@RequestParam("image")String image,Model model,HttpServletResponse response) throws IOException {
        response.setContentType("image/jpg");
        File file=new File("C:\\modules\\right\\"+image);
        InputStream in=new BufferedInputStream(new FileInputStream(file));
        ServletOutputStream out = response.getOutputStream();
        IOUtils.copy(in,out);
        response.flushBuffer();

    }
    @RequestMapping("/getleftsideimage")
    public void getLeftSideImage(@RequestParam("image")String image,Model model,HttpServletResponse response) throws IOException {
        response.setContentType("image/jpg");
        File file=new File("C:\\modules\\left\\"+image);
        InputStream in=new BufferedInputStream(new FileInputStream(file));
        ServletOutputStream out = response.getOutputStream();
        IOUtils.copy(in,out);
        response.flushBuffer();

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
