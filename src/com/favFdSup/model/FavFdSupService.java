package com.favFdSup.model;

import java.util.List;

public class FavFdSupService {
	
	private FavFdSupDAO_Interface dao;
	
	public FavFdSupService() {
		dao=new FavFdSupDAO();
	}
	
	public FavFdSupVO addFavFdSup(String chef_ID, String food_sup_ID, String fav_fd_sup_note, Integer fav_fd_sup_num) {
		
		FavFdSupVO favFdSupVO = new FavFdSupVO();
		favFdSupVO.setChef_ID(chef_ID);
		favFdSupVO.setFood_sup_ID(food_sup_ID);
		favFdSupVO.setFav_fd_sup_note(fav_fd_sup_note);
		favFdSupVO.setFav_fd_sup_num(fav_fd_sup_num);
		dao.insert(favFdSupVO);
		
		return favFdSupVO;
	}
	public FavFdSupVO updateFavFdSup(String chef_ID, String food_sup_ID, String fav_fd_sup_note, Integer fav_fd_sup_num) {
		
		FavFdSupVO favFdSupVO = new FavFdSupVO();
		favFdSupVO.setChef_ID(chef_ID);
		favFdSupVO.setFood_sup_ID(food_sup_ID);
		favFdSupVO.setFav_fd_sup_note(fav_fd_sup_note);
		favFdSupVO.setFav_fd_sup_num(fav_fd_sup_num);
		dao.update(favFdSupVO);
		
		return favFdSupVO;
	}
	public void deleteFavFdSup(String chef_ID, String food_sup_ID) {
		dao.delete(chef_ID, food_sup_ID);
	}
	public FavFdSupVO getOneFavFdSup(String chef_ID, String food_sup_ID) {
		return dao.findByPrimaryKey(chef_ID, food_sup_ID);
	}
	public List<FavFdSupVO> getAll(){
		return dao.getAll();
	}
}
