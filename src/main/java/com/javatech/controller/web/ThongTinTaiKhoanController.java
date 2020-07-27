package com.javatech.controller.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javatech.utils.DispatcherUtil;


@WebServlet(urlPatterns = { "/thong-tin-tai-khoan"})
public class ThongTinTaiKhoanController extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		DispatcherUtil.returnViewName(req, res, "web/ThongTinTaiKhoan");
	}
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {


	}
}
