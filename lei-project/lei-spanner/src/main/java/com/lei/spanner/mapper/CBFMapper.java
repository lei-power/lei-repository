package com.lei.spanner.mapper;

import com.lei.spanner.entity.po.CBF;
import java.util.List;


public interface CBFMapper {


    CBF getBycbfbm(String cbfbm);

    List<CBF> getAll();
}
