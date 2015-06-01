package org.chonger.service.task;

import java.util.TimerTask;

public class NzlbTask extends TimerTask {

	@Override
	public void run() {
		/*
		 * 1:获取指定类型的牛只信息，
		 *     获取大育成牛信息，判断月龄是否在15-18个月，发出可配种信息，牛只状态更新为可配种
		 *     牛只登记配种信息，变更牛只状态为已配种，开始记录天数，28天左右发出初检提示，配种后60天提示复检
		 *     
		 *     确认怀孕后牛只类型变更为妊娠期，开始记录天数，平均280天。确认怀孕，最后一次配种时间开始计算
		 *     
		 *     
		 *     
		 *     
		 *     空杯牛
		 *     
		 *     干奶期
		 *     
		 *     
		 * 
		 * 
		 */

	}

}
