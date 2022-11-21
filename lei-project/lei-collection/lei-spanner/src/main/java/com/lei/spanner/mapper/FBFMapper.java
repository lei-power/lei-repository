package com.lei.spanner.mapper;

import com.lei.spanner.entity.po.FBF;
import java.util.List;


public interface FBFMapper {


    FBF getByfbfbm(String cbht);

    List<FBF> getAll();
}
