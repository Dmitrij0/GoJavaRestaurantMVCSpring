package com.goit.dlenchuk.restaurant.dao.hibernate;

import com.goit.dlenchuk.restaurant.dao.PositionDao;
import com.goit.dlenchuk.restaurant.model.Position;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public class PositionDaoHibernate implements PositionDao{

    private final SessionFactory sessionFactory;

    @Autowired
    public PositionDaoHibernate(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    @Transactional
    public void save(Position position) {
        sessionFactory.getCurrentSession().save(position);
    }

    @Override
    @Transactional
    public void remove(Position position) {
        sessionFactory.getCurrentSession().delete(position);
    }

    @Override
    public Position load(int id) {
        Position position = sessionFactory.getCurrentSession().load(Position.class, id);
        if (position == null) {
            throw new RuntimeException("Can't load Position. Invalid id: " + id);
        }
        return position;
    }

    @Override
    public List<Position> findAll() {
        return sessionFactory
                .getCurrentSession()
                .createQuery("from Position", Position.class)
                .list();
    }

}
