package foodMall.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

public class FoodMallJDBCDAO implements FoodMallDAO_interface {
	private static final String DRIVER = "oracle.jdbc.driver.OracleDriver";
	private static final String URL = "jdbc:oracle:thin:@localhost:1521:XE";
	private static final String USER = "COOKGOD";
	private static final String PASSWORD = "123456";
	private static final String INSERT_STMT = "INSERT INTO FOOD_MALL (FOOD_SUP_ID, FOOD_ID, FOOD_M_NAME, FOOD_M_STATUS, FOOD_M_PRICE, FOOD_M_UNIT, FOOD_M_PLACE, FOOD_M_PIC, FOOD_M_RESUME, FOOD_M_RATE) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	private static final String UPDATE_STMT = "UPDATE FOOD_MALL SET FOOD_M_NAME = ?, FOOD_M_STATUS = ?, FOOD_M_PRICE = ?, FOOD_M_UNIT = ?, FOOD_M_PLACE = ?, FOOD_M_PIC = ?, FOOD_M_RESUME = ?, FOOD_M_RATE = ? WHERE FOOD_SUP_ID = ? AND FOOD_ID = ?";
	private static final String DELETE_STMT = "DELETE FROM FOOD_MALL WHERE FOOD_SUP_ID = ? AND FOOD_ID = ?";
	private static final String GET_ALL_STMT = "SELECT * FROM FOOD_MALL";
	private static final String GET_ONE_STMT = "SELECT * FROM FOOD_MALL WHERE FOOD_SUP_ID = ? AND FOOD_ID = ?";

	@Override
	public void insert(FoodMallVO foodMallVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {

			Class.forName(DRIVER);
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, foodMallVO.getFoodSupId());
			pstmt.setString(2, foodMallVO.getFoodId());
			pstmt.setString(3, foodMallVO.getFoodMName());
			pstmt.setString(4, foodMallVO.getFoodMStatus());
			pstmt.setInt(5, foodMallVO.getFoodMPrice());
			pstmt.setString(6, foodMallVO.getFoodMUnit());
			pstmt.setString(7, foodMallVO.getFoodMPlace());
			pstmt.setBytes(8, foodMallVO.getFoodMPic());
			pstmt.setString(9, foodMallVO.getFoodMResume());
			pstmt.setInt(10, foodMallVO.getFoodMRate());

			pstmt.executeUpdate();
		} catch (ClassNotFoundException e) {
			System.out.println(e.getStackTrace());
		} catch (SQLException e) {
			System.out.println(e.getStackTrace());
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					System.out.println(e.getStackTrace());
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					System.out.println(e.getStackTrace());
				}
			}
		}

	}

	@Override
	public void update(FoodMallVO foodMallVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {

			Class.forName(DRIVER);
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = con.prepareStatement(UPDATE_STMT);

			pstmt.setString(1, foodMallVO.getFoodMName());
			pstmt.setString(2, foodMallVO.getFoodMStatus());
			pstmt.setInt(3, foodMallVO.getFoodMPrice());
			pstmt.setString(4, foodMallVO.getFoodMUnit());
			pstmt.setString(5, foodMallVO.getFoodMPlace());
			pstmt.setBytes(6, foodMallVO.getFoodMPic());
			pstmt.setString(7, foodMallVO.getFoodMResume());
			pstmt.setInt(8, foodMallVO.getFoodMRate());
			pstmt.setString(9, foodMallVO.getFoodSupId());
			pstmt.setString(10, foodMallVO.getFoodId());

			pstmt.executeUpdate();
		} catch (ClassNotFoundException e) {
			System.out.println(e.getStackTrace());
		} catch (SQLException e) {
			System.out.println(e.getStackTrace());
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					System.out.println(e.getStackTrace());
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					System.out.println(e.getStackTrace());
				}
			}
		}
	}

	@Override
	public void delete(String foodSupId, String foodId) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(DRIVER);
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			con.setAutoCommit(false);
			
			pstmt = con.prepareStatement(DELETE_STMT);
			pstmt.setString(1, foodSupId);
			pstmt.setString(2, foodId);
			
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
	public FoodMallVO findByPrimaryKey(String foodSupId, String foodId) {

		return null;
	}

	@Override
	public List<FoodMallVO> getAll() {

		return null;
	}
	
	public static void main(String[] args) {
		// 新增
		
	}

}
