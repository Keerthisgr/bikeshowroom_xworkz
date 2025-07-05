package com.xworkz.bikeshowroom.restController;

import com.xworkz.bikeshowroom.service.UserRegistrationService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/")
@Slf4j
public class UserRegistrationRestController {

    @Autowired
    UserRegistrationService userRegistrationService;

    @GetMapping(value = "/emailvalue")
    public String onEmail(@RequestParam("email") String email ){
        Long count= userRegistrationService.emailExists(email);
        if (count==0){
            return "";
        }
        return "email already exist";
    }
    @RequestMapping(value = "/getbranchandbike")
    @ResponseBody
    public List<String> getBikeByBranch(@RequestParam("branchName") String branchName){
         List<String> bikes =  userRegistrationService.getBikeByBranch(branchName);
        return bikes;
    }

}
