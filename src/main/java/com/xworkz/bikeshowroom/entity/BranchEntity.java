package com.xworkz.bikeshowroom.entity;

import lombok.Data;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;
@Data
@Entity
@NamedQuery(name = "checkbranchexistance",query = "select e from BranchEntity e where e.branchName=:branchname")
@NamedQuery(name = "branchwithlimitedbikeslist", query = "SELECT b FROM BranchEntity b WHERE ((SELECT COUNT(bk.id) FROM BikeEntity bk WHERE bk.branchEntity.id = b.id) < 5 )AND b.status = 'active'")
@NamedQuery(name = "totalbranches",query = "SELECT COUNT(b.id) FROM BranchEntity b")

public class BranchEntity extends AbstractAuditEntity{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String branchName;
    private String location;
    private Long number;
    private String email;
    private String managerName;
    private String status;
    private String branchImage;

    @OneToMany(mappedBy = "branchEntity")
    private List<BikeEntity> bike = new ArrayList<>();

}
