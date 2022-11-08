package com.lei.spanner.core.base.model;

import org.apache.velocity.VelocityContext;

public interface Callback {

    public void write(ConfigContext configContext, VelocityContext context);
}
