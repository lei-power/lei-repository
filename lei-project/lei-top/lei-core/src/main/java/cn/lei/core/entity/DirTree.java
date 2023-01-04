package cn.lei.core.entity;

import java.util.List;
import lombok.Data;

/***
 *@author wanglei
 *@Date 2023/1/4 17:54
 ***/

@Data
public class DirTree {

    private String name;
    private String path;
    private String level;
    private List<DirTree> subTree;

}
