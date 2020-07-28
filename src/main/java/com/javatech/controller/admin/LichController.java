package com.javatech.controller.admin;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.ResourceBundle;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javatech.constant.ActionConstant;
import com.javatech.entity.LessonEntity;
import com.javatech.entity.MainSchedulesEntity;
import com.javatech.model.ClassesModel;
import com.javatech.model.UserModel;
import com.javatech.service2.ClassesService;
import com.javatech.service2.LessonService;
import com.javatech.service2.MainSchedulesService;
import com.javatech.service2.ThongTinDangKyLichService;
import com.javatech.utils.ConvertUtil;
import com.javatech.utils.DispatcherUtil;
import com.javatech.utils.StringUtil;

@WebServlet(urlPatterns = { "/admin/thong-tin-dang-ky-lich","/admin/soan-thoi-khoa-bieu","/admin/thong-tin-xin-nghi"})
public class LichController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	@Inject
	ThongTinDangKyLichService thongTinDangKyLichService;
	@Inject
	ClassesService classesService;
	@Inject
	LessonService lessonService;
	@Inject
	MainSchedulesService mainSchedulesService;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String action = req.getParameter("action");
		if (action != null) {
			if (action.equals(ActionConstant.THONG_TIN_DANG_KY_LICH)) {
				getThongTinDangKyLich(req, res);
			} else if (action.equals(ActionConstant.SOAN_THOI_KHOA_BIEU)) {
				getThoiKhoaBieu(req, res);
			}else if (action.equals(ActionConstant.THONG_TIN_XIN_NGHI)) {
				getThongTinXinNghi(req, res);
			}
			
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String action = req.getParameter("action");
		if (action != null) {
			if (action.equals(ActionConstant.SOAN_THOI_KHOA_BIEU)) {
				postThoiKhoaBieu(req, res);
			}
		}
	}
	
	private void postThoiKhoaBieu(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
		MainSchedulesEntity mainSchedulesEntity = ConvertUtil.toModelOfController(MainSchedulesEntity.class, req);
		if (mainSchedulesService.createMainSchedule(mainSchedulesEntity) != null) {
			String weekinyear = req.getParameter("weekinyear");
			if(weekinyear != null) {
				DispatcherUtil.redirect(req, res, "/admin/soan-thoi-khoa-bieu?action=soanthoikhoabieu&weekinyear="+weekinyear);
			}
			else {
				DispatcherUtil.redirect(req, res, "/admin/soan-thoi-khoa-bieu?action=soanthoikhoabieu");
			}
			
		}
	}
	
	
	
	
	
	







	ResourceBundle resourceBundle = ResourceBundle.getBundle("message");
	
	private void setMessage(HttpServletRequest req) {
		String message = req.getParameter("message");
		if (message != null) {
			String alert = req.getParameter("alert");
			req.setAttribute("message", resourceBundle.getString(message));
			req.setAttribute("alert", alert);
		}
	}

	private void getThongTinDangKyLich(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
			setMessage(req);
			String weekInYear = req.getParameter("weekinyear");
			Object dsDangKyLich;
			if(StringUtil.isNullOrEmpty(weekInYear)) {
				 dsDangKyLich = thongTinDangKyLichService.findAll();
			}else {
				req.setAttribute("weekInYear", weekInYear);
				dsDangKyLich = thongTinDangKyLichService.findByWeekInYear(weekInYear);
			}
			if (dsDangKyLich != null) {
				req.setAttribute("dsDangKyLich", dsDangKyLich);
			}
		DispatcherUtil.returnViewNameAdminAndSetPageName(req, res, "ThongTinDangKyLich");
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

		DispatcherUtil.returnViewNameAdminAndSetPageName(req, res, "ThoiKhoaBieu");
		
	}
	private void getThongTinXinNghi(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
		DispatcherUtil.returnViewNameAdminAndSetPageName(req, res, "ThongTinXinNghi");
		
	}
	

}
