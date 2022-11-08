package cn.lei.gen.entity;

import org.apache.velocity.VelocityContext;

public interface Callback {
	public void write(ConfigContext configContext, VelocityContext context);
}
