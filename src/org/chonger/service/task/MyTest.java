package org.chonger.service.task;

import java.util.TimerTask;

public class MyTest extends TimerTask {

	@Override
	public void run() {
		System.out.println("定时任务测试！");
	}

}
