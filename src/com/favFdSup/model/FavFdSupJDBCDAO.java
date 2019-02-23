package com.favFdSup.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FavFdSupJDBCDAO implements FavFdSupDAO_Interface {
	
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "COOKGOD";
	String passwd = "123456";
	
	private static final String Insert_Stmt = 
			"INSERT INTO FAV_FD_SUP (CHEF_ID,FOOD_SUP_ID,FAV_FD_SUP_NOTE,FAV_FD_SUP_NUM) VALUES (?,?,?,1)";
	private static final String Update_Stmt = 
			"UPDATE FAV_FD_SUP SET FAV_FD_SUP_NOTE=? ,FAV_FD_SUP_NUM=? WHERE CHEF_ID=? AND FOOD_SUP_ID=? ";
	private static final String Delete_Stmt = 
			"DELETE FROM FAV_FD_SUP WHERE CHEF_ID=? AND FOOD_SUP_ID=? ";
	private static final String Get_One_Stmt = 
			"SELECT * FROM FAV_FD_SUP WHERE CHEF_ID=? AND FOOD_SUP_ID=? ";
	private static final String Get_All_Stmt = 
			"SELECT * FROM FAV_FD_SUP";

	@Override
	public void insert(FavFdSupVO favFdSupVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(Insert_Stmt);
			
			pstmt.setString(1, favFdSupVO.getChef_ID());
			pstmt.setString(2, favFdSupVO.getFood_sup_ID());
			pstmt.setString(3, favFdSupVO.getFav_fd_sup_note());
			
			pstmt.executeUpdate();			
			
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
		} catch (SQLException e) {
			throw new RuntimeException("Database Error : " + e.getMessage());
		} finally {
			if(pstmt!=null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(con!=null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}		 
	}

	@Override
	public void update(FavFdSupVO favFdSupVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(Update_Stmt);
			
			pstmt.setString(1, favFdSupVO.getFav_fd_sup_note());
			pstmt.setInt(2, favFdSupVO.getFav_fd_sup_num());
			pstmt.setString(3, favFdSupVO.getChef_ID());
			pstmt.setString(4, favFdSupVO.getFood_sup_ID());
			
			pstmt.executeUpdate();			
			
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
		} catch (SQLException e) {
			throw new RuntimeException("Database Error : " + e.getMessage());
		} finally {
			if(pstmt!=null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(con!=null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}			
	}

	@Override
	public void delete(String chef_ID, String food_sup_ID) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(food_sup_ID, userid, passwd);
			pstmt = con.prepareStatement(Delete_Stmt);
			
			pstmt.setString(1, chef_ID);
			pstmt.setString(2, food_sup_ID);
			
			pstmt.executeUpdate();
			
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
		} catch (SQLException e) {
			throw new RuntimeException("Database Error : " + e.getMessage());
		} finally {
			if(pstmt!=null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(con!=null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
	}

	@Override
	public FavFdSupVO findByPrimaryKey(String chef_ID, String food_sup_ID) {
		FavFdSupVO favFdSupVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(food_sup_ID, userid, passwd);
			pstmt = con.prepareStatement(Get_One_Stmt);
			
			pstmt.setString(1, chef_ID);
			pstmt.setString(2, food_sup_ID);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				favFdSupVO = new FavFdSupVO();
				favFdSupVO.setChef_ID(rs.getString("CHEF_ID"));
				favFdSupVO.setFood_sup_ID(rs.getString("FOOD_SUP_ID"));
				favFdSupVO.setFav_fd_sup_note(rs.getString("FAV_FD_SUP_NOTE"));
				favFdSupVO.setFav_fd_sup_num(rs.getInt("FAV_FD_SUP_NUM"));				
			}			
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
		} catch (SQLException e) {
			throw new RuntimeException("Database Error : " + e.getMessage());
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if(pstmt!=null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(con!=null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return favFdSupVO;
	}

	@Override
	public List<FavFdSupVO> getAll() {
		List<FavFdSupVO> listAll = new ArrayList<FavFdSupVO>();
		FavFdSupVO favFdSupVO = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(Get_All_Stmt);			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				favFdSupVO = new FavFdSupVO();
				favFdSupVO.setChef_ID(rs.getString("CHEF_ID"));
				favFdSupVO.setFood_sup_ID(rs.getString("FOOD_SUP_ID"));
				favFdSupVO.setFav_fd_sup_note(rs.getString("FAV_FD_SUP_NOTE"));
				favFdSupVO.setFav_fd_sup_num(rs.getInt("FAV_FD_SUP_NUM"));
				listAll.add(favFdSupVO);
			}			
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
		} catch (SQLException e) {
			throw new RuntimeException("Database Error : " + e.getMessage());
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if(pstmt!=null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(con!=null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return listAll;
	}
}
