package com.festDish.model;

import java.util.*;
import java.sql.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.report.model.ReportJDBCDAO;
import com.report.model.ReportVO;

public class FestDishDAO implements FestDish_Interface {

	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/CookGodDB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	private static final String INSERT_STMT = 
			"INSERT INTO FEST_ORDER (DISH_ID, FEST_M_ID) VALUES (?,?)";
	private static final String GET_ALL_STMT = "SELECT * FROM FEST_DISH";
	private static final String GET_ONE_STMT = "SELECT * FROM FEST_DISH WHERE DISH_ID = ?";
	private static final String UPDATE = "UPDATE FEST_M_ID SET WHERE DISH_ID = ? ";
	private static final String DELETE_STMT = "DELETE FROM FEST_DISH WHERE DISH_ID = ?";
	
	@Override
	public void insert(FestDishVO festDishVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);
			
			pstmt.setString(1, festDishVO.getDish_ID());
			pstmt.setString(2, festDishVO.getFest_m_ID());
		
			pstmt.executeUpdate();

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
	public void update(FestDishVO festDishVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, festDishVO.getDish_ID());
			pstmt.setString(2, festDishVO.getFest_m_ID());
			
			pstmt.executeUpdate();

			// Handle any driver errors
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
	public void delete(String dish_ID) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE_STMT);

			pstmt.setString(1, dish_ID);

			pstmt.executeUpdate();

			// Handle any driver errors
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
	public FestDishVO findByPrimaryKey(String dish_ID) {

		FestDishVO festDishVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setString(1, dish_ID);

			rs = pstmt.executeQuery();

			while (rs.next()) {
	
				pstmt.setString(1, festDishVO.getDish_ID());
				pstmt.setString(2, festDishVO.getFest_m_ID());
			}

			// Handle any driver errors
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
		return festDishVO;
	}

	@Override
	public List<FestDishVO> getAll(){
		List<FestDishVO> festDishVOs = new ArrayList<FestDishVO>();
		FestDishVO festDishVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				
				pstmt.setString(1, festDishVO.getDish_ID());
				pstmt.setString(2, festDishVO.getFest_m_ID());
			}

			// Handle any driver errors
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
		return festDishVOs;
	}

public static void main(String[] args) {
	
	ReportJDBCDAO dao = new ReportJDBCDAO();
	Calendar currentTime = Calendar.getInstance();
	java.sql.Timestamp sqlDate = new java.sql.Timestamp(currentTime.getTimeInMillis());
	// 新增
	
//	ReportVO reportVO = new ReportVO();
//	reportVO.setReport_title("主廚專區有網友發言不當");
//	reportVO.setReport_sort("檢舉文章");
//	reportVO.setReport_start(sqlDate);
//	reportVO.setReport_status("1");
//	reportVO.setReport_con("文章發言不當");
//	reportVO.setCust_ID("C00001");
//	reportVO.setForum_art_ID("A00001");	
//	dao.insert(reportVO);

	// 修改
	
//	ReportVO reportVO = new ReportVO();
//	reportVO.setReport_title("主廚專區並無網友發言不當");
//	reportVO.setReport_sort("檢舉文章");
//	reportVO.setReport_start(sqlDate);
//	reportVO.setReport_status("1");
//	reportVO.setReport_con("文章發言不當，建議刪除");
//	reportVO.setCust_ID("C00001");
//	reportVO.setForum_art_ID("A00001");
//	reportVO.setReport_ID("0");
//	dao.insert(reportVO);

	//刪除
//	dao.delete("8");
	
	// 查詢
//    ReportVO reportVO = dao.findByPrimaryKey("6");
//	System.out.println(reportVO.getReport_ID());
//	System.out.println(reportVO.getReport_title());
//	System.out.println(reportVO.getReport_sort());
//	System.out.println(reportVO.getReport_start());
//	System.out.println(reportVO.getReport_status());
//	System.out.println(reportVO.getReport_con());
//	System.out.println(reportVO.getCust_ID());
//	System.out.println(reportVO.getForum_art_ID());	

	//查詢全部
	List<ReportVO> list = dao.getAll();
	
	for(ReportVO reportVOs :list) {
		
		System.out.println(reportVOs.getReport_ID() + " ,");
		System.out.println(reportVOs.getReport_title() + ",");
		System.out.println(reportVOs.getReport_sort() + ",");
		System.out.println(reportVOs.getReport_start() + " ,");
		System.out.println(reportVOs.getReport_status()+ " ,");
		System.out.println(reportVOs.getReport_con()+ " ,");
		System.out.println(reportVOs.getCust_ID()+ " ,");
		System.out.println(reportVOs.getForum_art_ID()+ " ,");	
	}
}
}
