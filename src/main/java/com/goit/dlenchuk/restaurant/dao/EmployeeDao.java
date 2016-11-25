package com.goit.dlenchuk.restaurant.dao;

import com.goit.dlenchuk.restaurant.model.Employee;

import java.util.List;

public interface EmployeeDao {

    void save(Employee employee);

    void remove(Employee employee);

    Employee load(int id);

    List<Employee> findAll();

}
