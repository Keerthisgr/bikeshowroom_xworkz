package com.xworkz.bikeshowroom.service;

import com.xworkz.bikeshowroom.dto.BikeDto;
import com.xworkz.bikeshowroom.dto.BranchDto;
import com.xworkz.bikeshowroom.entity.BikeEntity;
import com.xworkz.bikeshowroom.entity.BranchEntity;
import com.xworkz.bikeshowroom.repository.DashBoardRepo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;


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

}

