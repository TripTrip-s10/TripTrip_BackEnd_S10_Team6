package com.triptrip.plan.dto;

import java.util.Date;

public class PlanDto {
	private int planId;
	private String title;
	private String startDate;
	private String endDate;
	private String userId;
	public int getPlanId() {
		return planId;
	}
	public void setPlanId(int planId) {
		this.planId = planId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	@Override
	public String toString() {
		return "PlanDto [planId=" + planId + ", title=" + title + ", startDate=" + startDate + ", endDate=" + endDate
				+ ", userId=" + userId + "]";
	}
	

	
	
}
