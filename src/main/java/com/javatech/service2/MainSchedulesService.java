package com.javatech.service2;

import java.util.List;

import javax.inject.Inject;

import com.javatech.dao2.MainSchedulesDao;
import com.javatech.entity.MainSchedulesEntity;

public class MainSchedulesService {
	
	@Inject
	MainSchedulesDao mainSchedulesDao;
	
	public List<MainSchedulesEntity> selectList(String weekInYear) {
		String sql = "select * from main_schedules where week_in_year = ? and status = 1";
		List<MainSchedulesEntity> mainSchedulesEntities = mainSchedulesDao.selecList(sql, weekInYear);
		return mainSchedulesEntities;
	}

	public Integer createMainSchedule(MainSchedulesEntity mainSchedulesEntity) {
		mainSchedulesEntity.setStatus(1);
		return mainSchedulesDao.insertOne(mainSchedulesEntity);
	}
	
//	public Integer insertOne(CourseEntity courseEntity) {
//		courseEntity.setStatus(1);
//		return courseDao.insertOne(courseEntity);
//	}
//
//	public Integer updateOne(CourseEntity courseEntity) {
//		return courseDao.updateOne(courseEntity);
//	}
//
//	public Integer deleteByStatus(Integer id) {
//		CourseEntity courseEntity = new CourseEntity();
//		courseEntity.setId(id);
//		courseEntity.setStatus(-1);
//		return courseDao.updateOne(courseEntity);
//	}
//
//	public CourseEntity selectOne(Integer id) {
//		return courseDao.selectOne(id);
//	}
	
}
