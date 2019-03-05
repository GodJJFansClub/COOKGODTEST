package com.cust.model;

import java.util.*;

public interface CustDAO_interface {
	public void insert(CustVO custVO);
	public void update(CustVO custVO);
	public void delete(String cust_ID);
	public CustVO findByPrimaryKey(String cust_ID);
	public CustVO findByCust_acc(String cust_acc);
	public List<CustVO> getAll();

}
