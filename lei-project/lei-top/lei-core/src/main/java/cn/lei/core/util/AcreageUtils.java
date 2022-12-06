package cn.lei.core.util;

import java.math.BigDecimal;
import lombok.NoArgsConstructor;

@NoArgsConstructor
public class AcreageUtils {

    public static BigDecimal muFormatFen(BigDecimal area) {
        return area.multiply(new BigDecimal(10)).setScale(2, BigDecimal.ROUND_HALF_DOWN);
    }

    public static BigDecimal muFormatSqm(BigDecimal area) {
        return area.multiply(new BigDecimal(666.6666667)).setScale(2, BigDecimal.ROUND_HALF_DOWN);

    }

    public static BigDecimal fenFormatMu(BigDecimal area) {
        return area.divide(new BigDecimal(10), 2, BigDecimal.ROUND_HALF_DOWN);
    }

    public static BigDecimal fenFormatSqm(BigDecimal area) {
        return area.divide(new BigDecimal(10), 2, BigDecimal.ROUND_HALF_DOWN).multiply(new BigDecimal(666.6666667)).setScale(2, BigDecimal.ROUND_HALF_DOWN);
    }

    public static BigDecimal sqmFormatMu(BigDecimal area) {
        return area.divide(new BigDecimal(666.6666667), 2, BigDecimal.ROUND_HALF_DOWN);
    }

    public static BigDecimal sqmFormatFen(BigDecimal area) {
        return area.divide(new BigDecimal(666.6666667), 2, BigDecimal.ROUND_HALF_DOWN).multiply(new BigDecimal(10)).setScale(2, BigDecimal.ROUND_HALF_DOWN);
    }

}
