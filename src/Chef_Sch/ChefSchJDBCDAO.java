package Chef_Sch;

import java.sql.*;
import java.util.*;

public class ChefSchJDBCDAO implements ChefSchDAO_Interface {

	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "COOKGOD";
	String passwd = "123456";

	private static final String Insert_Stmt = 
			"INSERT INTO CHEF_SCH (CHEF_ID,CHEF_SCH_DATE,CHEF_SCH_STATUS) VALUES (?,?,?)";
	private static final String Updata_Stmt = 
			"UPDATE CHEF_SCH SET CHEF_SCH_STATUS = ? WHERE CHEF_ID = ? AND CHEF_SCH_DATE = ?";
	private static final String Delete_Stmt = 
			"DELETE FROM CHEF_SCH WHERE CHEF_ID = ? AND CHEF_SCH_DATE = ?";
	private static final String Get_One_Stmt = 
			"SELECT CS.CHEF_ID, CUST_NAME, CS.CHEF_SCH_DATE, CS.CHEF_SCH_STATUS FROM CHEF_SCH CS JOIN CUST ON CHEF_ID = CUST_ID AND CHEF_ID = ? AND CHEF_SCH_DATE = ?";
	private static final String Get_All_Stmt = 
			"SELECT C.CHEF_ID, CUST_NAME, CHEF_SCH_DATE, CHEF_SCH_STATUS FROM CHEF_SCH C JOIN CUST ON C.CHEF_ID=CUST_ID";

	@Override
	public void insert(ChefSchVO chefSchVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(Insert_Stmt);

			pstmt.setString(1, chefSchVO.getChefId());
			pstmt.setDate(2, chefSchVO.getChefSchDate());
			pstmt.setString(3, chefSchVO.getChefSchStatus());

			pstmt.executeUpdate();

		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
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
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(Updata_Stmt);

			pstmt.setString(1, chefSchVO.getChefSchStatus());
			pstmt.setString(2, chefSchVO.getChefId());
			pstmt.setDate(3, chefSchVO.getChefSchDate());

			pstmt.executeUpdate();

		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());			
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
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(Delete_Stmt);

			pstmt.setString(1, chefSchVO.getChefId());
			pstmt.setDate(2, chefSchVO.getChefSchDate());

			pstmt.executeUpdate();
			
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());			
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
	public ChefSchVO findByPrimaryKey(ChefSchVO chefSchVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(Get_One_Stmt);
			
			pstmt.setString(1, chefSchVO.getChefId());
			pstmt.setDate(2, chefSchVO.getChefSchDate());
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				chefSchVO = new ChefSchVO();
				chefSchVO.setChefId(rs.getString("CHEF_ID"));
				chefSchVO.setChefName(rs.getString("CUST_NAME"));
				chefSchVO.setChefSchDate(rs.getDate("CHEF_SCH_DATE"));
				chefSchVO.setChefSchStatus(rs.getString("CHEF_SCH_STATUS"));
			}			
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());			
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
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(Get_All_Stmt);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				chefSchVO = new ChefSchVO();
				chefSchVO.setChefId("CHEF_ID");
				chefSchVO.setChefName("CUST_NAME");
				chefSchVO.setChefId("CHEF_SCH_DATE");
				chefSchVO.setChefId("CHEF_SCH_STATUS");
				listAllChefSch.add(chefSchVO);
			}
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());			
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
		
		ChefSchJDBCDAO dao = new ChefSchJDBCDAO();
		
		// Insert
//		哲成的修改當日
//		Calendar calendar = Calendar.getInstance();
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
		java.sql.Date date04=java.sql.Date.valueOf("2019-02-20");	//Date
		ChefSchVO chefSch04 = new ChefSchVO();
		chefSch04.setChefId("C00002");
		chefSch04.setChefSchDate(date04);
		dao.findByPrimaryKey(chefSch04);
		
		System.out.println(chefSch04.getChefId());
		System.out.println(chefSch04.getChefName());
		System.out.println(chefSch04.getChefSchDate());
		System.out.println(chefSch04.getChefSchStatus());
		System.out.println("--------------------------------");
		
		//Select_All
//		List<ChefVO> list = dao.getAll();
//		for(ChefVO chef:list) {
//			System.out.print(chef.getChefId()+ ",");
//			System.out.print(chef.getChefName()+ ",");
//			System.out.print(chef.getChefAddr()+ ",");
//			System.out.print(chef.getChefTel());
//		}

	}
}
