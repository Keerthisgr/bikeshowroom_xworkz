package com.xworkz.bikeshowroom.service;

import com.xworkz.bikeshowroom.dto.UserRegistrationDto;
import com.xworkz.bikeshowroom.entity.BikeEntity;
import com.xworkz.bikeshowroom.entity.BranchEntity;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface UserRegistrationService {
    Long emailExists(String email);
    List<String> getBikeByBranch(String branchId);
    int userLogin(String email, String password, Model model);
    boolean setPassword(String email, String password);
    void resetLogin(String email);
    boolean isFullNameExists(String fullName);

    boolean isEmailExists(String email);

    boolean isPhoneExists(String phone);

    boolean isDlNumberExists(String dlNumber);

    UserRegistrationDto getUserProfile(String email);
    boolean updateUserProfile(UserRegistrationDto dto, MultipartFile photoFile);

    List<BranchEntity> getAllBranchesList();

    List<BikeEntity> getAllBikesList();
}
