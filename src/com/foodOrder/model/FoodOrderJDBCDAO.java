package com.foodOrder.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;




public class FoodOrderJDBCDAO implements FoodOrderDAO_interface{
	private static final String DRIVER = "oracle.jdbc.driver.OracleDriver";
	private static final String URL = "jdbc:oracle:thin:@localhost:1521:XE";
	private static final String USER = "COOKGOD";
	private static final String PASSWORD = "123456";
//	private static String INSERT_STMT = "INSERT INTO FOOD_ORDER (FOOD_OR_ID, FOOD_OR_STATUS, FOOD_OR_START, FOOD_OR_SEND, FOOD_OR_RCV, FOOD_OR_END, FOOD_OR_NAME, FOOD_OR_ADDR, FOOD_OR_TEL, CUST_ID) VALUES ('FO'||''||'-'||LPAD(TO_CHAR(F_OR_SEQ.CURRVAL), 6, '0'), ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	private static String insertStmt;
	private static final String UPDATE_STMT = "UPDATE FOOD_ORDER SET FOOD_M_NAME = ?, FOOD_M_STATUS = ?, FOOD_M_PRICE = ?, FOOD_M_UNIT = ?, FOOD_M_PLACE = ?, FOOD_M_PIC = ?, FOOD_M_RESUME = ?, FOOD_M_RATE = ? WHERE FOOD_OR_ID = ?";
	private static final String DELETE_STMT = "DELETE FROM FOOD_MALL WHERE FOOD_SUP_ID = ? AND FOOD_ID = ?";
	private static final String GET_ALL_STMT = "SELECT * FROM FOOD_MALL";
	private static final String GET_ONE_STMT = "SELECT * FROM FOOD_MALL WHERE FOOD_SUP_ID = ? AND FOOD_ID = ?";
	@Override
	public void insert(FoodOrderVO foodOrderVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		Calendar currentTime = Calendar.getInstance();
		SimpleDateFormat sFormatDate= new SimpleDateFormat("yyyyMMdd");
		String orderDate = sFormatDate.format(currentTime.getTime());
		insertStmt = "INSERT INTO FOOD_ORDER (FOOD_OR_ID, FOOD_OR_STATUS, FOOD_OR_START, FOOD_OR_SEND, FOOD_OR_RCV, FOOD_OR_END, FOOD_OR_NAME, FOOD_OR_ADDR, FOOD_OR_TEL, CUST_ID) VALUES ('FO'||'" + orderDate +"'||'-'||LPAD(TO_CHAR(F_OR_SEQ.NEXTVAL), 6, '0'), ?, ?, ?, ?, ?, ?, ?, ?, ?)";
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
	public void update(FoodOrderVO foodMallVO) {
		// TODO Auto-generated method stub
		
	}
	@Override
	public void delete(String foodOrId) {
		// TODO Auto-generated method stub
		
	}
	@Override
	public FoodOrderVO findByPrimaryKey(String foodOrId) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public List<FoodOrderVO> getAll() {
		// TODO Auto-generated method stub
		return null;
	}
	
	public static void main(String[] args) {
		FoodOrderJDBCDAO foodOrderJDBCDAO = new FoodOrderJDBCDAO();
		Calendar currentTime = Calendar.getInstance();
		java.sql.Date sqlDate = new java.sql.Date(currentTime.getTimeInMillis());
//		SimpleDateFormat sFormatDate= new SimpleDateFormat("yyyyMMdd");
//		String orderDate = sFormatDate.format(sqlDate)
		// 新增
		FoodOrderVO foodOrderVO = new FoodOrderVO();
		foodOrderVO.setFoodOrStatus("o0");
		foodOrderVO.setFoodOrStart(sqlDate);
		foodOrderVO.setFoodOrSend(sqlDate);
		foodOrderVO.setFoodOrRcv(sqlDate);
		foodOrderVO.setFoodOrEnd(sqlDate);
		foodOrderVO.setFoodOrName("李舜生");
		foodOrderVO.setFoodOrAddr("中央大學");
		foodOrderVO.setFoodOrTel("0958111222");
		foodOrderVO.setCustId("C00007");
		foodOrderJDBCDAO.insert(foodOrderVO);
	}
}
