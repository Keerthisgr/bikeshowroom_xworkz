package com.xworkz.bikeshowroom.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.web.multipart.MultipartFile;

import javax.persistence.*;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@NamedQuery(name="checkmodelexistance",query ="select m from BikeEntity m where m.model =: model")
@NamedQuery(name = "addshowroom",query = "UPDATE BikeEntity b SET b.branchEntity.id = :branchId WHERE b.id = :bikeId")
@NamedQuery(name = "listofbikesnotselected",query = "select u from BikeEntity u where u.branchEntity.id IS NULL")
@NamedQuery(name = "totalbikes",query = "SELECT COUNT(b.id) FROM BikeEntity b")
@NamedQuery(name = "getAllBikes", query = "SELECT b FROM BikeEntity b")




public class BikeEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String model;
    private String bikename;
    private String engine;
    private String milage;
    private Long price;
    private String color;
    private String frontimage;
    private String backimage;
    private String leftimage;
    private String rightimage;

    @ManyToOne
    private BranchEntity branchEntity;

}
