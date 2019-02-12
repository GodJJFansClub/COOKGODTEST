package com.ad.model;

import java.util.*;


public interface AdDAO_interface {
	public void insert(AdVO adVO);
    public void update(AdVO adVO);
    public void delete(String adid);
    public AdVO findByPrimaryKey(String adid);
    public List<AdVO> getAll();
}
