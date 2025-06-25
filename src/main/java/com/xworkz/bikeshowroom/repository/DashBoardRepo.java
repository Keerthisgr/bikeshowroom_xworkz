package com.xworkz.bikeshowroom.repository;

import com.xworkz.bikeshowroom.entity.BikeEntity;
import com.xworkz.bikeshowroom.entity.BranchEntity;

import java.util.List;


public interface DashBoardRepo {
    boolean addNewBranch(BranchEntity branchEntity);
    boolean addNewBike(BikeEntity bikeEntity);
    boolean checkBranchAlreadyExists(String branchName);
    boolean checkModelAlreadyExists(String modelName);
    boolean addBikeAndBranchToShowroom(int branchId,int bikeId);
    List<BikeEntity> listOfBikesNotSelected();
    List<BikeEntity> notFullBranchList();
    int totalBikeCount();
    int totalBranchCount();
    List<BikeEntity> getAllBikes();
    List<BranchEntity> getAllBranches();
}
