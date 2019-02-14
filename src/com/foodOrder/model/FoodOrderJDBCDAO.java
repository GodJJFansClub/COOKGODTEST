package com.foodOrder.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;





public class FoodOrderJDBCDAO implements FoodOrderDAO_interface{
	private static final String DRIVER = "oracle.jdbc.driver.OracleDriver";
	private static final String URL = "jdbc:oracle:thin:@localhost:1521:XE";
	private static final String USER = "COOKGOD";
	private static final String PASSWORD = "123456";
//	private static String INSERT_STMT = "INSERT INTO FOOD_ORDER (FOOD_OR_ID, FOOD_OR_STATUS, FOOD_OR_START, FOOD_OR_SEND, FOOD_OR_RCV, FOOD_OR_END, FOOD_OR_NAME, FOOD_OR_ADDR, FOOD_OR_TEL, CUST_ID) VALUES ('FO'||''||'-'||LPAD(TO_CHAR(F_OR_SEQ.CURRVAL), 6, '0'), ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	private static String insertStmt;
	private static final String UPDATE_STMT = "UPDATE FOOD_ORDER SET FOOD_OR_STATUS = ?, FOOD_OR_START = ?, FOOD_OR_SEND = ?, FOOD_OR_RCV = ?, FOOD_OR_END = ?, FOOD_OR_NAME = ?, FOOD_OR_ADDR = ?, FOOD_OR_TEL = ? WHERE FOOD_OR_ID = ?";
	private static final String DELETE_STMT = "DELETE FROM FOOD_ORDER WHERE FOOD_OR_ID = ?";
	private static final String GET_ALL_STMT = "SELECT * FROM FOOD_ORDER";
	private static final String GET_ONE_STMT = "SELECT * FROM FOOD_ORDER WHERE FOOD_OR_ID = ?";
	@Override
	public void insert(FoodOrderVO foodOrderVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		java.sql.Date orderStart = foodOrderVO.getFoodOrStart();
		SimpleDateFormat sFormatDate= new SimpleDateFormat("yyyyMMdd");
		String orderStartStr = sFormatDate.format(new Date(orderStart.getTime()));
		insertStmt = "INSERT INTO FOOD_ORDER (FOOD_OR_ID, FOOD_OR_STATUS, FOOD_OR_START, FOOD_OR_SEND, FOOD_OR_RCV, FOOD_OR_END, FOOD_OR_NAME, FOOD_OR_ADDR, FOOD_OR_TEL, CUST_ID) VALUES ('FO'||'" + orderStartStr +"'||'-'||LPAD(TO_CHAR(F_OR_SEQ.NEXTVAL), 6, '0'), ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try {

			Class.forName(DRIVER);
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = con.prepareStatement(insertStmt);
			pstmt.setString(1, foodOrderVO.getFoodOrStatus());
			pstmt.setDate(2, foodOrderVO.getFoodOrStart());
			pstmt.setDate(3, foodOrderVO.getFoodOrSend());
			pstmt.setDate(4, foodOrderVO.getFoodOrRcv());
			pstmt.setDate(5, foodOrderVO.getFoodOrEnd());
			pstmt.setString(6, foodOrderVO.getFoodOrName());
			pstmt.setString(7, foodOrderVO.getFoodOrAddr());
			pstmt.setString(8, foodOrderVO.getFoodOrTel());
			pstmt.setString(9, foodOrderVO.getCustId());

			pstmt.executeUpdate();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		
	}
	@Override
	public void update(FoodOrderVO foodOrderVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {

			Class.forName(DRIVER);
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = con.prepareStatement(UPDATE_STMT);

			pstmt.setString(1, foodOrderVO.getFoodOrStatus());
			pstmt.setDate(2, foodOrderVO.getFoodOrStart());
			pstmt.setDate(3, foodOrderVO.getFoodOrSend());
			pstmt.setDate(4, foodOrderVO.getFoodOrRcv());
			pstmt.setDate(5, foodOrderVO.getFoodOrEnd());
			pstmt.setString(6, foodOrderVO.getFoodOrName());
			pstmt.setString(7, foodOrderVO.getFoodOrAddr());
			pstmt.setString(8, foodOrderVO.getFoodOrTel());
			pstmt.setString(9, foodOrderVO.getFoodOrId());

			pstmt.executeUpdate();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		
	}
	@Override
	public void delete(String foodOrId) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(DRIVER);
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			con.setAutoCommit(false);
			
			pstmt = con.prepareStatement(DELETE_STMT);
			pstmt.setString(1, foodOrId);
			
			pstmt.executeUpdate();
			
			con.commit();
			con.setAutoCommit(true);
		}catch(ClassNotFoundException e) {
			e.printStackTrace();
		}catch(SQLException e) {
			if(con != null) {
				try {
					con.rollback();
				}catch (SQLException se) {
					se.printStackTrace();
				}
			}
			e.printStackTrace();
		}finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace();
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		
	}
	@Override
	public FoodOrderVO findByPrimaryKey(String foodOrId) {
		FoodOrderVO foodOrderVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		
		try {
			Class.forName(DRIVER);
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = con.prepareStatement(GET_ONE_STMT);
				
			pstmt.setString(1, foodOrId);
				
			rs = pstmt.executeQuery();
				
			if(rs.next()) {
				foodOrderVO = new FoodOrderVO();
				foodOrderVO.setFoodOrId(rs.getString(1));
				foodOrderVO.setFoodOrStatus(rs.getString(2));
				foodOrderVO.setFoodOrStart(rs.getDate(3));
				foodOrderVO.setFoodOrSend(rs.getDate(4));
				foodOrderVO.setFoodOrRcv(rs.getDate(5));
				foodOrderVO.setFoodOrEnd(rs.getDate(6));
				foodOrderVO.setFoodOrName(rs.getString(7));
				foodOrderVO.setFoodOrAddr(rs.getString(8));
				foodOrderVO.setFoodOrTel(rs.getString(9));
				foodOrderVO.setCustId(rs.getString(10));
					
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			if(rs != null) {
				try {
					rs.close();
				}catch(SQLException e) {
					e.printStackTrace();
				}
			}
				
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace();
				}
			}
				
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		return foodOrderVO;
	}
	@Override
	public List<FoodOrderVO> getAll() {
		List<FoodOrderVO> foodOrderVOs = new ArrayList<FoodOrderVO>(); 
		FoodOrderVO foodOrderVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		
		try {
			Class.forName(DRIVER);
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = con.prepareStatement(GET_ALL_STMT);
				
				
			rs = pstmt.executeQuery();
				
			while(rs.next()) {
				foodOrderVO = new FoodOrderVO();
				foodOrderVO.setFoodOrId(rs.getString(1));
				foodOrderVO.setFoodOrStatus(rs.getString(2));
				foodOrderVO.setFoodOrStart(rs.getDate(3));
				foodOrderVO.setFoodOrSend(rs.getDate(4));
				foodOrderVO.setFoodOrRcv(rs.getDate(5));
				foodOrderVO.setFoodOrEnd(rs.getDate(6));
				foodOrderVO.setFoodOrName(rs.getString(7));
				foodOrderVO.setFoodOrAddr(rs.getString(8));
				foodOrderVO.setFoodOrTel(rs.getString(9));
				foodOrderVO.setCustId(rs.getString(10));
				foodOrderVOs.add(foodOrderVO);
					
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			if(rs != null) {
				try {
					rs.close();
				}catch(SQLException e) {
					e.printStackTrace();
				}
			}
				
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace();
				}
			}
				
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		return foodOrderVOs;
	}
	
	public static void main(String[] args) {
		FoodOrderJDBCDAO foodOrderJDBCDAO = new FoodOrderJDBCDAO();
		Calendar currentTime = Calendar.getInstance();
		java.sql.Date sqlDate = new java.sql.Date(currentTime.getTimeInMillis());
		// 新增
//		FoodOrderVO foodOrderVO = new FoodOrderVO();
//		foodOrderVO.setFoodOrStatus("o0");
//		foodOrderVO.setFoodOrStart(sqlDate);
//		foodOrderVO.setFoodOrSend(sqlDate);
//		foodOrderVO.setFoodOrRcv(sqlDate);
//		foodOrderVO.setFoodOrEnd(sqlDate);
//		foodOrderVO.setFoodOrName("李舜生");
//		foodOrderVO.setFoodOrAddr("中央大學");
//		foodOrderVO.setFoodOrTel("0958111222");
//		foodOrderVO.setCustId("C00007");
//		foodOrderJDBCDAO.insert(foodOrderVO);
		// 修改
//		FoodOrderVO foodOrderVO = new FoodOrderVO();
//		foodOrderVO.setFoodOrId("FO20190213-000008");
//		foodOrderVO.setFoodOrStatus("o1");
//		foodOrderVO.setFoodOrStart(sqlDate);
//		foodOrderVO.setFoodOrSend(sqlDate);
//		foodOrderVO.setFoodOrRcv(sqlDate);
//		foodOrderVO.setFoodOrEnd(sqlDate);
//		foodOrderVO.setFoodOrName("A李舜生");
//		foodOrderVO.setFoodOrAddr("桃園區");
//		foodOrderVO.setFoodOrTel("0952777666");
//		foodOrderJDBCDAO.update(foodOrderVO);
		// 刪除
//		foodOrderJDBCDAO.delete("FO20190213-000008");
		// 查詢
//		FoodOrderVO foodOrderVO = foodOrderJDBCDAO.findByPrimaryKey("FO20190213-000007");
//		System.out.println(foodOrderVO.getFoodOrId());
//		System.out.println(foodOrderVO.getFoodOrStatus());
//		System.out.println(foodOrderVO.getFoodOrStart());
//		System.out.println(foodOrderVO.getFoodOrSend());
//		System.out.println(foodOrderVO.getFoodOrRcv());
//		System.out.println(foodOrderVO.getFoodOrEnd());
//		System.out.println(foodOrderVO.getFoodOrName());
//		System.out.println(foodOrderVO.getFoodOrAddr());
//		System.out.println(foodOrderVO.getFoodOrTel());
//		System.out.println(foodOrderVO.getCustId());
		// 查詢全部
		List<FoodOrderVO> foodOrderVOs = foodOrderJDBCDAO.getAll();
		for(FoodOrderVO foodOrderVO: foodOrderVOs) {		
			System.out.print(foodOrderVO.getFoodOrId());
			System.out.print(foodOrderVO.getFoodOrStatus());
			System.out.print(foodOrderVO.getFoodOrStart());
			System.out.print(foodOrderVO.getFoodOrSend());
			System.out.print(foodOrderVO.getFoodOrRcv());
			System.out.print(foodOrderVO.getFoodOrEnd());
			System.out.print(foodOrderVO.getFoodOrName());
			System.out.print(foodOrderVO.getFoodOrAddr());
			System.out.print(foodOrderVO.getFoodOrTel());
			System.out.print(foodOrderVO.getCustId());
			System.out.println();
		}
	}
}
