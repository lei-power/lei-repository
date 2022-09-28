package com.atguigu.design.behavioral.chain.demo;

import java.util.ArrayList;
import java.util.List;

/***
 *@author wanglei
 *@Date 2022/2/18 15:41
 ***/


public class Chain implements Filter {

    private List<Filter> filterChains = new ArrayList<>();
    private int cursor = 0;
    private TargetMethod target;

    public TargetMethod getTarget() {
        return target;
    }

    public void setTarget(TargetMethod target) {
        this.target = target;
    }

    public List<Filter> getFilterChains() {
        return filterChains;
    }

    public void setFilterChains(List<Filter> filterChains) {
        this.filterChains = filterChains;
    }

    Chain addFilter(Filter filter) {
        filterChains.add(filter);
        return this;
    }


    @Override
    public void doFilter(Chain chain) {
        if (cursor >= filterChains.size()) {
            target.demo();
            return;
        }
        Filter filter = filterChains.get(cursor);
        cursor++;
        filter.doFilter(chain);
    }
}
