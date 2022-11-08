package com.lei.spanner.mapper;

import com.lei.spanner.entity.po.CBHT;
import java.util.List;


public interface CBHTMapper {

    CBHT getBycbhtbm(String cbhtbm);

    List<CBHT> getAll();
}
