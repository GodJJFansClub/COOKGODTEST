package com.ad.model;

import java.util.*;


public interface AdDAO_interface {
	public void insert(AdVO adVO);
    public void update(AdVO adVO);
    public void delete(String ad_ID);
    public AdVO findByPrimaryKey(String ad_ID);
    public List<AdVO> getAll();
}
