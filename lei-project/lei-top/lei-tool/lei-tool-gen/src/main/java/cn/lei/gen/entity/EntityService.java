package cn.lei.gen.entity;

import java.util.Properties;
import org.apache.velocity.VelocityContext;
import org.apache.velocity.app.Velocity;
import org.apache.velocity.app.VelocityEngine;

/**
 * @author lujianing01@58.com
 * @Description:
 * @date 2015/12/18
 */
public class EntityService{

    public static void doGenerator(ConfigContext configContext, Object data,Callback callback) {
        //配置velocity的资源加载路径
        Properties velocityPros = new Properties();
        velocityPros.setProperty(VelocityEngine.FILE_RESOURCE_LOADER_PATH, configContext.getSourcePath());
        velocityPros.setProperty(Velocity.ENCODING_DEFAULT, "UTF-8");
        velocityPros.setProperty(Velocity.INPUT_ENCODING, "UTF-8");
        velocityPros.setProperty(Velocity.OUTPUT_ENCODING, "UTF-8"); 
        Velocity.init(velocityPros);

        //封装velocity数据
        VelocityContext context = new VelocityContext();
        context.put("table", configContext.getTargetTable());
        context.put("entity", configContext.getTargetName());

        String entity = configContext.getTargetName();
        String entityFirstLower = entity;
        if(!Character.isLowerCase(entity.charAt(0))){
            entityFirstLower =  (new StringBuilder()).append(Character.toLowerCase(entity.charAt(0))).append(entity.substring(1)).toString();
        }

        context.put("entityFirstLower", entityFirstLower);
        context.put("entityAllLower", entity.toLowerCase());
        context.put("package", configContext.getTargetPackage());
        context.put("columns", data);

        callback.write(configContext, context);

    }
}
