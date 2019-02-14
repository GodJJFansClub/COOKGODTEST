package com.foodSup.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class FoodSupJDBCDAO implements FoodSupDAO_interface {
	private static final String DRIVER = "oracle.jdbc.driver.OracleDriver";
	private static final String URL = "jdbc:oracle:thin:@localhost:1521:XE";
	private static final String USER = "COOKGOD";
	private static final String PASSWORD = "123456";
	private static final String INSERT_STMT = "INSERT INTO FOOD_SUP (FOOD_SUP_ID, FOOD_SUP_NAME, FOOD_SUP_TEL, FOOD_SUP_STATUS, FOOD_SUP_RESUME) VALUES (?, ?, ?, ?, ?)";
	private static final String UPDATE_STMT = "UPDATE FOOD_SUP SET FOOD_SUP_NAME = ?, FOOD_SUP_TEL = ?, FOOD_SUP_STATUS = ?, FOOD_SUP_RESUME = ? WHERE FOOD_SUP_ID = ?";
	private static final String DELETE_STMT = "DELETE FROM FOOD_SUP WHERE FOOD_SUP_ID = ?";
	private static final String GET_ALL_STMT = "SELECT * FROM FOOD_SUP";
	private static final String GET_ONE_STMT = "SELECT * FROM FOOD_SUP WHERE FOOD_SUP_ID = ?";
	
	@Override
	public void insert(FoodSupVO foodSupVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {

			Class.forName(DRIVER);
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, foodSupVO.getFoodSupId());
			pstmt.setString(2, foodSupVO.getFoodSupName());
			pstmt.setString(3, foodSupVO.getFoodSupTel());
			pstmt.setString(4, foodSupVO.getFoodSupStatus());
			pstmt.setString(5, foodSupVO.getFoodSupResume());			
			

			pstmt.executeUpdate();
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		
	}

	@Override
	public void update(FoodSupVO foodSupVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {

			Class.forName(DRIVER);
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = con.prepareStatement(UPDATE_STMT);

			pstmt.setString(1, foodSupVO.getFoodSupName());
			pstmt.setString(2, foodSupVO.getFoodSupTel());
			pstmt.setString(3, foodSupVO.getFoodSupStatus());
			pstmt.setString(4, foodSupVO.getFoodSupResume());			
			pstmt.setString(5, foodSupVO.getFoodSupId());
			

			pstmt.executeUpdate();
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
	}

	@Override
	public void delete(String foodSupId) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(DRIVER);
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			con.setAutoCommit(false);
			
			pstmt = con.prepareStatement(DELETE_STMT);
			pstmt.setString(1, foodSupId);
;
			
			pstmt.executeUpdate();
			
			con.commit();
			con.setAutoCommit(true);
		}catch(ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
		}catch(SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
		}finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
	}

	@Override
	public FoodSupVO findByPrimaryKey(String foodSupId) {
		FoodSupVO foodSupVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		
		try {
			Class.forName(DRIVER);
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = con.prepareStatement(GET_ONE_STMT);
				
			pstmt.setString(1, foodSupId);
			
			rs = pstmt.executeQuery();
				
			while(rs.next()) {
				foodSupVO = new FoodSupVO();
				foodSupVO.setFoodSupId(rs.getString(1));
				foodSupVO.setFoodSupName(rs.getString(2));
				foodSupVO.setFoodSupTel(rs.getString(3));
				foodSupVO.setFoodSupStatus(rs.getString(4));
				foodSupVO.setFoodSupResume(rs.getString(5));
									
			}
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
		}finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}

		return foodSupVO;
	}

	@Override
	public List<FoodSupVO> getAll() {
		List<FoodSupVO> foodSupVOs = new ArrayList<FoodSupVO>();
		FoodSupVO foodSupVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName(DRIVER);
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = con.prepareStatement(GET_ALL_STMT);
				
			
			rs = pstmt.executeQuery();
				
			while(rs.next()) {
				foodSupVO = new FoodSupVO();
				foodSupVO.setFoodSupId(rs.getString(1));
				foodSupVO.setFoodSupName(rs.getString(2));
				foodSupVO.setFoodSupTel(rs.getString(3));
				foodSupVO.setFoodSupStatus(rs.getString(4));
				foodSupVO.setFoodSupResume(rs.getString(5));
				foodSupVOs.add(foodSupVO);
			}
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
		}finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}

		return foodSupVOs;
	}
	
	public static void main(String[] args) {
		FoodSupJDBCDAO foodSupJDBCDAO = new FoodSupJDBCDAO();
		
		// 新增
//		FoodSupVO foodSupVO = new FoodSupVO();
//		foodSupVO.setFoodSupId("C00007");
//		foodSupVO.setFoodSupName("DDD");
//		foodSupVO.setFoodSupTel("03-6555555");
//		foodSupVO.setFoodSupStatus("s0");
//		foodSupVO.setFoodSupResume("dddddddd");
//		foodSupJDBCDAO.insert(foodSupVO);
		
		// 修改
//		FoodSupVO foodSupVO = new FoodSupVO();
//		foodSupVO.setFoodSupId("C00007");
//		foodSupVO.setFoodSupName("GGG");
//		foodSupVO.setFoodSupTel("0958555555");
//		foodSupVO.setFoodSupStatus("s1");
//		foodSupVO.setFoodSupResume("AAAAAAA");
//		foodSupJDBCDAO.update(foodSupVO);
		
		// 刪除
//		foodSupJDBCDAO.delete("C00007");
		
		// 查詢
//		FoodSupVO foodSupVO = foodSupJDBCDAO.findByPrimaryKey("C00005");
//		System.out.println(foodSupVO.getFoodSupId());
//		System.out.println(foodSupVO.getFoodSupName());
//		System.out.println(foodSupVO.getFoodSupTel());
//		System.out.println(foodSupVO.getFoodSupStatus());
//		System.out.println(foodSupVO.getFoodSupResume());
		
		// 查詢全部
//		List<FoodSupVO> foodSupVOs = foodSupJDBCDAO.getAll();
//		for(FoodSupVO foodSupVO:foodSupVOs) {
//			System.out.print(foodSupVO.getFoodSupId() + " ");
//			System.out.print(foodSupVO.getFoodSupName() + " ");
//			System.out.print(foodSupVO.getFoodSupTel() + " ");
//			System.out.print(foodSupVO.getFoodSupStatus() + " ");
//			System.out.println(foodSupVO.getFoodSupResume() + " ");
//		}
		
	}
}
