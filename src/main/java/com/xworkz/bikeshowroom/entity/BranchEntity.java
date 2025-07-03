package com.xworkz.bikeshowroom.entity;

import lombok.*;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor


@Entity
@NamedQuery(name = "checkbranchexistance",query = "select e from BranchEntity e where e.branchName=:branchname")
@NamedQuery(name = "branchwithlimitedbikeslist", query = "SELECT b FROM BranchEntity b WHERE ((SELECT COUNT(bk.id) FROM BikeEntity bk WHERE bk.branchEntity.id = b.id) < 5 )AND b.status = 'active'")
@NamedQuery(name = "totalbranches",query = "SELECT COUNT(b.id) FROM BranchEntity b")
@NamedQuery(name = "getAllBranches", query = "SELECT b FROM BranchEntity b")
@NamedQuery(name = "findById", query = "SELECT b FROM BranchEntity b WHERE b.id = :id")
@NamedQuery(name = "updateBranchDetails", query = "UPDATE BranchEntity b SET b.branchName = :branchName, b.location = :location, b.number = :number, b.managerName = :managerName, b.email = :email, b.status = :status WHERE b.id = :id")
@NamedQuery(name = "deleteBranchById", query = "DELETE FROM BranchEntity b WHERE b.id = :id")
@NamedQuery(name = "branchName",query = "SELECT p.branchName FROM BranchEntity p where p.status = 'active'")
@NamedQuery(name = "getbranchnamefromid",query = "select p.id from BranchEntity p where p.branchName =: branchName")


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
