package com.goit.dlenchuk.restaurant.dao.hibernate;

import com.goit.dlenchuk.restaurant.dao.EmployeeDao;
import com.goit.dlenchuk.restaurant.model.Employee;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public class EmployeeDaoHibernate implements EmployeeDao {

    private final SessionFactory sessionFactory;

    @Autowired
    public EmployeeDaoHibernate(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    @Transactional
    public void save(Employee employee) {
        sessionFactory.getCurrentSession().save(employee);
    }

    @Override
    @Transactional
    public void remove(Employee employee) {
        sessionFactory.getCurrentSession().delete(employee);
    }

    @Override
    @Transactional
    public Employee load(int id) {
        Employee employee = sessionFactory.getCurrentSession().load(Employee.class, id);
        if (employee == null) {
            throw new RuntimeException("Can't load Employee. Invalid id: " + id);
        }
        return employee;
    }

    @Override
    @Transactional
    public List<Employee> findAll() {
        return sessionFactory
                .getCurrentSession()
                .createQuery("from Employee", Employee.class)
                .list();
    }

}
