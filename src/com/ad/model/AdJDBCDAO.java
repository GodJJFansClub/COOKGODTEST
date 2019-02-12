package com.ad.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.List;

public class AdJDBCDAO implements AdDAO_interface {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "CA106";
	String passwd = "123456";
	
	private static final String INSERTSTMT =
			"INSERT INTO AD (ADID,ADSTATUS,ADSTART,ADEND,ADTYPE,ADTITLE,ADCON,FOODSUPID) VALUES (ADSeq.NEXTVAL, ?, ?, ?, ?, ?, ?, ?)";
	private static final String GET_ALLSTMT = 
			"SELECT ADID,ADSTATUS,toChar(ADSTART,'yyyy-mm-dd')ADSTART,toChar(ADEND,'yyyy-mm-dd')ADEND,ADTYPE,ADTITLE,ADCON,FOODSUPID FROM AD order by ADID";
	private static final String GET_ONESTMT = 
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
			
		}
	}
	@Override
	public void update(AdVO adVO) {
		// TODO Auto-generated method stub
		
	}
	@Override
	public void delete(String adid) {
		// TODO Auto-generated method stub
		
	}
	@Override
	public AdVO findByPrimaryKey(String adid) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public List<AdVO> getAll() {
		// TODO Auto-generated method stub
		return null;
	}
	

}
