package com.foodordetail.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FoodOrDetailJDBCDAO implements FoodOrDetailDAO_interface{
	private static final String DRIVER = "oracle.jdbc.driver.OracleDriver";
	private static final String URL = "jdbc:oracle:thin:@localhost:1521:XE";
	private static final String USER = "COOKGOD";
	private static final String PASSWORD = "123456";
	private static final String INSERT_STMT = "INSERT INTO FOOD_OR_DETAIL (FOOD_OR_ID, FOOD_SUP_ID, FOOD_ID, FOOD_OD_QTY, FOOD_OD_STOTAL, FOOD_OD_RATE, FOOD_OD_MSG) VALUES (?, ?, ?, ?, ?, ?, ?)";
	private static final String UPDATE_STMT = "UPDATE FOOD_OR_DETAIL SET FOOD_OD_QTY = ?, FOOD_OD_STOTAL = ?, FOOD_OD_RATE = ?, FOOD_OD_MSG = ? WHERE FOOD_OR_ID = ? AND FOOD_SUP_ID = ? AND FOOD_ID = ?";
	private static final String DELETE_STMT = "DELETE FROM FOOD_OR_DETAIL WHERE FOOD_OR_ID = ? AND FOOD_SUP_ID = ? AND FOOD_ID = ?";
	private static final String GET_ALL_STMT = "SELECT FOOD_OR_ID, FOOD_SUP_ID, FOOD_ID, FOOD_OD_QTY, FOOD_OD_STOTAL, FOOD_OD_RATE, FOOD_OD_MSG FROM FOOD_OR_DETAIL";
	private static final String GET_ONE_STMT = "SELECT FOOD_OR_ID, FOOD_SUP_ID, FOOD_ID, FOOD_OD_QTY, FOOD_OD_STOTAL, FOOD_OD_RATE, FOOD_OD_MSG FROM FOOD_OR_DETAIL WHERE FOOD_OR_ID = ? AND FOOD_SUP_ID = ? AND FOOD_ID = ?";
	
	@Override
	public void insert(FoodOrDetailVO foodOrDetailVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {

			Class.forName(DRIVER);
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, foodOrDetailVO.getFood_or_ID());
			pstmt.setString(2, foodOrDetailVO.getFood_sup_ID());
			pstmt.setString(3, foodOrDetailVO.getFood_ID());
			pstmt.setInt(4, foodOrDetailVO.getFood_od_qty());
			pstmt.setInt(5, foodOrDetailVO.getFood_od_stotal());
			pstmt.setInt(6, foodOrDetailVO.getFood_od_rate());
			pstmt.setString(7, foodOrDetailVO.getFood_od_msg());			
			

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

			pstmt.setInt(1, foodOrDetailVO.getFood_od_qty());
			pstmt.setInt(2, foodOrDetailVO.getFood_od_stotal());
			pstmt.setInt(3, foodOrDetailVO.getFood_od_rate());
			pstmt.setString(4, foodOrDetailVO.getFood_od_msg());			
			pstmt.setString(5, foodOrDetailVO.getFood_or_ID());
			pstmt.setString(6, foodOrDetailVO.getFood_sup_ID());
			pstmt.setString(7, foodOrDetailVO.getFood_ID());
			

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
	public void delete(String food_or_ID, String food_sup_ID, String food_ID) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(DRIVER);
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			con.setAutoCommit(false);
			
			pstmt = con.prepareStatement(DELETE_STMT);
			pstmt.setString(1, food_or_ID);
			pstmt.setString(2, food_sup_ID);
			pstmt.setString(3, food_ID);
			
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
	public FoodOrDetailVO findByPrimaryKey(String food_or_ID, String food_sup_ID, String food_ID) {
		FoodOrDetailVO foodOrDetailVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName(DRIVER);
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = con.prepareStatement(GET_ONE_STMT);
				
			pstmt.setString(1, food_or_ID);
			pstmt.setString(2, food_sup_ID);
			pstmt.setString(3, food_ID);
			
			rs = pstmt.executeQuery();
				
			while(rs.next()) {
				foodOrDetailVO = new FoodOrDetailVO();
				foodOrDetailVO.setFood_or_ID(rs.getString(1));
				foodOrDetailVO.setFood_sup_ID(rs.getString(2));
				foodOrDetailVO.setFood_ID(rs.getString(3));
				foodOrDetailVO.setFood_od_qty(rs.getInt(4));
				foodOrDetailVO.setFood_od_stotal(rs.getInt(5));
				foodOrDetailVO.setFood_od_rate(rs.getInt(6));
				foodOrDetailVO.setFood_od_msg(rs.getString(7));
					
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
				foodOrDetailVO.setFood_or_ID(rs.getString(1));
				foodOrDetailVO.setFood_sup_ID(rs.getString(2));
				foodOrDetailVO.setFood_ID(rs.getString(3));
				foodOrDetailVO.setFood_od_qty(rs.getInt(4));
				foodOrDetailVO.setFood_od_stotal(rs.getInt(5));
				foodOrDetailVO.setFood_od_rate(rs.getInt(6));
				foodOrDetailVO.setFood_od_msg(rs.getString(7));
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
//		foodOrDetailVO.setFood_or_ID("FO20181121-000001");
//		foodOrDetailVO.setFood_sup_ID("C00004");
//		foodOrDetailVO.setFood_ID("F00023");
//		foodOrDetailVO.setFood_od_qty(4);
//		foodOrDetailVO.setFood_od_stotal(260);
//		foodOrDetailVO.setFood_od_rate(5);
//		foodOrDetailVO.setFood_od_msg("AAAA");
//		foodOrDetailJDBCDAO.insert(foodOrDetailVO);
		
		// 修改
//		FoodOrDetailVO foodOrDetailVO = new FoodOrDetailVO();
//		foodOrDetailVO.setFood_or_ID("FO20181121-000001");
//		foodOrDetailVO.setFood_sup_ID("C00004");
//		foodOrDetailVO.setFood_ID("F00023");
//		foodOrDetailVO.setFood_od_qty(1);
//		foodOrDetailVO.setFood_od_stotal(65);
//		foodOrDetailVO.setFood_od_rate(1);
//		foodOrDetailVO.setFood_od_msg("dddd");
//		foodOrDetailJDBCDAO.update(foodOrDetailVO);
		
		// 刪除
//		foodOrDetailJDBCDAO.delete("FO20181121-000001", "C00004", "F00023");
		
		// 查一筆
//		FoodOrDetailVO foodOrDetailVO = foodOrDetailJDBCDAO.findByPrimaryKey("FO20181121-000001", "C00004", "F00024");
//		System.out.println(foodOrDetailVO.getFood_or_ID());
//		System.out.println(foodOrDetailVO.getFood_sup_ID());
//		System.out.println(foodOrDetailVO.getFood_ID());
//		System.out.println(foodOrDetailVO.getFood_od_qty());
//		System.out.println(foodOrDetailVO.getFood_od_stotal());
//		System.out.println(foodOrDetailVO.getFood_od_rate());
//		System.out.println(foodOrDetailVO.getFood_od_msg());
		
		// 查全部
//		List<FoodOrDetailVO> foodOdDetailVOs = foodOrDetailJDBCDAO.getAll();
//		for(FoodOrDetailVO foodOrDetailVO:foodOdDetailVOs) {
//			System.out.print(foodOrDetailVO.getFood_or_ID() + " ");
//			System.out.print(foodOrDetailVO.getFood_sup_ID() + " ");
//			System.out.print(foodOrDetailVO.getFood_ID() + " ");
//			System.out.print(foodOrDetailVO.getFood_od_qty() + " ");
//			System.out.print(foodOrDetailVO.getFood_od_stotal() + " ");
//			System.out.print(foodOrDetailVO.getFood_od_rate() + " ");
//			System.out.print(foodOrDetailVO.getFood_od_msg() + " ");
//			System.out.println();
//		}
		
	}
}
