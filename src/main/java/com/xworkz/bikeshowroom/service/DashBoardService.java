package com.xworkz.bikeshowroom.service;

import com.xworkz.bikeshowroom.dto.BikeDto;
import com.xworkz.bikeshowroom.dto.BranchDto;
import com.xworkz.bikeshowroom.dto.FollowUpDto;
import com.xworkz.bikeshowroom.dto.UserRegistrationDto;
import com.xworkz.bikeshowroom.entity.BikeEntity;
import com.xworkz.bikeshowroom.entity.BranchEntity;
import com.xworkz.bikeshowroom.entity.FollowUpEntity;
import com.xworkz.bikeshowroom.entity.UserRegistrationEntity;
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
    BikeDto getBikeById(int id);
    void updateBike(BikeDto dto);
    boolean deleteBranchById(int id);
    boolean deleteBikeById(int id);
    boolean register(UserRegistrationDto userRegistrationDto);
    boolean followUp(FollowUpDto followUpDto);
    List<String> branchList();
    int totalUsers();
    List<BikeEntity> userSideBikes();
    List<BranchEntity> userSideShowrooms();
    List<UserRegistrationDto> getAllUsers();
    UserRegistrationEntity getAllUserByName(String fullName);
    Boolean editFollowUpSubmit(FollowUpDto followUpDto);
    List<FollowUpEntity> getAllByName(String fullName);
}
