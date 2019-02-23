package com.festMenu.model;

import java.util.*;
import java.sql.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class FestMenuDAO implements FestMenu_Interface {

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
			"INSERT INTO FEST_MENU (FEST_M_ID, FEST_M_NAME, FEST_M_QTY, FEST_M_START, FEST_M_END, FEST_M_PIC, FEST_M_RESUME,"
					+ "FEST_M_SEND,FEST_M_STATUS,FEST_M_KIND,CHIF_ID) VALUES (?,?,?,?,? ?,?,?,?,?,?)";
	private static final String GET_ALL_STMT = "SELECT * FROM FEST_MENU";
	private static final String GET_ONE_STMT = "SELECT * FROM FEST_MENU WHERE FEST_M_ID = ?";
	private static final String UPDATE = "UPDATE FEST_ORDER_DETAIL SET FEST_M_NAME = ?,FEST_M_QTY = ?,FEST_M_START = ?,FEST_M_END= ?,FEST_M_PIC = ? "
			+ "FEST_M_RESUME= ?,FEST_M_SEND = ? ,FEST_M_STATUS = ?, FEST_M_KIND = ?,CHIF_ID = ? WHERE FEST_M_ID = ? ";
	private static final String DELETE_STMT = "DELETE FROM FEST_MENU WHERE FEST_M_ID = ?";
	
	@Override
	public void insert(FestMenuVO festMenuVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, festMenuVO.getFest_m_ID());
			pstmt.setString(2, festMenuVO.getFest_m_name());
			pstmt.setInt(3, festMenuVO.getFest_m_qty());
		    pstmt.setDate(4, festMenuVO.getFest_m_start());
		    pstmt.setDate(5, festMenuVO.getFest_m_end());
		    pstmt.setBytes(6, festMenuVO.getFest_m_pic());
		    pstmt.setString(7, festMenuVO.getFest_m_resume());
		    pstmt.setDate(8, festMenuVO.getFest_m_send());
		    pstmt.setString(9, festMenuVO.getFest_m_status());
		    pstmt.setString(10,festMenuVO.getFest_m_kind());
		    pstmt.setString(11, festMenuVO.getChif_ID());

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
	public void update(FestMenuVO festMenuVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, festMenuVO.getFest_m_ID());
			pstmt.setString(2, festMenuVO.getFest_m_name());
			pstmt.setInt(3, festMenuVO.getFest_m_qty());
		    pstmt.setDate(4, festMenuVO.getFest_m_start());
		    pstmt.setDate(5, festMenuVO.getFest_m_end());
		    pstmt.setBytes(6, festMenuVO.getFest_m_pic());
		    pstmt.setString(7, festMenuVO.getFest_m_resume());
		    pstmt.setDate(8, festMenuVO.getFest_m_send());
		    pstmt.setString(9, festMenuVO.getFest_m_status());
		    pstmt.setString(10,festMenuVO.getFest_m_kind());
		    pstmt.setString(11, festMenuVO.getChif_ID());

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
	public void delete(String fest_m_Id) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE_STMT);

			pstmt.setString(1, fest_m_Id);

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
	public FestMenuVO findByPrimaryKey(String fest_m_ID) {

		FestMenuVO festMenuVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setString(1, fest_m_ID);

			rs = pstmt.executeQuery();

			while (rs.next()) {
	
				pstmt.setString(1, festMenuVO.getFest_m_ID());
				pstmt.setString(2, festMenuVO.getFest_m_name());
				pstmt.setInt(3, festMenuVO.getFest_m_qty());
			    pstmt.setDate(4, festMenuVO.getFest_m_start());
			    pstmt.setDate(5, festMenuVO.getFest_m_end());
			    pstmt.setBytes(6, festMenuVO.getFest_m_pic());
			    pstmt.setString(7, festMenuVO.getFest_m_resume());
			    pstmt.setDate(8, festMenuVO.getFest_m_send());
			    pstmt.setString(9, festMenuVO.getFest_m_status());
			    pstmt.setString(10,festMenuVO.getFest_m_kind());
			    pstmt.setString(11, festMenuVO.getChif_ID());
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
		return festMenuVO;
	}

	@Override
	public List<FestMenuVO> getAll() {
		List<FestMenuVO> festMenuVOs = new ArrayList<FestMenuVO>();
		FestMenuVO festMenuVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				
				pstmt.setString(1, festMenuVO.getFest_m_ID());
				pstmt.setString(2, festMenuVO.getFest_m_name());
				pstmt.setInt(3, festMenuVO.getFest_m_qty());
			    pstmt.setDate(4, festMenuVO.getFest_m_start());
			    pstmt.setDate(5, festMenuVO.getFest_m_end());
			    pstmt.setBytes(6, festMenuVO.getFest_m_pic());
			    pstmt.setString(7, festMenuVO.getFest_m_resume());
			    pstmt.setDate(8, festMenuVO.getFest_m_send());
			    pstmt.setString(9, festMenuVO.getFest_m_status());
			    pstmt.setString(10,festMenuVO.getFest_m_kind());
			    pstmt.setString(11, festMenuVO.getChif_ID());
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
		return festMenuVOs;
	}
}