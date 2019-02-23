package com.festMenu.model;

import java.sql.Date;
import java.util.List;

import com.festOrder.model.FestOrder_Interface;

public class FestMenuService {

	private FestMenu_Interface dao;

	public FestMenuService() {

		dao = new FestMenuDAO();
	}

	public FestMenuVO addFestMenu(String fest_m_name, Integer fest_m_qty, Date fest_m_start, Date fest_m_end,
			byte[] fest_m_pic, String fest_m_resume, Date fest_m_send, String fest_m_status, String fest_m_kind,
			String chef_ID) {

		FestMenuVO festMenuVO = new FestMenuVO();

		festMenuVO.setFest_m_name(fest_m_name);

		festMenuVO.setFest_m_qty(fest_m_qty);
		festMenuVO.setFest_m_start(fest_m_start);
		festMenuVO.setFest_m_end(fest_m_end);
		festMenuVO.setFest_m_pic(fest_m_pic);
		festMenuVO.setFest_m_resume(fest_m_resume);
		festMenuVO.setFest_m_send(fest_m_send);
		festMenuVO.setFest_m_status(fest_m_status);
		festMenuVO.setFest_m_kind(fest_m_kind);
		festMenuVO.setChef_ID(chef_ID);
		dao.insert(festMenuVO);

		return festMenuVO;

	}

	public FestMenuVO updateFestMenu(String fest_m_name, Integer fest_m_qty, Date fest_m_start, Date fest_m_end,
			byte[] fest_m_pic, String fest_m_resume, Date fest_m_send, String fest_m_status, String fest_m_kind,
			String chef_ID) {

		FestMenuVO festMenuVO = new FestMenuVO();

		festMenuVO.setFest_m_name(fest_m_name);

		festMenuVO.setFest_m_qty(fest_m_qty);
		festMenuVO.setFest_m_start(fest_m_start);
		festMenuVO.setFest_m_end(fest_m_end);
		festMenuVO.setFest_m_pic(fest_m_pic);
		festMenuVO.setFest_m_resume(fest_m_resume);
		festMenuVO.setFest_m_send(fest_m_send);
		festMenuVO.setFest_m_status(fest_m_status);
		festMenuVO.setFest_m_kind(fest_m_kind);
		festMenuVO.setChef_ID(chef_ID);
		dao.update(festMenuVO);
		return festOrderVO;

	}

	public void deleteFestOrder(String fest_or_ID) {
		dao.delete(fest_or_ID);
	}

	public FestOrderVO getOneFestOrder(String fest_or_ID) {
		return dao.findByPrimaryKey(fest_or_ID);
	}

	public List<FestOrderVO> getAll() {
		return dao.getAll();
	}
}
