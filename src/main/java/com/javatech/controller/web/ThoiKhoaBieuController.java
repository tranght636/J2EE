package com.javatech.controller.web;

import java.io.IOException;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javatech.entity.LessonEntity;
import com.javatech.entity.MainSchedulesEntity;
import com.javatech.model.ClassesModel;
import com.javatech.service2.ClassesService;
import com.javatech.service2.LessonService;
import com.javatech.service2.MainSchedulesService;
import com.javatech.service2.ThongTinDangKyLichService;
import com.javatech.utils.DispatcherUtil;


@WebServlet(urlPatterns = { "/thoi-khoa-bieu"})
public class ThoiKhoaBieuController extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Inject
	ThongTinDangKyLichService thongTinDangKyLichService;
	@Inject
	ClassesService classesService;
	@Inject
	LessonService lessonService;
	@Inject
	MainSchedulesService mainSchedulesService;
	
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		getThoiKhoaBieu(req, res);
		
	}
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {


	}
	
	private void getThoiKhoaBieu(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
		Object lessons = lessonService.selectAll();
		req.setAttribute("lessons", lessons);
		
		List<ClassesModel> dsClasses = (List<ClassesModel>) classesService.findAll();
		if (dsClasses != null) {
			req.setAttribute("dsClasses", dsClasses);
		}
		List<LessonEntity> lesson = (List<LessonEntity>) lessonService.selectAll();
		HashMap< Integer, LessonEntity> mapLesson= new HashMap<Integer, LessonEntity>();
		for(LessonEntity ms:lesson) {
			mapLesson.put(ms.getId(), ms);
		}
		req.setAttribute("mapLesson", mapLesson);
		
		String weekinyear = req.getParameter("weekinyear");
		if(weekinyear == null) {
			Calendar sDateCalendar = new GregorianCalendar();
			weekinyear = sDateCalendar.get(Calendar.YEAR)+"-W"+sDateCalendar.get(Calendar.WEEK_OF_YEAR);
		}
		List<MainSchedulesEntity> mainSchedules = mainSchedulesService.selectList(weekinyear);
		HashMap< String, MainSchedulesEntity> mapSchedules= new HashMap<String, MainSchedulesEntity>();
		for(MainSchedulesEntity ms:mainSchedules) {
			mapSchedules.put(ms.getDay(), ms);
		}
		req.setAttribute("mapSchedules", mapSchedules);
		req.setAttribute("weekinyear", weekinyear);


		DispatcherUtil.returnViewName(req, res, "web/ThoiKhoaBieu");
		
	}
}
