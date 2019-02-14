package com.foodOrDetail.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import piciotest.PicIOTest;

public class FoodOrDetailJDBCDAO implements FoodOrDetailDAO_interface{
	private static final String DRIVER = "oracle.jdbc.driver.OracleDriver";
	private static final String URL = "jdbc:oracle:thin:@localhost:1521:XE";
	private static final String USER = "COOKGOD";
	private static final String PASSWORD = "123456";
	private static final String INSERT_STMT = "INSERT INTO FOOD_OR_DETAIL (FOOD_OR_ID, FOOD_SUP_ID, FOOD_ID, FOOD_OD_QTY, FOOD_OD_STOTAL, FOOD_OD_RATE, FOOD_OD_MSG) VALUES (?, ?, ?, ?, ?, ?, ?)";
	private static final String UPDATE_STMT = "UPDATE FOOD_OR_DETAIL SET FOOD_OD_QTY = ?, FOOD_OD_STOTAL = ?, FOOD_OD_RATE = ?, FOOD_OD_MSG = ? WHERE FOOD_OR_ID = ? AND FOOD_SUP_ID = ? AND FOOD_ID = ?";
	private static final String DELETE_STMT = "DELETE FROM FOOD_OR_DETAIL WHERE FOOD_OR_ID = ? AND FOOD_SUP_ID = ? AND FOOD_ID = ?";
	private static final String GET_ALL_STMT = "SELECT FOOD_OR_ID, FOOD_SUP_ID, FOOD_OD_QTY, FOOD_ID, FOOD_OD_STOTAL, FOOD_OD_RATE, FOOD_OD_MSG FROM FOOD_OR_DETAIL";
	private static final String GET_ONE_STMT = "SELECT FOOD_OR_ID, FOOD_SUP_ID, FOOD_OD_QTY, FOOD_ID, FOOD_OD_STOTAL, FOOD_OD_RATE, FOOD_OD_MSG FROM FOOD_OR_DETAIL WHERE FOOD_OR_ID = ? AND FOOD_SUP_ID = ? AND FOOD_ID = ?";
	
