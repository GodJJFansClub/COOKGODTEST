package com.ad.model;

import java.sql.*;
import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;


public class AdDAO implements AdDAO_interface {

	private static DataSource ds = null;
	static {
		try{
			Context ctx = new InitialContext();
			ds =(DataSource) ctx.lookup("java:comp/env/jdbc/TestDB");
		}catch(NamingException e) {
			e.printStackTrace();
		}
	}
	
	private static final String INSERT_STMT =
			"INSERT INTO AD (ADID,ADSTATUS,ADSTART,ADEND,ADTYPE,ADTITLE,ADCON,FOODSUPID) VALUES (ADSeq.NEXTVAL, ?, ?, ?, ?, ?, ?, ?)";
	private static final String GET_ALL_STMT = 
			"SELECT ADID,ADSTATUS,toChar(ADSTART,'yyyy-mm-dd hh24:mi:ss')ADSTART,toChar(ADEND,'yyyy-mm-dd hh24:mi:ss')ADEND,ADTYPE,ADTITLE,ADCON,FOODSUPID FROM AD order by ADID";
	private static final String GET_ONE_STMT = 
			"SELECT ADID,ADSTATUS,toChar(ADSTART,'yyyy-mm-dd hh24:mi:ss')ADSTART,toChar(ADEND,'yyyy-mm-dd hh24:mi:ss')ADEND,ADTYPE,ADTITLE,ADCON,FOODSUPID FROM AD where ADID = ?";
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
			con =ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);
			
			pstmt.setString(1, adVO.getAdStatus());
			pstmt.setTimestamp(2, adVO.getAdStart());
			pstmt.setTimestamp(3, adVO.getAdEnd());
			pstmt.setString(4, adVO.getAdType());
			pstmt.setString(5, adVO.getAdTitle());
			pstmt.setString(6, adVO.getAdCon());
			pstmt.setString(7, adVO.getFoodSupId());
			
			pstmt.executeUpdate();		
		}catch(SQLException se) {
			throw new RuntimeException("A database error occured."+se.getMessage());
		}finally {
			if(pstmt != null) {
				try {
					pstmt.close();
				}catch(SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if(con != null) {
				try {
					con.close();
				}catch (Exception e) {
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
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);
			
			pstmt.setString(1, adVO.getAdStatus());
			pstmt.setTimestamp(2, adVO.getAdStart());
			pstmt.setTimestamp(3, adVO.getAdEnd());
			pstmt.setString(4, adVO.getAdType());
			pstmt.setString(5, adVO.getAdTitle());
			pstmt.setString(6, adVO.getAdCon());
			pstmt.setString(7, adVO.getFoodSupId());
			pstmt.setString(8, adVO.getAdId());
			
			pstmt.executeUpdate();		
		}catch(SQLException se) {
			throw new RuntimeException("A database error occured."+se.getMessage());
		}finally {
			if(pstmt != null) {
				try {
					pstmt.close();
				}catch(SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if(con != null) {
				try {
					con.close();
				}catch (Exception e) {
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
			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);
			
			
			pstmt.setString(1,adid);
			
			pstmt.executeUpdate();		
		}catch(SQLException se) {
			throw new RuntimeException("A database error occured."+se.getMessage());
		}finally {
			if(pstmt != null) {
				try {
					pstmt.close();
				}catch(SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if(con != null) {
				try {
					con.close();
				}catch (Exception e) {
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
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);
			
			pstmt.setString(1, adid);
			
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
			}
			
		}catch (SQLException se) {
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
		return adVO;
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
			con = ds.getConnection();
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
			 }
			}catch (SQLException se) {
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
		
		return list;
	}
	
}
