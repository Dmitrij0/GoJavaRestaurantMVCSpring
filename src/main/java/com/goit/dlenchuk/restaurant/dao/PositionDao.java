package com.goit.dlenchuk.restaurant.dao;

import com.goit.dlenchuk.restaurant.model.Position;

import java.util.List;

public interface PositionDao {

    void save(Position position);

    void remove(Position position);

    Position load(int id);

    List<Position> findAll();

}
