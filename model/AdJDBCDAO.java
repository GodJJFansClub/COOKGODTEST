package com.ad.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;



public class AdJDBCDAO implements AdDAO_interface {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "CookGod";
	String passwd = "123456";
	
	private static final String INSERT_STMT =
			"INSERT INTO AD (ADID,ADSTATUS,ADSTART,ADEND,ADTYPE,ADTITLE,ADCON,FOODSUPID) VALUES (ADSeq.NEXTVAL, ?, ?, ?, ?, ?, ?, ?)";
	private static final String GET_ALL_STMT = 
			"SELECT ADID,ADSTATUS,toChar(ADSTART,'yyyy-mm-dd')ADSTART,toChar(ADEND,'yyyy-mm-dd')ADEND,ADTYPE,ADTITLE,ADCON,FOODSUPID FROM AD order by ADID";
	private static final String GET_ONE_STMT = 
			"SELECT ADID,ADSTATUS,toChar(ADSTART,'yyyy-mm-dd')ADSTART,toChar(ADEND,'yyyy-mm-dd')ADEND,ADTYPE,ADTITLE,ADCON,FOODSUPID FROM AD where ADID = ?";
	private static final String DELETE =
			"DELETE FROM AD where ADID=? ";
	private static final String UPDATE =
			"UPDATE AD set ADSTATUS=?, ADSTART=?, ADEND=?, ADTYPE=?, ADTITLE=?, ADCON=?, FOODSUPID=? where ADID=?";
	
	@Override
	public void insert(AdVO adVO) {
		// TODO Auto-generated method stub
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);
			
			pstmt.setString(1, adVO.getAdStatus());
			pstmt.setTimestamp(2, adVO.getAdStart());
			pstmt.setTimestamp(3, adVO.getAdEnd());
			pstmt.setString(4, adVO.getAdType());
			pstmt.setString(5, adVO.getAdTitle());
			pstmt.setString(6, adVO.getAdCon());
			pstmt.setString(7, adVO.getFoodSupId());
			
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
	public void update(AdVO adVO) {
		// TODO Auto-generated method stub
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);
			
			pstmt.setString(1, adVO.getAdStatus());
			pstmt.setTimestamp(2, adVO.getAdStart());
			pstmt.setTimestamp(3, adVO.getAdEnd());
			pstmt.setString(4, adVO.getAdType());
			pstmt.setString(5, adVO.getAdTitle());
			pstmt.setString(6, adVO.getAdCon());
			pstmt.setString(7, adVO.getFoodSupId());
			
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
	public void delete(String adid) {
		// TODO Auto-generated method stub
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);
			
			pstmt.setString(1, adid);
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
	public AdVO findByPrimaryKey(String adid) {
		// TODO Auto-generated method stub
		AdVO adVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);
			
			pstmt.setString(1, adid);
			pstmt.executeQuery();
			
			while (rs.next()) {
				adVO = new AdVO();
				adVO.setAdId(rs.getString("AdID"));
				adVO.setAdStatus(rs.getString("AdSTATUS"));
				adVO.setAdStart(rs.getTimestamp("AdSTART"));
				adVO.setAdEnd(rs.getTimestamp("AdEND"));
				adVO.setAdType(rs.getString("AdTYPE"));
				adVO.setAdTitle(rs.getString("AdTITLE"));
				adVO.setAdCon(rs.getString("AdCON"));
				adVO.setFoodSupId(rs.getString("foodSupId"));
			}
			
		}catch (ClassNotFoundException e) {
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
		}return adVO;
	}
	@Override
	public List<AdVO> getAll() {
		// TODO Auto-generated method stub
		List<AdVO> list = new ArrayList<AdVO>();
		AdVO adVO = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				adVO = new AdVO();
				adVO.setAdId(rs.getString("AdID"));
				adVO.setAdStatus(rs.getString("AdSTATUS"));
				adVO.setAdStart(rs.getTimestamp("AdSTART"));
				adVO.setAdEnd(rs.getTimestamp("AdEND"));
				adVO.setAdType(rs.getString("AdTYPE"));
				adVO.setAdTitle(rs.getString("AdTITLE"));
				adVO.setAdCon(rs.getString("AdCON"));
				adVO.setFoodSupId(rs.getString("foodSupId"));
				list.add(adVO);
			}
			
		}catch (ClassNotFoundException e) {
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
		return list;
	}
	
	public static void main(String[] args) {

		AdJDBCDAO dao = new AdJDBCDAO();
		AdVO adVO1 = new AdVO();
		adVO1.setAdStatus("A1");
		adVO1.setAdStart(java.sql.Timestamp.valueOf("2019-03-05 00:00:00"));
		adVO1.setAdEnd(java.sql.Timestamp.valueOf("2019-06-30 00:00:00"));
		adVO1.setAdId("AD0001");
		adVO1.setAdTitle("����");
		adVO1.setAdType("A2");
		adVO1.setAdCon("d555555555555d5dd5dd5d5d5");
	}
}
