package com.xworkz.bikeshowroom.entity;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import javax.persistence.*;

@Entity
@Data
@NamedQuery(name = "checkemailexists",query = "SELECT COUNT(e.email) FROM UserRegistrationEntity e WHERE e.email = :email")
@NamedQuery(name = "totalusers",query = "SELECT COUNT(b.id) FROM UserRegistrationEntity b")
@NamedQuery(name = "getAllUser",query = "Select u from  UserRegistrationEntity u")
@NamedQuery(name = "getallusersbyname",query = "Select u from UserRegistrationEntity u where u.fullName =:fullName")
@NamedQuery(name = "findByFullName", query = "FROM UserRegistrationEntity u WHERE u.fullName = :nm")
@NamedQuery(name = "findByEmail", query = "FROM UserRegistrationEntity u WHERE u.email = :em")
@NamedQuery(name = "findByPhone", query = "FROM UserRegistrationEntity u WHERE u.phone = :ph")
@NamedQuery(name = "findByDlNumber", query = "FROM UserRegistrationEntity u WHERE u.dlNumber = :dl")

@NamedQuery(name = "getUserByEmail", query = "FROM UserRegistrationEntity u WHERE u.email = :email")
@NamedQuery(name = "updateUserProfile", query = "UPDATE UserRegistrationEntity u SET u.phone = :phone, u.age = :age, u.address = :address, u.showroom = :showroom, u.bikeModel = :bikeModel, u.testRideOption = :testRideOption, u.rideDate = :rideDate, u.rideTime = :rideTime, u.profilePicture = :profilePicture WHERE u.id = :id")

public class UserRegistrationEntity extends AbstractAuditEntity{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String fullName;
    private String email;
    private String phone;
    private Integer age;
    private String address;
    private String dlNumber;
    private String showroom;
    private String bikeModel;
    private String testRideOption;
    private String rideDate;
    private String rideTime;
    private String profilePicture;
    private String status;
}
