package com.goit.dlenchuk.restaurant.model;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import javax.validation.constraints.Pattern;
import java.time.LocalDate;
import java.util.Map;

@Entity
@Table(name = "EMPLOYEE")
public class Employee {

    private int empId;
    private String empLastName;
    private String empFirstName;
    private String empNickname;
    private String empPassword;
    private LocalDate empBirthday;
    private String empPhone;
    private Map<Position, Integer> positions;

    public Employee() {
    }

    @Id
    @GenericGenerator(name = "increment", strategy = "increment")
    @GeneratedValue(generator = "increment")
    @Column(name = "EMP_ID")
    public int getEmpId() {
        return empId;
    }

    public Employee setEmpId(int id) {
        this.empId = id;
        return this;
    }

    @Column(name = "EMP_LAST_NAME", length = 50, nullable = false)
    public String getEmpLastName() {
        return empLastName;
    }

    public Employee setEmpLastName(String empLastName) {
        this.empLastName = empLastName;
        return this;
    }

    @Column(name = "EMP_FIRST_NAME", length = 50, nullable = false)
    public String getEmpFirstName() {
        return empFirstName;
    }

    public Employee setEmpFirstName(String empFirstName) {
        this.empFirstName = empFirstName;
        return this;
    }

    @Column(name = "EMP_NICKNAME", length = 10, nullable = false)
    public String getEmpNickname() {
        return empNickname;
    }

    public Employee setEmpNickname(String empNickname) {
        this.empNickname = empNickname;
        return this;
    }

    @Column(name = "EMP_PASSWORD", length = 10, nullable = false)
    public String getEmpPassword() {
        return empPassword;
    }

    public Employee setEmpPassword(String empPassword) {
        this.empPassword = empPassword;
        return this;
    }

    @Column(name = "EMP_BIRTHDAY", nullable = false)
    public LocalDate getEmpBirthday() {
        return empBirthday;
    }

    public Employee setEmpBirthday(LocalDate empBirthday) {
        this.empBirthday = empBirthday;
        return this;
    }

    @Column(name = "EMP_PHONE", length = 20, nullable = false)
    @Pattern(regexp = "^\\+38\\(0\\d{2}\\)\\d{3}-\\d{2}-\\d{2}$")
    public String getEmpPhone() {
        return empPhone;
    }

    public Employee setEmpPhone(String empPhone) {
        this.empPhone = empPhone;
        return this;
    }

    @ElementCollection(fetch = FetchType.EAGER)
    @CollectionTable(name = "POSITION_OF_EMPLOYEE", joinColumns = @JoinColumn(name = "EMP_ID"))
    @MapKeyJoinColumn(name = "PST_ID")
    @Column(name = "POE_SALARY")
    public Map<Position, Integer> getPositions() {
        return positions;
    }


    public Employee setPositions(Map<Position, Integer> positions) {
        this.positions = positions;
        return this;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Employee employee = (Employee) o;

        if (!empLastName.equals(employee.empLastName)) return false;
        if (!empFirstName.equals(employee.empFirstName)) return false;
        if (!empBirthday.equals(employee.empBirthday)) return false;
        return empPhone.equals(employee.empPhone);

    }

    @Override
    public int hashCode() {
        int result = empLastName.hashCode();
        result = 31 * result + empFirstName.hashCode();
        result = 31 * result + empBirthday.hashCode();
        result = 31 * result + empPhone.hashCode();
        return result;
    }

    @Override
    public String toString() {
        return "Employee{" +
                "empId=" + empId +
                ", empLastName='" + empLastName + '\'' +
                ", empFirstName='" + empFirstName + '\'' +
                ", empNickname='" + empNickname + '\'' +
                ", empPassword='" + empPassword + '\'' +
                ", empBirthday=" + empBirthday +
                ", empPhone='" + empPhone + '\'' +
                ", positions='" + positions + '\'' +
                '}';
    }
}
