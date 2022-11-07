package cn.lei.all.entity.dto;

import java.io.Serializable;
import lombok.Data;

/**
 * @author ： coder.Yang
 * @date ： 2022/8/4 19:11
 * @description ：
 */
@Data
public class ValidateDTO implements Serializable {

    private static final long serialVersionUID = -3111498071684686829L;
    private String imgBase64Str;

    private String codeId;
}