	@Override
	public void insert(FoodOrDetailVO foodOrDetailVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {

			Class.forName(DRIVER);
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, foodOrDetailVO.getFoodOrId());
			pstmt.setString(2, foodOrDetailVO.getFoodSupId());
			pstmt.setString(3, foodOrDetailVO.getFoodId());
			pstmt.setInt(4, foodOrDetailVO.getFoodOdQty());
			pstmt.setInt(5, foodOrDetailVO.getFoodOdStotal());
			pstmt.setInt(6, foodOrDetailVO.getFoodOdRate());
			pstmt.setString(7, foodOrDetailVO.getFoodOdMsg());			
			

			pstmt.executeUpdate();
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
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
	public void update(FoodOrDetailVO foodOrDetailVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {

			Class.forName(DRIVER);
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = con.prepareStatement(UPDATE_STMT);

			pstmt.setInt(1, foodOrDetailVO.getFoodOdQty());
			pstmt.setInt(2, foodOrDetailVO.getFoodOdStotal());
			pstmt.setInt(3, foodOrDetailVO.getFoodOdRate());
			pstmt.setString(4, foodOrDetailVO.getFoodOdMsg());			
			pstmt.setString(5, foodOrDetailVO.getFoodOrId());
			pstmt.setString(6, foodOrDetailVO.getFoodSupId());
			pstmt.setString(7, foodOrDetailVO.getFoodId());
			

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
	public void delete(String foodOrId, String foodSupId, String foodId) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(DRIVER);
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			con.setAutoCommit(false);
			
			pstmt = con.prepareStatement(DELETE_STMT);
			pstmt.setString(1, foodOrId);
			pstmt.setString(2, foodSupId);
			pstmt.setString(3, foodId);
			
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
	public FoodOrDetailVO findByPrimaryKey(String foodOrId, String foodSupId, String foodId) {
		FoodOrDetailVO foodOrDetailVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName(DRIVER);
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = con.prepareStatement(GET_ONE_STMT);
				
			pstmt.setString(1, foodOrId);
			pstmt.setString(2, foodSupId);
			pstmt.setString(3, foodId);
			
			rs = pstmt.executeQuery();
				
			while(rs.next()) {
				foodOrDetailVO = new FoodOrDetailVO();
				foodOrDetailVO.setFoodOrId(rs.getString(1));
				foodOrDetailVO.setFoodSupId(rs.getString(2));
				foodOrDetailVO.setFoodId(rs.getString(3));
				foodOrDetailVO.setFoodOdQty(rs.getInt(4));
				foodOrDetailVO.setFoodOdStotal(rs.getInt(5));
				foodOrDetailVO.setFoodOdRate(rs.getInt(6));
				foodOrDetailVO.setFoodOdMsg(rs.getString(7));
					
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

		return foodOrDetailVO;
	}

	@Override
	public List<FoodOrDetailVO> getAll() {
		List<FoodOrDetailVO> foodOrDetailVOs = new ArrayList<FoodOrDetailVO>(); 
		FoodOrDetailVO foodOrDetailVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		
		try {
			Class.forName(DRIVER);
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = con.prepareStatement(GET_ALL_STMT);
				
				
			rs = pstmt.executeQuery();
				
			while(rs.next()) {
				foodOrDetailVO = new FoodOrDetailVO();
				foodOrDetailVO.setFoodOrId(rs.getString(1));
				foodOrDetailVO.setFoodSupId(rs.getString(2));
				foodOrDetailVO.setFoodId(rs.getString(3));
				foodOrDetailVO.setFoodOdQty(rs.getInt(4));
				foodOrDetailVO.setFoodOdStotal(rs.getInt(5));
				foodOrDetailVO.setFoodOdRate(rs.getInt(6));
				foodOrDetailVO.setFoodOdMsg(rs.getString(7));
				foodOrDetailVOs.add(foodOrDetailVO);
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
		return foodOrDetailVOs;
	}
	
	public static void main(String[] args) {
		FoodOrDetailJDBCDAO foodOrDetailJDBCDAO = new FoodOrDetailJDBCDAO();
		
		// 新增
//		FoodOrDetailVO foodOrDetailVO = new FoodOrDetailVO();
//		foodOrDetailVO.setFoodOrId("FO20181121-000001");
//		foodOrDetailVO.setFoodSupId("C00004");
//		foodOrDetailVO.setFoodId("F00023");
//		foodOrDetailVO.setFoodOdQty(4);
//		foodOrDetailVO.setFoodOdStotal(260);
//		foodOrDetailVO.setFoodOdRate(5);
//		foodOrDetailVO.setFoodOdMsg("AAAA");
//		foodOrDetailJDBCDAO.insert(foodOrDetailVO);
		
		// 修改
//		FoodOrDetailVO foodOrDetailVO = new FoodOrDetailVO();
//		foodOrDetailVO.setFoodOrId("FO20181121-000001");
//		foodOrDetailVO.setFoodSupId("C00004");
//		foodOrDetailVO.setFoodId("F00023");
//		foodOrDetailVO.setFoodOdQty(1);
//		foodOrDetailVO.setFoodOdStotal(65);
//		foodOrDetailVO.setFoodOdRate(1);
//		foodOrDetailVO.setFoodOdMsg("dddd");
//		foodOrDetailJDBCDAO.update(foodOrDetailVO);
		
		// 刪除
//		foodOrDetailJDBCDAO.delete("FO20181121-000001", "C00004", "F00023");
		
		// 查一筆
//		FoodOrDetailVO foodOrDetailVO = foodOrDetailJDBCDAO.findByPrimaryKey("FO20181124-000002", "C00003", "F00016");
//		System.out.println(foodOrDetailVO.getFoodOrId());
//		System.out.println(foodOrDetailVO.getFoodSupId());
//		System.out.println(foodOrDetailVO.getFoodId());
//		System.out.println(foodOrDetailVO.getFoodOdQty());
//		System.out.println(foodOrDetailVO.getFoodOdStotal());
//		System.out.println(foodOrDetailVO.getFoodOdRate());
//		System.out.println(foodOrDetailVO.getFoodOdMsg());
		
		// 查全部
//		List<FoodOrDetailVO> foodOdDetailVOs = foodOrDetailJDBCDAO.getAll();
//		for(FoodOrDetailVO foodOrDetailVO:foodOdDetailVOs) {
//			System.out.print(foodOrDetailVO.getFoodOrId() + " ");
//			System.out.print(foodOrDetailVO.getFoodSupId() + " ");
//			System.out.print(foodOrDetailVO.getFoodId() + " ");
//			System.out.print(foodOrDetailVO.getFoodOdQty() + " ");
//			System.out.print(foodOrDetailVO.getFoodOdStotal() + " ");
//			System.out.print(foodOrDetailVO.getFoodOdRate() + " ");
//			System.out.print(foodOrDetailVO.getFoodOdMsg() + " ");
//			System.out.println();
//		}
		
	}
}
