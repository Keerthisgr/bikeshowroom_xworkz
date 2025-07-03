package com.xworkz.bikeshowroom.service;

import com.xworkz.bikeshowroom.dto.BikeDto;
import com.xworkz.bikeshowroom.dto.BranchDto;
import com.xworkz.bikeshowroom.dto.FollowUpDto;
import com.xworkz.bikeshowroom.dto.UserRegistrationDto;
import com.xworkz.bikeshowroom.entity.*;
import com.xworkz.bikeshowroom.mailSender.EmailSender;
import com.xworkz.bikeshowroom.otpGenerator.OtpGenerator;
import com.xworkz.bikeshowroom.repository.DashBoardRepo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;


import java.util.Collections;
import java.util.List;

@Service
@Slf4j
public class DashBoardServiceImpl implements DashBoardService {
@Autowired
    DashBoardRepo dashBoardRepo;

    @Override
    public boolean addNewBike(BikeDto bikeDto) {
        BikeEntity bikeEntity = new BikeEntity();
        BeanUtils.copyProperties(bikeDto,bikeEntity);
        return dashBoardRepo.addNewBike(bikeEntity);
    }

    @Override
    public boolean addNewBranch(BranchDto branchDto, Model model) {
        BranchEntity branchEntity = new BranchEntity();
        BeanUtils.copyProperties(branchDto,branchEntity);
        boolean result = dashBoardRepo.checkBranchAlreadyExists(branchDto.getBranchName());
        if(result){
            model.addAttribute("result","Branch Name already exist please change");
            return false;
        }
        return dashBoardRepo.addNewBranch(branchEntity);
    }

    @Override
    public boolean addBikeAndBranchToShowroom(int branchId, int bikeId) {
        return dashBoardRepo.addBikeAndBranchToShowroom(branchId,bikeId);
    }

    @Override
    public List<BikeEntity> listOfBikesNotSelected() {
        return dashBoardRepo.listOfBikesNotSelected();
    }

    @Override
    public List<BikeEntity> notFullBranchList() {
        return dashBoardRepo.notFullBranchList();
    }

    @Override
    public int totalBikes() {
        return dashBoardRepo.totalBikeCount();
    }

    @Override
    public int totalBranches() {
        return dashBoardRepo.totalBranchCount();
    }

    @Override
    public List<BikeEntity> getAllBikes() {
        return dashBoardRepo.getAllBikes();
    }
    @Override
    public List<BranchEntity> getAllBranches() {
        return dashBoardRepo.getAllBranches();
    }

    @Override
    public BranchDto getBranchById(int id) {
        BranchEntity entity = dashBoardRepo.findById(id);
        if (entity != null) {
            BranchDto dto = new BranchDto();
            BeanUtils.copyProperties(entity, dto);
            return dto;
        }
        return null;
    }

    @Override
    public void updateBranch(BranchDto dto) {
        dashBoardRepo.updateBranchDetails(dto);
    }

    @Override
    public BikeDto getBikeById(int id) {
        BikeEntity entity = dashBoardRepo.findBikeById(id);
        if (entity != null) {
            BikeDto dto = new BikeDto();
            BeanUtils.copyProperties(entity, dto);
            return dto;
        }
        return null;
    }

    @Override
    public void updateBike(BikeDto dto) {
        dashBoardRepo.updateBikeDetails(dto);
    }

    @Override
    public boolean deleteBranchById(int id) {
        return dashBoardRepo.deleteBranch(id);

    }

    @Override
    public boolean deleteBikeById(int id) {
        return dashBoardRepo.deleteBike(id);
    }

    @Override
    public boolean register(UserRegistrationDto userRegistrationDto) {
        UserRegistrationEntity userRegistrationEntity = new UserRegistrationEntity();
        BeanUtils.copyProperties(userRegistrationDto,userRegistrationEntity);
        UserLoginEntity userLoginEntity = new UserLoginEntity();
        userLoginEntity.setEmail(userRegistrationDto.getEmail());
        String password= OtpGenerator.generateOtp(8);
        userLoginEntity.setPassword(password);
        boolean result = EmailSender.sendEmail(userRegistrationDto.getEmail(), password);
        userLoginEntity.setLoginCount(-1);

        dashBoardRepo.saveLogin(userLoginEntity);
        return dashBoardRepo.register(userRegistrationEntity);

    }

    @Override
    public boolean followUp(FollowUpDto followUpDto) {
        FollowUpEntity followUpEntity = new FollowUpEntity();
        BeanUtils.copyProperties(followUpDto,followUpEntity);
        return dashBoardRepo.followUp(followUpEntity);

    }

    @Override
    public List<String> branchList() {
        return dashBoardRepo.branchList();
    }

    @Override
    public int totalUsers() {
        return dashBoardRepo.totalUserCount();

    }

}

