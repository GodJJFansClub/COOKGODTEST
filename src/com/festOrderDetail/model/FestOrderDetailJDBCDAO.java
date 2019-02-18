package com.festOrderDetail.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.festOrderDetail.model.FestOrderDetailVO;

public class FestOrderDetailJDBCDAO implements FestOrderDetailDAO_interface {
	private static final String DRIVER = "oracle.jdbc.driver.OracleDriver";
	private static final String URL = "jdbc:oracle:thin:@localhost:1521:XE";
	private static final String USER = "COOKGOD";
	private static final String PASSWORD = "123456";
	private static final String INSERT_STMT = "INSERT INTO FEST_ORDER_DETAIL (FEST_OR_ID,FEST_M_ID,FEST_OR_RATE,FEST_OR_MSG,FEST_OR_QTY,FEST_OR_STOTAL) VALUES (?,?,?,?,? ?)";
	private static final String UPDATE_STMT = "UPDATE FEST_ORDER_DETAIL SET FEST_M_ID = ?,FEST_OR_RATE = ?,FEST_OR_MSG = ?,FEST_OR_QTY = ?,FEST_OR_STOTAL = ? WHERE FEST_OR_ID = ?";
	private static final String DELETE_STMT = "DELETE FROM FEST_ORDER_DETAIL WHERE FEST_OR_ID = ?";
	private static final String GET_ALL_STMT = "SELECT * FROM FEST_ORDER_DETAIL";
	private static final String GET_ONE_STMT = "SELECT * FROM FEST_ORDER_DETAIL WHERE FEST_OR_ID = ?";
	@Override
	public void insert(FestOrderDetailVO festOrderDetailVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			
			Class.forName(DRIVER);
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = con.prepareStatement(INSERT_STMT);
			
			pstmt.setString(1, festOrderDetailVO.getFest_or_ID());
			pstmt.setString(2, festOrderDetailVO.getFest_m_ID());
			pstmt.setInt(3, festOrderDetailVO.getFest_or_rate());
			pstmt.setString(4, festOrderDetailVO.getFest_or_msg());
			pstmt.setInt(5, festOrderDetailVO.getFest_or_qty());
			pstmt.setInt(6, festOrderDetailVO.getFest_or_stotal());
			
			pstmt.executeUpdate();
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
	public void update(FestOrderDetailVO festOrderDetailVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			Class.forName(DRIVER);
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = con.prepareStatement(UPDATE_STMT);
			
			pstmt.setString(1, festOrderDetailVO.getFest_or_ID());
			pstmt.setString(2, festOrderDetailVO.getFest_m_ID());
			pstmt.setInt(3, festOrderDetailVO.getFest_or_rate());
			pstmt.setString(4, festOrderDetailVO.getFest_or_msg());
			pstmt.setInt(5, festOrderDetailVO.getFest_or_qty());
			pstmt.setInt(6, festOrderDetailVO.getFest_or_stotal());
			
			pstmt.executeUpdate();
		}catch (ClassNotFoundException e) {
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
	public void delete(String fest_or_ID) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(DRIVER);
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			con.setAutoCommit(false);
			
			pstmt = con.prepareStatement(DELETE_STMT);
			pstmt.setString(1, fest_or_ID);
			pstmt.executeUpdate();
			
			con.commit();
			con.setAutoCommit(true);
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			if (con != null) {
				try {
					// 3●設定於當有exception發生時之catch區塊內
					con.rollback();
				} catch (SQLException excep) {
					throw new RuntimeException("rollback error occured. "
							+ excep.getMessage());
				}
			}
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
	public FestOrderDetailVO findByPrimaryKey(String fest_or_ID) {
		
		FestOrderDetailVO festOrderDetailVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName(DRIVER);
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = con.prepareStatement(GET_ONE_STMT);
			
			pstmt.setString(1, fest_or_ID);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				
				festOrderDetailVO = new FestOrderDetailVO();
				festOrderDetailVO.setFest_or_ID(rs.getString(1));
				festOrderDetailVO.setFest_m_ID(rs.getString(2));
				festOrderDetailVO.setFest_or_rate(rs.getInt(3));
				festOrderDetailVO.setFest_or_msg(rs.getString(4));
				festOrderDetailVO.setFest_or_qty(rs.getInt(5));
				festOrderDetailVO.setFest_or_stotal(rs.getInt(6));
			}
			
			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
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
		return festOrderDetailVO;
	}
	@Override
	public List<FestOrderDetailVO> getAll() {
		List<FestOrderDetailVO> festOrderDetailVOs = new ArrayList<FestOrderDetailVO>();
		FestOrderDetailVO festOrderDetailVO = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName(DRIVER);
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				festOrderDetailVO = new FestOrderDetailVO();
				
				festOrderDetailVO = new FestOrderDetailVO();
				festOrderDetailVO.setFest_or_ID(rs.getString(1));
				festOrderDetailVO.setFest_m_ID(rs.getString(2));
				festOrderDetailVO.setFest_or_rate(rs.getInt(3));
				festOrderDetailVO.setFest_or_msg(rs.getString(4));
				festOrderDetailVO.setFest_or_qty(rs.getInt(5));
				festOrderDetailVO.setFest_or_stotal(rs.getInt(6));
				
				festOrderDetailVOs.add(festOrderDetailVO);
			}
			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
		} finally {
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
		return festOrderDetailVOs;
	}
	
