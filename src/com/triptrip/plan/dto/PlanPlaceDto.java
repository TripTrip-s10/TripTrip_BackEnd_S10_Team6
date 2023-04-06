package com.triptrip.plan.dto;

import java.time.LocalDateTime;

public class PlanPlaceDto {
	private int planPlaceId;
	private int planId;
	private int day;
	private int contentId;
	private LocalDateTime createAt;
	private LocalDateTime updateAt;
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
	public LocalDateTime getCreateAt() {
		return createAt;
	}
	public void setCreateAt(LocalDateTime createAt) {
		this.createAt = createAt;
	}
	public LocalDateTime getUpdateAt() {
		return updateAt;
	}
	public void setUpdateAt(LocalDateTime updateAt) {
		this.updateAt = updateAt;
	}
	@Override
	public String toString() {
		return "PlanPlaceDto [planPlaceId=" + planPlaceId + ", planId=" + planId + ", day=" + day + ", contentId="
				+ contentId + ", createAt=" + createAt + ", updateAt=" + updateAt + "]";
	}
	
}
