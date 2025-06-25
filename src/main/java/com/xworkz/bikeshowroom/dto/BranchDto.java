package com.xworkz.bikeshowroom.dto;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;
@Data
public class BranchDto {
    private Integer id;
    private String branchName;
    private String location;
    private Long number;
    private String email;
    private String managerName;
    private String status;
    private MultipartFile image;
    private String branchImage;
}
