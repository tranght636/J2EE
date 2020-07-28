package com.javatech.controller;

import java.io.IOException;
import java.util.ResourceBundle;

import javax.inject.Inject;
import javax.mail.MessagingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javatech.constant.ActionConstant;
import com.javatech.constant.SystemConstant;
import com.javatech.constant.UrlConstant;
import com.javatech.dto.CommonDTO;
import com.javatech.entity.ResetPasswordEntity;
import com.javatech.entity.UserEntity;
import com.javatech.form.UserForm;
import com.javatech.model.UserModel;
import com.javatech.service.IUserService;
import com.javatech.service2.ResetPasswordService;
import com.javatech.service2.UserService;
import com.javatech.utils.ConvertUtil;
import com.javatech.utils.DispatcherUtil;
import com.javatech.utils.MailUtil;
import com.javatech.utils.SessionUtil;
import com.javatech.utils.StringUtil;

@WebServlet(urlPatterns = { "/login", "/register", "/logout", "/check-session", "/quen-mat-khau", "/doi-mat-khau" })
public class SigninSignupController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Inject
	IUserService userService;
	
	@Inject
	UserService userService2;
	
	@Inject
	ResetPasswordService resetPasswordService;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String action = req.getParameter("action");
		if (action != null) {
			if (action.equals(ActionConstant.REGISTER)) {
				getRegister(req, res);
				return;
			} else if (action.equals(ActionConstant.LOGIN)) {
				getLogin(req, res);
				return;
			} else if (action.equals(ActionConstant.LOGOUT)) {
				getLogout(req, res);
				return;
			} else if (action.equals(ActionConstant.CHECK_SESSION)) {
				getCheckSession(req, res);
				return;
			} else if (action.equals(ActionConstant.QUEN_MAT_KHAU)) {
				getQuenMatKhau(req, res);
				return;
			} else if (action.equals(ActionConstant.DOI_MAT_KHAU)) {
				getDoiMatKhau(req, res);
				return;
			}
		}
	}

	private void getDoiMatKhau(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		setMessage(req);
		DispatcherUtil.returnViewName(req, res, "DoiMatKhau");
	}

	private void getQuenMatKhau(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		setMessage(req);
		DispatcherUtil.returnViewName(req, res, "QuenMatKhau");
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String action = req.getParameter("action");
		if (action != null) {
			if (action.equals(ActionConstant.LOGIN)) {
				postLogin(req, res);
				return;
			} else if(action.equals(ActionConstant.REGISTER)) {
				postRegister(req, res);
				return;
			} else if(action.equals(ActionConstant.QUEN_MAT_KHAU)) {
				try {
					postQuenMatKhau(req, res);
				} catch (ServletException | IOException | MessagingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return;
			} else if(action.equals(ActionConstant.DOI_MAT_KHAU)) {
				postDoiMatKhau(req, res);
				return;
			}
		}
	}
	
	
	private void postDoiMatKhau(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		CommonDTO commonDTO = ConvertUtil.toModelOfController(CommonDTO.class, req);
		ResetPasswordEntity rsEntity = resetPasswordService.findByEmailAndToken(commonDTO.getEmail(), commonDTO.getToken());
		if(rsEntity != null) {
			UserEntity user = new UserEntity();
			userService2.findByEmail(commonDTO.getEmail());
			user.setId(userService2.findByEmail(commonDTO.getEmail()).getId());
			user.setEmail(commonDTO.getEmail());
			user.setPassword(commonDTO.getPassword());
			userService2.update(user);
			DispatcherUtil.redirect(req, res, "/login?action=login&message=capnhatmatkhauthanhcong");
			return;
		}
		DispatcherUtil.redirect(req, res, "/");
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
	
	private void getLogin(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		setMessage(req);
		RequestDispatcher rd = req.getRequestDispatcher("/views/login.jsp");
		rd.forward(req, res);
	}
	
	private void getRegister(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		setMessage(req);
		RequestDispatcher rd = req.getRequestDispatcher("/views/register.jsp");
		rd.forward(req, res);
	}
	
	private void getLogout(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		SessionUtil.getInstance().removeValue(req, "USERMODEL");
		DispatcherUtil.redirect(req, res, UrlConstant.LOGIN);
	}
	
	private void getCheckSession(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		UserModel userModel = (UserModel) SessionUtil.getInstance().getValue(req, SessionUtil.USERMODEL);
		if (userModel != null) {
			DispatcherUtil.redirectByUserRole(req, res, userModel);
		} else {
			res.sendRedirect(req.getContextPath() + "/login?action=login");
		}
	}
	
	
	private void postLogin(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		UserForm userForm = ConvertUtil.toModelOfController(UserForm.class, req);
		UserModel userModel = userService.findByEmailAndPassword(userForm.getEmail(), userForm.getPassword());
		if (userModel == null) {
			DispatcherUtil.redirect(req, res, "/login?action=login&message=username_password_invalid&alert=danger");
			return;
		}
		if(userModel.getStatus() == SystemConstant.STATUS_ACTIVED) {
			SessionUtil.getInstance().putValue(req, "USERMODEL", userModel);
			DispatcherUtil.redirectByUserRole(req, res, userModel);
			return;
		} else if(userModel.getStatus() == SystemConstant.STATUS_APPROVED) {
			DispatcherUtil.redirect(req, res, "/login?action=login&message=tai_khoan_cho_duyet&alert=warning");
			return;
		} else if(userModel.getStatus()== SystemConstant.STATUS_DELETE) {
			DispatcherUtil.redirect(req, res, "/login?action=login&message=tai_khoan_da_bi_xoa&alert=danger");
			return;
		}
	}
	
	private void postRegister(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		//		req.setCharacterEncoding("UTF-8");
		UserModel userModel = ConvertUtil.toModelOfController(UserModel.class, req);
		if(userService.isEmailExist(userModel.getEmail())) {
			DispatcherUtil.redirect(req, res, "/register?action=register&message=email_ton_tai&alert=danger");
			return;
		}
		if(userService.register(userModel) != null) {
			DispatcherUtil.redirect(req, res, "/login?action=login&message=tai_khoan_cho_duyet&alert=success");
		} else {
			DispatcherUtil.redirect(req, res, "/register?action=register");
		}
	}
	
	private void postQuenMatKhau(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException, MessagingException {
		CommonDTO commonDTO = ConvertUtil.toModelOfController(CommonDTO.class, req);
		String email = commonDTO.getEmail();
		if(!StringUtil.isNullOrEmpty(email)) {
			UserEntity userEntity = userService2.findByEmail(email);
			if(userEntity != null) {
				String token = StringUtil.randomString(10);
				ResetPasswordEntity rspw = new ResetPasswordEntity();
				rspw.setEmail(email);
				rspw.setToken(token);
				resetPasswordService.insertOne(rspw);
				String html = "<h2>Token của bạn là</h2><p>" + token + "</p>";
				MailUtil.sendAsHtml(email, "[Trainee manager] Reset password", html);
				DispatcherUtil.redirect(req, res, "/doi-mat-khau?action=doimatkhau");
				return;
			}
		}
		DispatcherUtil.redirect(req, res, "/quen-mat-khau?action=quenmatkhau&message=sai_email");
	}

}
