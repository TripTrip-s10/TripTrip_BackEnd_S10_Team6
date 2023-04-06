package com.triptrip.plan.dto;

public class PlanPlaceDto {
	private int planPlaceId;
	private int planId;
	private int day;
	private int contentId;
	private int order;
	public int getPlanPlaceId() {
		return planPlaceId;
	}
	public void setPlanPlaceId(int planPlaceId) {
		this.planPlaceId = planPlaceId;
	}
	public int getPlanId() {
		return planId;
	}
	public void setPlanId(int planId) {
		this.planId = planId;
	}
	public int getDay() {
		return day;
	}
	public void setDay(int day) {
		this.day = day;
	}
	public int getContentId() {
		return contentId;
	}
	public void setContentId(int contentId) {
		this.contentId = contentId;
	}
	public int getOrder() {
		return order;
	}
	public void setOrder(int order) {
		this.order = order;
	}
	@Override
	public String toString() {
		return "PlanPlaceDto [planPlaceId=" + planPlaceId + ", planId=" + planId + ", day=" + day + ", contentId="
				+ contentId + ", order=" + order + "]";
	}
	
}
