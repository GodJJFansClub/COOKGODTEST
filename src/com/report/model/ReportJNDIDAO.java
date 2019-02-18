package com.report.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class ReportJNDIDAO implements Report_Interface {
	
	// 一個應用程式中,針對一個資料庫 ,共用一個DataSource即可
		private static DataSource ds = null;
		static {
			try {
				Context ctx = new InitialContext();
				ds = (DataSource) ctx.lookup("java:comp/env/jdbc/TestDB");
			} catch (NamingException e) {
				e.printStackTrace();
			}
		}

		private static final String INSERT_STMT = 
				"INSERT INTO REPORT (REPORT_TITLE,REPORT_SORT,"
			  + "REPORT_START,REPORT_ID_STATUS,REPORT_CON,CUST_ID,FORUM_ART_ID) VALUES (REPORT_SEQ.NEXTVAL, ?, ?, ?, ?, ?, ?,?)";
		private static final String GET_ALL_STMT = 
				"SELECT * FROM REPORT";
		private static final String GET_ONE_STMT = 
				"SELECT * FROM REPORT WHERE REPORT_ID = ?";
		private static final String DELETE = 
				"DELETE FROM REPORT WHERE REPORT_ID = ?";
		private static final String UPDATE = 
				"UPDATE REPORT SET REPORT_TITLE =? REPORT_SORT = ?"
                + " REPORT_START = ? REPORT_ID_STATUS = ?, REPORT_CON = ?,CUST_ID = ?"
                + ",FORUM_ART_ID = ? WHERE REPORT_ID = ?";

		@Override
		public void insert(ReportVO reportVO) {

			Connection con = null;
			PreparedStatement pstmt = null;

			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(INSERT_STMT);

				pstmt.setString(1, reportVO.getReport_title());
				pstmt.setString(2, reportVO.getReport_sort());
				pstmt.setTimestamp(3, reportVO.getReport_start());
				pstmt.setString(4, reportVO.getReport_status());
				pstmt.setString(5, reportVO.getReport_con());
				pstmt.setString(6, reportVO.getCust_ID());
				pstmt.setString(7, reportVO.getForum_art_ID());

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
		public void update(ReportVO reportVO) {

			Connection con = null;
			PreparedStatement pstmt = null;

			try {

				con = ds.getConnection();
				pstmt = con.prepareStatement(UPDATE);

				pstmt.setString(1, reportVO.getReport_title());
				pstmt.setString(2, reportVO.getReport_sort());
				pstmt.setTimestamp(3, reportVO.getReport_start());
				pstmt.setString(4, reportVO.getReport_status());
				pstmt.setString(5, reportVO.getReport_con());
				pstmt.setString(6, reportVO.getCust_ID());
				pstmt.setString(7, reportVO.getForum_art_ID());
				pstmt.setString(8, reportVO.getReport_ID());

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
		public void delete(String report_ID) {

			Connection con = null;
			PreparedStatement pstmt = null;

			try {

				con = ds.getConnection();
				pstmt = con.prepareStatement(DELETE);

				pstmt.setString(1, report_ID);

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
		public ReportVO findByPrimaryKey(String report_ID) {

			ReportVO reportVO = null;
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			try {

				con = ds.getConnection();
				pstmt = con.prepareStatement(GET_ONE_STMT);

				pstmt.setString(1, report_ID);

				rs = pstmt.executeQuery();

				while (rs.next()) {
					// empVo 也稱為 Domain objects
					reportVO = new ReportVO();
					reportVO.setReport_ID(rs.getString(1));
					reportVO.setReport_title(rs.getString(2));
					reportVO.setReport_sort(rs.getString(3));
					reportVO.setReport_start(rs.getTimestamp(4));
					reportVO.setReport_status(rs.getString(5));
					reportVO.setReport_con(rs.getString(6));
					reportVO.setCust_ID(rs.getString(7));
					reportVO.setForum_art_ID(rs.getString(8));
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
			return reportVO;
		}

		@Override
		public List<ReportVO> getAll() {
			List<ReportVO> reportVOs = new ArrayList<ReportVO>();
			ReportVO reportVO = null;

			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			try {

				con = ds.getConnection();
				pstmt = con.prepareStatement(GET_ALL_STMT);
				rs = pstmt.executeQuery();

				while (rs.next()) {
					// empVO 也稱為 Domain objects
					reportVO = new ReportVO();
					reportVO.setReport_ID(rs.getString(1));
					reportVO.setReport_title(rs.getString(2));
					reportVO.setReport_sort(rs.getString(3));
					reportVO.setReport_start(rs.getTimestamp(4));
					reportVO.setReport_status(rs.getString(5));
					reportVO.setReport_con(rs.getString(6));
					reportVO.setCust_ID(rs.getString(7));
					reportVO.setForum_art_ID(rs.getString(8));	
					reportVOs.add(reportVO);
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
			return reportVOs;
		}

}
