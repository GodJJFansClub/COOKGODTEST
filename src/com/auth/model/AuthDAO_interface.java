package com.auth.model;

import java.util.List;

public interface AuthDAO_interface {
	public void insert(AuthVO authVO);
	public void update(AuthVO authVO);
	public void delete(String auth_ID);
	public AuthVO findByPrimaryKey(String auth_ID);
	public List<AuthVO> getAll();
}
