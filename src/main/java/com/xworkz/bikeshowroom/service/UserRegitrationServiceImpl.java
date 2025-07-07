package com.xworkz.bikeshowroom.service;

import com.xworkz.bikeshowroom.dto.UserRegistrationDto;
import com.xworkz.bikeshowroom.entity.UserLoginEntity;
import com.xworkz.bikeshowroom.repository.UserRegistrationRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.time.LocalDateTime;
import java.util.Collections;
import java.util.List;

@Service
public class UserRegitrationServiceImpl implements UserRegistrationService{

    @Autowired
    UserRegistrationRepo userRegistrationRepo;
    @Override
    public Long emailExists(String email) {
        return userRegistrationRepo.emailExists(email);

    }

    @Override
    public List<String> getBikeByBranch(String branchId) {
        return userRegistrationRepo.getBikeByBranch(branchId);

    }

    @Override
    public int userLogin(String email, String password, Model model) {
        UserLoginEntity userLoginEntity= userRegistrationRepo.userLogin(email);
        if (userLoginEntity!=null) {
            if (userLoginEntity.getLoginCount() == -1) {
                if (userLoginEntity.getPassword().equals(password)){
                    return -1;
                }else {
                    model.addAttribute("result","Wrong otp! check email and Re-enter");
                }
            } else if (userLoginEntity.getLoginCount()==3) {
                model.addAttribute("result","you already done with your 3 chances! you have to wait 24hrs to login");
                userRegistrationRepo.loginCount(userLoginEntity.getEmail());
                userRegistrationRepo.timer(userLoginEntity.getEmail());
                return 0;
            } else if (userLoginEntity.getLoginCount()>3) {
                LocalDateTime localDateTime = userLoginEntity.getTimeout();
                LocalDateTime localDateTime1  = localDateTime.plusMinutes(2);
                LocalDateTime local=LocalDateTime.now();
                if (local.isAfter(localDateTime1)){
                    userRegistrationRepo.resetLogin(email);
                    model.addAttribute("msg","Now enter your password");
                }else {
                    model.addAttribute("msg","Please wait! try after some times "+ localDateTime1);
                }
                return 6;
            } else if (userLoginEntity.getPassword().equals(password)) {
                userRegistrationRepo.resetLogin(userLoginEntity.getEmail());
                return 1;
            }else if (!userLoginEntity.getPassword().equals(password)){
                model.addAttribute("result","password is not same");
                userRegistrationRepo.loginCount(userLoginEntity.getEmail());
                return 3;
            }
        }else {
            model.addAttribute("result","Not exists");
            return 10;
        }
        return 2;
    }

    @Override
    public boolean setPassword(String email, String password) {
        return userRegistrationRepo.setPassword(email,password);

    }

    @Override
    public void resetLogin(String email) {
        userRegistrationRepo.resetLogin(email);
    }


}
