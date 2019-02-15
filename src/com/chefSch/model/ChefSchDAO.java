package com.chefSch.model;

import java.sql.*;
import java.sql.Date;
import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class ChefSchDAO implements ChefSchDAO_Interface {

	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/CookGodDB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	private static final String Insert_Stmt = 
			"INSERT INTO CHEF_SCH (CHEF_ID,CHEF_SCH_DATE,CHEF_SCH_STATUS) VALUES (?,?,?)";
	private static final String Updata_Stmt = 
			"UPDATE CHEF_SCH SET CHEF_SCH_STATUS = ? WHERE CHEF_ID = ? AND CHEF_SCH_DATE = ?";
	private static final String Delete_Stmt = 
			"DELETE FROM CHEF_SCH WHERE CHEF_ID = ? AND CHEF_SCH_DATE = ?";
	private static final String Get_One_Stmt = 
			"SELECT CS.CHEF_ID, CUST_NAME, CS.CHEF_SCH_DATE, CS.CHEF_SCH_STATUS FROM CHEF_SCH CS JOIN CUST ON CHEF_ID = CUST_ID AND CHEF_ID = ? AND CHEF_SCH_DATE = ?";
	private static final String Get_All_Stmt = 
			"SELECT CS.CHEF_ID, CUST_NAME, CS.CHEF_SCH_DATE, CS.CHEF_SCH_STATUS FROM CHEF_SCH CS JOIN CUST ON CHEF_ID = CUST_ID ";

	@Override
	public void insert(ChefSchVO chefSchVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(Insert_Stmt);

			pstmt.setString(1, chefSchVO.getChef_ID());
			pstmt.setDate(2, chefSchVO.getChef_sch_date());
			pstmt.setString(3, chefSchVO.getChef_sch_status());

			pstmt.executeUpdate();

		} catch (SQLException se) {
			throw new RuntimeException("Database Error : " + se.getStackTrace());
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
	public void update(ChefSchVO chefSchVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(Updata_Stmt);

			pstmt.setString(1, chefSchVO.getChef_sch_status());
			pstmt.setString(2, chefSchVO.getChef_ID());
			pstmt.setDate(3, chefSchVO.getChef_sch_date());

			pstmt.executeUpdate();

		} catch (SQLException se) {
			throw new RuntimeException("Database Error : " + se.getMessage());
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
	public void delete(ChefSchVO chefSchVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(Delete_Stmt);

			pstmt.setString(1, chefSchVO.getChef_ID());
			pstmt.setDate(2, chefSchVO.getChef_sch_date());

			pstmt.executeUpdate();
			
		} catch (SQLException se) {
			throw new RuntimeException("Database Error : " + se.getMessage());
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
	public ChefSchVO findByPrimaryKey(String chefSchId,Date date) {
		ChefSchVO chefSchVO = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(Get_One_Stmt);
			
			pstmt.setString(1, chefSchId);
			pstmt.setDate(2, date);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				chefSchVO = new ChefSchVO();
				chefSchVO.setChef_ID(rs.getString("CHEF_ID"));
				chefSchVO.setChef_name(rs.getString("CUST_NAME"));
				chefSchVO.setChef_sch_date(rs.getDate("CHEF_SCH_DATE"));
				chefSchVO.setChef_sch_status(rs.getString("CHEF_SCH_STATUS"));
			}			
		} catch (SQLException se) {
			throw new RuntimeException("Database Error : " + se.getMessage());
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
		return chefSchVO;
	}

	@Override
	public List<ChefSchVO> getAll() {
		List<ChefSchVO> listAllChefSch = new ArrayList<ChefSchVO>();
		ChefSchVO chefSchVO = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(Get_All_Stmt);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				chefSchVO = new ChefSchVO();
				chefSchVO.setChef_ID(rs.getString("CHEF_ID"));
				chefSchVO.setChef_name(rs.getString("CUST_NAME"));
				chefSchVO.setChef_sch_date(rs.getDate("CHEF_SCH_DATE"));
				chefSchVO.setChef_sch_status(rs.getString("CHEF_SCH_STATUS"));
				listAllChefSch.add(chefSchVO);
			}
		} catch (SQLException se) {
			throw new RuntimeException("Database Error : " + se.getMessage());
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
		return listAllChefSch;
	}

	public static void main(String[] args) {
		
		ChefSchDAO dao = new ChefSchDAO();
		
		// Insert
//		Calendar calendar = Calendar.getInstance();	//當日日期by哲成
//		java.sql.Date date01= new java.sql.Date(calendar.getTimeInMillis());
				
//		java.sql.Date date01=java.sql.Date.valueOf("2019-03-14");	//Date
//		ChefSchVO chefSch01 = new ChefSchVO();
//		chefSch01.setChefId("C00002");
//		chefSch01.setChefSchDate(date01);
//		chefSch01.setChefSchStatus("3");
//		dao.insert(chefSch01);
		
		//Update
//		java.sql.Date date02=java.sql.Date.valueOf("2019-03-14");	//Date
//		ChefSchVO chefSch02 = new ChefSchVO();
//		chefSch02.setChefId("C00002");
//		chefSch02.setChefSchDate(date02);
//		chefSch02.setChefSchStatus("0");
//		dao.update(chefSch02);
		
		//Delete
//		java.sql.Date date03=java.sql.Date.valueOf("2019-03-14");	//Date
//		ChefSchVO chefSch03 = new ChefSchVO();
//		chefSch03.setChefId("C00002");
//		chefSch03.setChefSchDate(date03);
//		dao.delete(chefSch03);
		
		//Select
//		java.sql.Date date04=java.sql.Date.valueOf("2019-02-20");	//Date
//		ChefSchVO chefSch04 = dao.findByPrimaryKey("C00002",date04);		
//		System.out.println(chefSch04.getChef_ID());
//		System.out.println(chefSch04.getChef_name());
//		System.out.println(chefSch04.getChef_SCH_date());
//		System.out.println(chefSch04.getChef_SCH_status());
//		System.out.println("--------------------------------");
		
		//Select_All
//		List<ChefSchVO> list = dao.getAll();
//		for(ChefSchVO chefSch05:list) {
//			System.out.print(chefSch05.getChef_ID()+ ",");
//			System.out.print(chefSch05.getChef_name()+ ",");
//			System.out.print(chefSch05.getChef_SCH_date()+",");
//			System.out.print(chefSch05.getChef_SCH_status()+"\n");
//		}
	}
}
