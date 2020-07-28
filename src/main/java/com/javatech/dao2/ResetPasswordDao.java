package com.javatech.dao2;

import java.util.List;

import com.javatech.entity.ResetPasswordEntity;

public class ResetPasswordDao extends CommonDao<ResetPasswordEntity> {

	public ResetPasswordEntity findByEmailAndToken(String email, String token) {
		String sql = "select * from reset_password where email = ? and token = ?";
		List<ResetPasswordEntity> list = selecList(sql, email, token);
		if(list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

}
