package com.xworkz.bikeshowroom.repository;

import com.xworkz.bikeshowroom.dto.UserRegistrationDto;
import com.xworkz.bikeshowroom.entity.UserLoginEntity;
import com.xworkz.bikeshowroom.entity.UserRegistrationEntity;

import java.util.List;

public interface UserRegistrationRepo {
    Long emailExists(String email);
    List<String> getBikeByBranch(String branchName);
    UserLoginEntity userLogin(String email);
    boolean loginCount(String email);
    void timer(String email);
    void resetLogin(String email);
    boolean setPassword(String email, String password);

    boolean isFullNameExists(String fullName);

    boolean isEmailExists(String email);

    boolean isPhoneExists(String phone);

    boolean isDlNumberExists(String dlNumber);
}
