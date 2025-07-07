package com.xworkz.bikeshowroom.repository;

import com.xworkz.bikeshowroom.dto.BikeDto;
import com.xworkz.bikeshowroom.dto.BranchDto;
import com.xworkz.bikeshowroom.entity.*;

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
    BranchEntity findById(int id);
    void updateBranchDetails(BranchDto dto);
    BikeEntity findBikeById(int id);
    void updateBikeDetails(BikeDto dto);
    boolean deleteBranch(int id);
    boolean deleteBike(int id);
    boolean saveLogin(UserLoginEntity userLoginEntity);
    boolean register(UserRegistrationEntity userRegistrationEntity);
    boolean followUp(FollowUpEntity followUpEntity);
    List<String> branchList();
    int totalUserCount();
    List<BikeEntity> userSideBikes();
    List<BranchEntity> userSideShowrooms();
}
