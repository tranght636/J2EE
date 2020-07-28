package com.javatech.service2;

import javax.inject.Inject;

import com.javatech.dao2.ResetPasswordDao;
import com.javatech.entity.ResetPasswordEntity;

public class ResetPasswordService {
	@Inject
	ResetPasswordDao resetPasswordDao;
	
	public void insertOne(ResetPasswordEntity resetPasswordEntity) {
		resetPasswordDao.insertOne(resetPasswordEntity);
	}

	public ResetPasswordEntity findByEmailAndToken(String email, String token) {
		return resetPasswordDao.findByEmailAndToken(email, token);
	}
}
