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
			"Insert into AD (AD_ID,AD_STATUS,AD_START,AD_END,AD_TYPE,AD_TITLE,AD_CON,FOOD_SUP_ID)  VALUES ('AD'||LPAD((AD_SEQ.NEXTVAL),6,'0'), ?, ?, ?, ?, ?, ? ,?)";
	private static final String GET_ALL_STMT = 
			"SELECT AD_ID,AD_STATUS,to_Char(AD_START,'yyyy-mm-dd hh:mm:ss')AD_START,to_Char(AD_END,'yyyy-mm-dd hh:mm:ss')AD_END,AD_TYPE,AD_TITLE,AD_CON,FOOD_SUP_ID FROM AD order by AD_ID";
	private static final String GET_ONE_STMT = 
			"SELECT AD_ID,AD_STATUS,to_Char(AD_START,'yyyy-mm-dd hh:mm:ss')AD_START,to_Char(AD_END,'yyyy-mm-dd hh:mm:ss')AD_END,AD_TYPE,AD_TITLE,AD_CON,FOOD_SUP_ID FROM AD where AD_ID = ?";
	private static final String DELETE =
			"DELETE FROM AD where AD_ID=? ";
	private static final String UPDATE =
			"UPDATE AD set AD_STATUS=?, AD_START=?, AD_END=?, AD_TYPE=?, AD_TITLE=?, AD_CON=?, FOOD_SUP_ID=? where AD_ID=?";

//	簡易版
//	private static final String GET_ALL_STMT = 
//			"SELECT * FROM AD";
//	private static final String GET_ONE_STMT = 
//			"SELECT * FROM AD where AD_ID = ?";
	
	@Override
	public void insert(AdVO adVO) {
		// TODO Auto-generated method stub
		Connection con = null;
		PreparedStatement pstmt = null;
		int a=1;
		double b=(double)a;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);
			
			pstmt.setString(1, adVO.getAd_status());
			pstmt.setTimestamp(2, adVO.getAd_start());
			pstmt.setTimestamp(3, adVO.getAd_end());
			pstmt.setString(4, adVO.getAd_type());
			pstmt.setString(5, adVO.getAd_title());
			pstmt.setString(6, adVO.getAd_con());
			pstmt.setString(7, adVO.getFood_sup_ID());
			
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
			
			pstmt.setString(1, adVO.getAd_status());
			pstmt.setTimestamp(2, adVO.getAd_start());
			pstmt.setTimestamp(3, adVO.getAd_end());
			pstmt.setString(4, adVO.getAd_type());
			pstmt.setString(5, adVO.getAd_title());
			pstmt.setString(6, adVO.getAd_con());
			pstmt.setString(7, adVO.getFood_sup_ID());
			pstmt.setString(8,adVO.getAd_ID());
			
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
	public void delete(String ad_ID) {
		// TODO Auto-generated method stub
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);
			
			pstmt.setString(1, ad_ID);
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
	public AdVO findByPrimaryKey(String ad_ID) {
		// TODO Auto-generated method stub
		AdVO adVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);
			
			pstmt.setString(1, ad_ID);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				adVO = new AdVO();
				adVO.setAd_ID(rs.getString("AD_ID"));
				adVO.setAd_status(rs.getString("AD_STATUS"));
				adVO.setAd_start(rs.getTimestamp("AD_START"));
				adVO.setAd_end(rs.getTimestamp("AD_END"));
				adVO.setAd_type(rs.getString("AD_TYPE"));
				adVO.setAd_title(rs.getString("AD_TITLE"));
				adVO.setAd_con(rs.getString("AD_CON"));
				adVO.setFood_sup_ID(rs.getString("FOOD_SUP_ID"));
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
				adVO.setAd_ID(rs.getString("AD_ID"));
				adVO.setAd_status(rs.getString("AD_STATUS"));
				adVO.setAd_start(rs.getTimestamp("AD_START"));
				adVO.setAd_end(rs.getTimestamp("AD_END"));
				adVO.setAd_type(rs.getString("AD_TYPE"));
				adVO.setAd_title(rs.getString("AD_TITLE"));
				adVO.setAd_con(rs.getString("AD_CON"));
				adVO.setFood_sup_ID(rs.getString("FOOD_SUP_ID"));
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
		
		//新增
		AdVO adVO1 = new AdVO();
		adVO1.setAd_status("1");
		adVO1.setAd_start(java.sql.Timestamp.valueOf("2019-02-12 21:12:24"));
		adVO1.setAd_end(java.sql.Timestamp.valueOf("2019-02-12 21:12:24"));
		adVO1.setAd_title("test");
		adVO1.setAd_type("2");
		adVO1.setAd_con("12313");
		adVO1.setFood_sup_ID("T00003");
		dao.insert(adVO1);
		
		//修改
		AdVO adVO2 = new AdVO();
		adVO2.setAd_ID("AD000004");
		adVO2.setAd_status("2");
		adVO2.setAd_start(java.sql.Timestamp.valueOf("2018-02-12 21:12:24"));
		adVO2.setAd_end(java.sql.Timestamp.valueOf("2019-02-12 21:12:24"));
		adVO2.setAd_title("test123");
		adVO2.setAd_type("2");
		adVO2.setAd_con("12313");
		adVO2.setFood_sup_ID("T00003");
		dao.update(adVO2);
		
		// 刪除
		dao.delete("AD000006");
		
		//查詢
		AdVO adVO3 = dao.findByPrimaryKey("AD000004");
		System.out.println(adVO3.getAd_status()+",");
		System.out.println(adVO3.getAd_start()+",");
		System.out.println(adVO3.getAd_end()+",");
		System.out.println(adVO3.getAd_title()+",");
		System.out.println(adVO3.getAd_type()+",");
		System.out.println(adVO3.getAd_con()+",");
		System.out.println(adVO3.getFood_sup_ID()+",");
		System.out.println("-------");
		
		//查詢all
		List<AdVO> list = dao.getAll();
		for (AdVO aAd: list) {
			System.out.println(aAd.getAd_ID()+",");
			System.out.println(aAd.getAd_status()+",");
			System.out.println(aAd.getAd_start()+",");
			System.out.println(aAd.getAd_end());
			System.out.println(aAd.getAd_title()+",");
			System.out.println(aAd.getAd_con()+",");
			System.out.println(aAd.getFood_sup_ID()+",");
		}
		
	}
}
