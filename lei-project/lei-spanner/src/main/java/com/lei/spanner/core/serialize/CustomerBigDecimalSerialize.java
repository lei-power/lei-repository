package com.lei.spanner.core.serialize;




import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.SerializerProvider;

import java.io.IOException;
import java.math.BigDecimal;

public class CustomerBigDecimalSerialize  extends JsonSerializer<BigDecimal> {



    @Override
    public void serialize(BigDecimal value, JsonGenerator gen, SerializerProvider serializers) throws IOException, JsonProcessingException {
        if (value != null && value.compareTo(new BigDecimal(0)) > 0){
            BigDecimal bigDecimal = value.setScale(2, BigDecimal.ROUND_HALF_UP);
            gen.writeNumber(bigDecimal);
        }else{
            gen.writeNumber(0);
        }
    }
}
