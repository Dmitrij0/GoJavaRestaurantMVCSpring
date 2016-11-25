package com.goit.dlenchuk.restaurant.service;

import com.goit.dlenchuk.restaurant.dao.EmployeeDao;
import com.goit.dlenchuk.restaurant.model.Employee;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class EmployeeService {

    private final EmployeeDao employeeDao;

    @Autowired
    public EmployeeService(EmployeeDao employeeDao) {
        this.employeeDao = employeeDao;
    }

    @Transactional
    public List<Employee> findAll() {
        return employeeDao.findAll();
    }

    @Transactional
    public Employee load(int empId) {
        return employeeDao.load(empId);
    }

}