	public static void main(String[] args) {
		
		FestOrderDetailJDBCDAO dao = new FestOrderDetailJDBCDAO();
		// 新增
		
		FestOrderDetailVO festOrderDetailVO=new FestOrderDetailVO();
		
		festOrderDetailVO.setFest_or_ID("FM2019-000001");
		festOrderDetailVO.setFest_m_ID("FM0003");
		festOrderDetailVO.setFest_or_rate(80);
		festOrderDetailVO.setFest_or_msg("很不錯喔, 下次仍會繼續購買");
		festOrderDetailVO.setFest_or_qty(50);
		festOrderDetailVO.setFest_or_stotal(80);
		dao.insert(festOrderDetailVO);
		
		//修改
//		FestOrderDetailVO festFestOrderDetailVO=new FestOrderDetailVO();
		
//		  festFestOrderDetailVO.setFestOrId("FR0000");
//        festFestOrderDetailVO.setFestMId("FM0001");
//        festFestOrderDetailVO.setFestOrRate(30);
//        festFestOrderDetailVO.setFestOrMsg("很不錯喔");
//        festFestOrderDetailVO.setFestOrQty(40);
//        festFestOrderDetailVO.setFestOrStotal(90);
		
		//刪除
//		festOrderDetailJDBCDAO.delete("FR0000");
		
		// 查詢
//		FestOrderDetailVO festFestOrderDetailVO = festFestOrderDetailJDBCDAO.findByPrimaryKey("FR00001");
//		System.out.println(festFestOrderDetailVO.getFestOrId());
//		System.out.println(festFestOrderDetailVO.getFestMId());
//		System.out.println(festFestOrderDetailVO.getFestOrRate());
//		System.out.println(festFestOrderDetailVO.getFestOrQty());
//		System.out.println(festFestOrderDetailVO.getFestOrStotal());
		
//		List<FestOrderDetailVO> festOrderDetailVOs = festOrderDetailJDBCDAO.getAll();
//		for(FestOrderDetailVO festOrderDetailVO:festOrderDetailVOs) {
//			
//			System.out.println(festFestOrderDetailVO.getFestOrId() + " ");
//			System.out.println(festFestOrderDetailVO.getFestMId() + " ");
//			System.out.println(festFestOrderDetailVO.getFestOrRate() + " ");
//			System.out.println(festFestOrderDetailVO.getFestOrQty() + " ");
//			System.out.println(festFestOrderDetailVO.getFestOrStotal() + " ");
        

//		}
	}
}
