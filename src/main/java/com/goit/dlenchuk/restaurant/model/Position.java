package com.goit.dlenchuk.restaurant.model;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;

@Entity
@Table(name = "POSITIONS")
public class Position {

    private int pstId;
    private String pstName;

    @Id
    @GenericGenerator(name = "increment", strategy = "increment")
    @GeneratedValue(generator = "increment")
    @Column(name = "PST_ID", nullable = false)
    public int getPstId() {
        return pstId;
    }

    public Position setPstId(int pstId) {
        this.pstId = pstId;
        return this;
    }

    @Column(name = "PST_NAME", nullable = false, unique = true)
    public String getPstName() {
        return pstName;
    }

    public Position setPstName(String pstName) {
        this.pstName = pstName;
        return this;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Position position = (Position) o;

        return pstName.equals(position.pstName);

    }

    @Override
    public int hashCode() {
        return pstName.hashCode();
    }

    @Override
    public String toString() {
        return "Position{" +
                "pstId=" + pstId +
                ", pstName='" + pstName + '\'' +
                '}';
    }
}
