package com.xworkz.bikeshowroom.service;

import com.xworkz.bikeshowroom.dto.BikeDto;
import com.xworkz.bikeshowroom.dto.BranchDto;
import com.xworkz.bikeshowroom.entity.BikeEntity;
import com.xworkz.bikeshowroom.entity.BranchEntity;
import org.springframework.ui.Model;

import java.util.List;

public interface DashBoardService {
    boolean addNewBike(BikeDto bikeDto);
    boolean addNewBranch(BranchDto branchDto, Model model);
    boolean addBikeAndBranchToShowroom(int branchId, int bikeId);
    List<BikeEntity> listOfBikesNotSelected();
    List<BikeEntity> notFullBranchList();
    int totalBikes();
    int totalBranches();
    List<BikeEntity> getAllBikes();
    List<BranchEntity> getAllBranches();
    BranchDto getBranchById(int id);
    void updateBranch(BranchDto dto);
}
