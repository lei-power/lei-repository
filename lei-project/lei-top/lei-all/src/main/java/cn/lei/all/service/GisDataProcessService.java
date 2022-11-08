//package cn.lei.all.service;
//
//import com.lei.spanner.core.base.constants.DictCons;
//import com.lei.spanner.core.client.MsSdeSqlUtil;
//import java.util.List;
//import java.util.Map;
//import lombok.extern.slf4j.Slf4j;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Service;
//
///***
// *@author wanglei
// *@Date 2022/11/4 18:02
// ***/
//
//@Slf4j
//@Service
//public class GisDataProcessService {
//
//    @Autowired
//    private MsSdeSqlUtil msSdeSqlUtil;
//
//
//    public String showTableName(Integer type) {
//        String prifix = DictCons.GisType.get(type);
//        String likeStr ="";
//        if (prifix != null) {
//           likeStr=" AND NAME LIKE '%"+prifix+"'";
//        }
//        String sql = "SELECT NAME FROM SYSOBJECTS WHERE XTYPE='U' AND NAME LIKE 'TBL%' "+likeStr+" ORDER BY NAME";
//        List<Map<String, Object>> list = msSdeSqlUtil.queryBySql(sql);
//        StringBuilder stringBuilder = new StringBuilder();
//        for (Map<String, Object> map : list) {
//            stringBuilder.append(map.get("NAME") + "\n");
//        }
//        return stringBuilder.toString();
//    }
//}
