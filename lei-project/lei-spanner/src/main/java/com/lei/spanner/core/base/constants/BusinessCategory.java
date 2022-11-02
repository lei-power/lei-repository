package com.lei.spanner.core.base.constants;

/**
 * Description 经营类目
 * Author JunHao
 * Date 2022/3/28
 * Version 1.0
 */
public enum BusinessCategory {

    GRAIN(1,"粮食"),
    CLASSICS(2,"经作"),
    VEGETABLE(3,"蔬菜"),
    ANIMAL_HUSBANDRY(4,"畜牧"),
    AQUATIC_PRODUCTS(5,"水产"),
    OTHER(6,"其他"),
    ERROR(520,"异常ID");

    private int id;

    private String name;

    BusinessCategory(int id, String name) {
        this.id = id;
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public static BusinessCategory getBusinessCategoryById(int id){
        for (BusinessCategory businessCategory:BusinessCategory.values()){
                if (id==businessCategory.getId()){
                    return businessCategory;
                }
        }
        return ERROR;
    }

}
