package com.foodMall.model;

import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import piciotest.PicIOTest;

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
	private static final String UPDATE_PIC = "UPDATE FOOD_MALL SET FOOD_M_PIC = ? WHERE FOOD_SUP_ID = ? AND FOOD_ID = ?";
	
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
	
	public void updatePIC(FoodMallVO foodMallVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {

			Class.forName(DRIVER);
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = con.prepareStatement(UPDATE_STMT);

			pstmt.setBytes(1, foodMallVO.getFoodMPic());
			pstmt.setString(2, foodMallVO.getFoodSupId());
			pstmt.setString(3, foodMallVO.getFoodId());

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
	public FoodMallVO findByPrimaryKey(String foodSupId, String foodId) {
		FoodMallVO foodMallVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		piciotest.PicIOTest picIOTest = new PicIOTest();
		
		try {
			Class.forName(DRIVER);
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = con.prepareStatement(GET_ONE_STMT);
				
			pstmt.setString(1, foodSupId);
			pstmt.setString(2, foodId);
				
			rs = pstmt.executeQuery();
				
			if(rs.next()) {
				foodMallVO = new FoodMallVO();
				foodMallVO.setFoodSupId(rs.getString(1));
				foodMallVO.setFoodId(rs.getString(2));
				foodMallVO.setFoodMName(rs.getString(3));
				foodMallVO.setFoodMStatus(rs.getString(4));
				foodMallVO.setFoodMPrice(rs.getInt(5));
				foodMallVO.setFoodMUnit(rs.getString(6));
				foodMallVO.setFoodMPlace(rs.getString(7));
				foodMallVO.setFoodMPic(rs.getBytes(8));
				foodMallVO.setFoodMResume(rs.getString(9));
				foodMallVO.setFoodMRate(rs.getInt(10));
					
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

		return foodMallVO;
	}

	@Override
	public List<FoodMallVO> getAll() {
		List<FoodMallVO> foodMallVOAL = new ArrayList<FoodMallVO>(); 
		FoodMallVO foodMallVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		piciotest.PicIOTest picIOTest = new PicIOTest();
		
			try {
				Class.forName(DRIVER);
				con = DriverManager.getConnection(URL, USER, PASSWORD);
				pstmt = con.prepareStatement(GET_ALL_STMT);
				
				
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					foodMallVO = new FoodMallVO();
					foodMallVO.setFoodSupId(rs.getString(1));
					foodMallVO.setFoodId(rs.getString(2));
					foodMallVO.setFoodMName(rs.getString(3));
					foodMallVO.setFoodMStatus(rs.getString(4));
					foodMallVO.setFoodMPrice(rs.getInt(5));
					foodMallVO.setFoodMUnit(rs.getString(6));
					foodMallVO.setFoodMPlace(rs.getString(7));
					foodMallVO.setFoodMPic(rs.getBytes(8));
					foodMallVO.setFoodMResume(rs.getString(9));
					foodMallVO.setFoodMRate(rs.getInt(10));
					foodMallVOAL.add(foodMallVO);
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
		return foodMallVOAL;
	}
	
	public static void main(String[] args) {
		FoodMallJDBCDAO fMDao = new FoodMallJDBCDAO();
		piciotest.PicIOTest picIOTest = new piciotest.PicIOTest();
		
		// 新增
//		FoodMallVO foodMallVO = new FoodMallVO();
//		foodMallVO.setFoodSupId("C00005");
//		foodMallVO.setFoodId("F00001");
//		foodMallVO.setFoodMName("五穀米");
//		foodMallVO.setFoodMStatus("p2");
//		foodMallVO.setFoodMPrice(300);
//		foodMallVO.setFoodMUnit("1kg");
//		foodMallVO.setFoodMPlace("台灣");
//		foodMallVO.setFoodMPic(picIOTest.getPictureByteArray("P:/pic/澳洲牛頰肉.png"));
//		foodMallVO.setFoodMResume("飽滿");
//		foodMallVO.setFoodMRate(5);
//		fMDao.insert(foodMallVO);
		// 更新
//		FoodMallVO foodMallVO = new FoodMallVO();
//		foodMallVO.setFoodSupId("C00005");
//		foodMallVO.setFoodId("F00001");
//		foodMallVO.setFoodMName("馬玉山五穀米");
//		foodMallVO.setFoodMStatus("p4");
//		foodMallVO.setFoodMPrice(250);
//		foodMallVO.setFoodMUnit("0.6kg");
//		foodMallVO.setFoodMPlace("馬玉山");
//		foodMallVO.setFoodMPic(picIOTest.getPictureByteArray("P:/pic/馬玉山五穀米.jpg"));
//		foodMallVO.setFoodMResume("煮起來又香又好吃, 對身體的健康又很有幫助");
//		foodMallVO.setFoodMRate(4);
//		fMDao.update(foodMallVO);
		// 刪除
//		fMDao.delete("C00005", "F00001");
		// 查一筆
//		FoodMallVO foodMallVO = fMDao.findByPrimaryKey("C00005", "F00001");
//		System.out.println(foodMallVO.getFoodSupId());
//		System.out.println(foodMallVO.getFoodId());
//		System.out.println(foodMallVO.getFoodMName());
//		System.out.println(foodMallVO.getFoodMStatus());
//		System.out.println(foodMallVO.getFoodMPrice());
//		System.out.println(foodMallVO.getFoodMUnit());
//		System.out.println(foodMallVO.getFoodMPlace());
//		picIOTest.byteArrToFile(foodMallVO.getFoodMPic(), "P:/pic/1.png");
//		System.out.println(foodMallVO.getFoodMResume());
//		System.out.println(foodMallVO.getFoodMRate());
		// 查全部
//		List<FoodMallVO> foodMallVOs = fMDao.getAll();
//		int count = 1;
//		for(FoodMallVO foodMallVO:foodMallVOs) {
//			System.out.print(foodMallVO.getFoodSupId() + " ");
//			System.out.print(foodMallVO.getFoodId() + " ");
//			System.out.print(foodMallVO.getFoodMName() + " ");
//			System.out.print(foodMallVO.getFoodMStatus() + " ");
//			System.out.print(foodMallVO.getFoodMPrice() + " ");
//			System.out.print(foodMallVO.getFoodMUnit() + " ");
//			System.out.print(foodMallVO.getFoodMPlace() + " ");
//			picIOTest.byteArrToFile(foodMallVO.getFoodMPic(), "P:/pic/"+ count +".png");
//			System.out.print(foodMallVO.getFoodMResume() + " ");
//			System.out.print(foodMallVO.getFoodMRate() + " ");
//			System.out.println();
//			count++;
//		}
		
		
		
	}
	
	
}
