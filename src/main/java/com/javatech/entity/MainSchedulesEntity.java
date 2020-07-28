package com.javatech.entity;

import java.sql.Timestamp;

import com.javatech.anotatiton.Column;
import com.javatech.anotatiton.Table;

@Table("main_schedules")
public class MainSchedulesEntity extends CommonEntity {
	@Column("room_id")
	Integer room_id;
	@Column("lesson_id")
	Integer lesson_id;
	@Column("trainer_name")
	String trainer_name;
	@Column("week_in_year")
	String week_in_year;
	@Column("day")
	String day;
	@Column("start_time")
	Timestamp start_time;
	@Column("end_time")
	Timestamp end_time;
	@Column("note")
	String note;
	@Column("thoi_gian")
	String thoi_gian;
	
	@Column("name_room")
	String name_room;
	@Column("sl")
	String sl;
	
	public String getName_room() {
		return name_room;
	}
	public void setName_room(String name_room) {
		this.name_room = name_room;
	}
	public String getSl() {
		return sl;
	}
	public void setSl(String sl) {
		this.sl = sl;
	}
	public String getThoi_gian() {
		return thoi_gian;
	}
	public void setThoi_gian(String thoi_gian) {
		this.thoi_gian = thoi_gian;
	}
	public Integer getRoom_id() {
		return room_id;
	}
	public void setRoom_id(Integer room_id) {
		this.room_id = room_id;
	}
	public Integer getLesson_id() {
		return lesson_id;
	}
	public void setLesson_id(Integer lesson_id) {
		this.lesson_id = lesson_id;
	}
	public String getTrainer_name() {
		return trainer_name;
	}
	public void setTrainer_name(String trainer_name) {
		this.trainer_name = trainer_name;
	}
	public String getWeek_in_year() {
		return week_in_year;
	}
	public void setWeek_in_year(String week_in_year) {
		this.week_in_year = week_in_year;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public Timestamp getStart_time() {
		return start_time;
	}
	public void setStart_time(Timestamp start_time) {
		this.start_time = start_time;
	}
	public Timestamp getEnd_time() {
		return end_time;
	}
	public void setEnd_time(Timestamp end_time) {
		this.end_time = end_time;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}

}
