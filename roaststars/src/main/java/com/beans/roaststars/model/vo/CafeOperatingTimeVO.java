package com.beans.roaststars.model.vo;

public class CafeOperatingTimeVO {
	private String weekdayTime;
	private String weekendTime;
	private String holidayTime;
	
	public CafeOperatingTimeVO() {
		super();
	}

	public CafeOperatingTimeVO(String weekdayTime, String weekendTime, String holidayTime) {
		super();
		this.weekdayTime = weekdayTime;
		this.weekendTime = weekendTime;
		this.holidayTime = holidayTime;
	}

	public String getWeekdayTime() {
		return weekdayTime;
	}

	public void setWeekdayTime(String weekdayTime) {
		this.weekdayTime = weekdayTime;
	}

	public String getWeekendTime() {
		return weekendTime;
	}

	public void setWeekendTime(String weekendTime) {
		this.weekendTime = weekendTime;
	}

	public String getHolidayTime() {
		return holidayTime;
	}

	public void setHolidayTime(String holidayTime) {
		this.holidayTime = holidayTime;
	}

	@Override
	public String toString() {
		return "CafeOperatingTimeVO [weekdayTime=" + weekdayTime + ", weekendTime=" + weekendTime + ", holidayTime="
				+ holidayTime + "]";
	}
	
}
