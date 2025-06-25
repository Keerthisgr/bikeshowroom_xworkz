package com.xworkz.bikeshowroom.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import javax.persistence.*;

@Entity
@ToString
@Data
@NoArgsConstructor
@AllArgsConstructor
@Table(name="admin_login")
@NamedQuery(name = "verifylogin",query = "select a from AdminEntity a where a.email=:email")
@NamedQuery(name = "updateotp",query = "UPDATE AdminEntity u SET u.otp =:otp WHERE u.email =:email")
public class AdminEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String name;
    private String email;
    private String otp;
}
