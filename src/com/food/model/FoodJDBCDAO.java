package com.food.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.SQLError;

public class FoodJDBCDAO implements FoodDAO_interface {
	private static final String DRIVER = "oracle.jdbc.driver.OracleDriver";
	private static final String URL = "jdbc:oracle:thin:@localhost:1521:XE";
	private static final String USER = "COOKGOD";
	private static final String PASSWORD = "123456";
	private static final String INSERT_STMT = "INSERT INTO FOOD (FOOD_ID, FOOD_NAME) VALUES ('F'||LPAD(TO_CHAR (FOOD_SEQ.NEXTVAL), 5, '0'), ?)";
	private static final String UPDATE_STMT = "UPDATE FOOD SET FOOD_NAME = ? WHERE FOOD_ID = ?";
	private static final String DELETE_STMT = "DELETE FROM FOOD WHERE FOOD_ID = ?";
	private static final String GET_ALL_STMT = "SELECT * FROM FOOD";
	private static final String GET_ONE_STMT = "SELECT * FROM FOOD WHERE FOOD_ID = ?";
	@Override
	public void insert(FoodVO foodVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			
			Class.forName(DRIVER);
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = con.prepareStatement(INSERT_STMT);
			
			pstmt.setString(1, foodVO.getFoodName());
			
			pstmt.executeUpdate();
			// Handle any driver errors
		}catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		}catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		}finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				}catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				}catch (SQLException e) {
					e.printStackTrace(System.err);
				}
			}
		}
		
	}
	@Override
	public void update(FoodVO foodVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			Class.forName(DRIVER);
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = con.prepareStatement(UPDATE_STMT);
			
			
			pstmt.setString( 1, foodVO.getFoodName());
			pstmt.setString( 2, foodVO.getFoodId());
			
			pstmt.executeUpdate();
			
			// Handle any driver errors
		}catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		}catch(SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
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
	public void delete(String foodId) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(DRIVER);
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			
			pstmt = con.prepareStatement(DELETE_STMT);
			pstmt.setString(1, foodId);
			pstmt.executeUpdate();
			
			// Handle any driver errors
		}catch(ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		}catch(SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
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
	public FoodVO findByPrimaryKey(String foodId) {
		FoodVO foodVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName(DRIVER);
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = con.prepareStatement(GET_ONE_STMT);
			
			pstmt.setString(1, foodId);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				foodVO = new FoodVO();
				foodVO.setFoodId(rs.getString(1));
				foodVO.setFoodName(rs.getString(2));
			}
			// Handle any driver errors
		}catch(ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		}catch(SQLException se) {
			
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
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
		return foodVO;
	}
	@Override
	public List<FoodVO> getAll() {
		List<FoodVO> foodVOAL = new ArrayList<FoodVO>();
		FoodVO foodVO = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName(DRIVER);
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				foodVO = new FoodVO();
				foodVO.setFoodId(rs.getString(1));
				foodVO.setFoodName(rs.getString(2));
				foodVOAL.add(foodVO);
			}
			// Handle any driver errors
		}catch(ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		}catch(SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
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
		
		
		return foodVOAL;
	}
	
	public static void main(String[] args) {
		FoodJDBCDAO dao = new FoodJDBCDAO();
		// 新增
//		FoodVO foodVO1 = new FoodVO();
//		foodVO1.setFoodName("大白菜");
//		dao.insert(foodVO1);
		// 修改
//		FoodVO foodVO1 = new FoodVO();
//		foodVO1.setFoodId("F00027");
//		foodVO1.setFoodName("AAA");
//		dao.update(foodVO1);
		// 刪除
		dao.delete("F00027");
		// 查詢
//		FoodVO foodVO1 = dao.findByPrimaryKey("F00021");
//		System.out.println(foodVO1.getFoodId());
//		System.out.println(foodVO1.getFoodName());
		// 查全部
//		List<FoodVO> foodVOs = dao.getAll();
//		for(FoodVO foodVO:foodVOs) {
//			System.out.print(foodVO.getFoodId());
//			System.out.print(foodVO.getFoodName());
//			System.out.println();
//		}
	}
}
