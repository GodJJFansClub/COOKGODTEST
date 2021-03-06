package android.com.menuOrder.model;

import java.sql.*;
import java.util.*;



public class MenuOrderJDBCDAO implements MenuOrderDAO_Interface{
	
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "CA106";
	String passwd = "123456";
	
	private static final String Insert_Stmt = 
			"INSERT INTO MENU_ORDER (MENU_OD_ID,MENU_OD_STATUS,MENU_OD_START,MENU_OD_BOOK,CUST_ID,CHEF_ID,MENU_ID) VALUES ('MU'||TO_CHAR(CURRENT_DATE, 'YYYYMMDD')||'-'||LPAD(TO_CHAR(MENU_OD_ID_SEQ.NEXTVAL), 6, '0'),?,SYSDATE,?,?,?,?)";
	private static final String Update_Stmt = 
			"UPDATE MENU_ORDER SET MENU_OD_STATUS = ?, MENU_OD_BOOK = ?, MENU_OD_END = ?, MENU_OD_RATE = ?, MENU_OD_MSG = ? ,CHEF_ID = ?, MENU_ID = ? WHERE MENU_OD_ID = ?";
	private static final String Delete_Stmt = 
			"DELETE FROM MENU_ORDER WHERE MENU_OD_ID = ?";
	private static final String Get_One_Stmt = 
			"SELECT * FROM MENU_ORDER WHERE MENU_OD_ID = ?";
	private static final String Get_One_Stmt_CustID = 
			"SELECT * FROM MENU_ORDER WHERE CUST_ID = ?";
	private static final String Get_All_Stmt = 
			"SELECT * FROM MENU_ORDER";
	

	@Override
	public void insert(MenuOrderVO menuOrderVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(Insert_Stmt);
			
			pstmt.setString(1, menuOrderVO.getMenu_od_status());
			pstmt.setTimestamp(2, menuOrderVO.getMenu_od_book());
			pstmt.setString(3, menuOrderVO.getCust_ID());
			pstmt.setString(4, menuOrderVO.getChef_ID());
			pstmt.setString(5, menuOrderVO.getMenu_ID());
			
			pstmt.executeUpdate();
		
		}catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
		}catch(SQLException se){
			throw new RuntimeException("Database Error : " + se.getMessage());
		}finally {
			if(pstmt!=null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(con!=null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}	
	}

	@Override
	public void update(MenuOrderVO menuOrderVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(Update_Stmt);
			
			pstmt.setString(1, menuOrderVO.getMenu_od_status());
			pstmt.setTimestamp(2, menuOrderVO.getMenu_od_book());
			pstmt.setDate(3, menuOrderVO.getMenu_od_end());
			pstmt.setFloat(4, menuOrderVO.getMenu_od_rate());
			pstmt.setString(5, menuOrderVO.getMenu_od_msg());
			pstmt.setString(6, menuOrderVO.getChef_ID());
			pstmt.setString(7, menuOrderVO.getMenu_ID());	
			pstmt.setString(8, menuOrderVO.getMenu_od_ID());
			
			pstmt.executeUpdate();
			
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
		} catch (SQLException se) {
			throw new RuntimeException("Database Error : " + se.getMessage());
		}finally {
			if(pstmt!=null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(con!=null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}		
	}

	@Override
	public void delete(String menuOrderId) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(Delete_Stmt);
			
			pstmt.setString(1, menuOrderId);
			
			pstmt.executeUpdate();
			
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
		} catch (SQLException se) {
			throw new RuntimeException("Database Error : " + se.getMessage());
		}finally {
			if(pstmt!=null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(con!=null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}		
	}

	@Override
	public MenuOrderVO findByPrimaryKey(String menuOrderId) {
		MenuOrderVO menuOrderVO = null;

		Connection con = null;		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(Get_One_Stmt);
			
			pstmt.setString(1, menuOrderId);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				menuOrderVO = new MenuOrderVO();
				menuOrderVO.setMenu_od_ID(rs.getString("MENU_OD_ID"));
				menuOrderVO.setMenu_od_status(rs.getString("MENU_OD_STATUS"));
				menuOrderVO.setMenu_od_start(rs.getTimestamp("MENU_OD_START"));
				menuOrderVO.setMenu_od_book(rs.getTimestamp("MENU_OD_BOOK"));
				menuOrderVO.setMenu_od_end(rs.getDate("MENU_OD_END"));
				menuOrderVO.setMenu_od_rate(rs.getInt("MENU_OD_RATE"));
				menuOrderVO.setMenu_od_msg(rs.getString("MENU_OD_MSG"));
				menuOrderVO.setCust_ID(rs.getString("CUST_ID"));
				menuOrderVO.setChef_ID(rs.getString("CHEF_ID"));
				menuOrderVO.setMenu_ID(rs.getString("MENU_ID"));
			}			
			return menuOrderVO;
		
		}catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
		}catch(SQLException se){
			throw new RuntimeException("Database Error : " + se.getMessage());
		}finally {
			if(pstmt!=null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(con!=null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}	
	}

	@Override
	public List<MenuOrderVO> getAll() {
		List<MenuOrderVO> listAll = new ArrayList<MenuOrderVO>();
		MenuOrderVO menuOrderVO = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(Get_All_Stmt);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				menuOrderVO = new MenuOrderVO();
				menuOrderVO.setMenu_od_ID(rs.getString("MENU_OD_ID"));
				menuOrderVO.setMenu_od_status(rs.getString("MENU_OD_STATUS"));
				menuOrderVO.setMenu_od_start(rs.getTimestamp("MENU_OD_START"));
				menuOrderVO.setMenu_od_book(rs.getTimestamp("MENU_OD_BOOK"));
				menuOrderVO.setMenu_od_end(rs.getDate("MENU_OD_END"));
				menuOrderVO.setMenu_od_rate(rs.getInt("MENU_OD_RATE"));
				menuOrderVO.setMenu_od_msg(rs.getString("MENU_OD_MSG"));
				menuOrderVO.setCust_ID(rs.getString("CUST_ID"));
				menuOrderVO.setChef_ID(rs.getString("CHEF_ID"));
				menuOrderVO.setMenu_ID(rs.getString("MENU_ID"));
				listAll.add(menuOrderVO);
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
		return listAll;
	}
	
	public static void main(String[] args) {
		
		MenuOrderJDBCDAO dao = new MenuOrderJDBCDAO();
		
		//Insert
//		Timestamp time = Timestamp.valueOf("2019-02-12 01:02:03");
//		
//		MenuOrderVO menuOrder01 = new MenuOrderVO();
//		menuOrder01.setMenu_od_status("8");
//		menuOrder01.setMenu_od_book(time);
//		menuOrder01.setCust_ID("C00001");
//		menuOrder01.setChef_ID("C00002");
//		menuOrder01.setMenu_ID("M00001");
//		dao.insert(menuOrder01);
		
		//Update
//		Timestamp bookTime = Timestamp.valueOf("2019-02-25 05:20:13");
//		java.sql.Date endDate = java.sql.Date.valueOf("2019-03-03");
//		MenuOrderVO menuOrder02 = new MenuOrderVO(); 
//		menuOrder02.setMenu_od_ID("MU20190215-000033");
//		menuOrder02.setMenu_od_status("8");
//		menuOrder02.setMenu_od_book(bookTime);
//		menuOrder02.setMenu_od_end(endDate);
//		menuOrder02.setMenu_od_rate(5);
//		menuOrder02.setMenu_od_MSG("不好吃");
//		menuOrder02.setChef_ID("C00004");
//		menuOrder02.setMenu_ID("M00002");
//		dao.update(menuOrder02);
		
		//Delete
//		dao.delete("MU20190215-000034");
		
		//Select_One
//		MenuOrderVO menuOrder03 = dao.findByPrimaryKey("MU20121011-000001");
//		System.out.println(menuOrder03.getMenu_od_ID());
//		System.out.println(menuOrder03.getMenu_od_status());
//		System.out.println(menuOrder03.getMenu_od_start());
//		System.out.println(menuOrder03.getMenu_od_book());
//		System.out.println(menuOrder03.getMenu_od_end());
//		System.out.println(menuOrder03.getMenu_od_rate());
//		System.out.println(menuOrder03.getMenu_od_msg());
//		System.out.println(menuOrder03.getCust_ID());
//		System.out.println(menuOrder03.getChef_ID());
//		System.out.println(menuOrder03.getMenu_ID());
		
		//Select_All
//		List<MenuOrderVO> listAll = dao.getAll();
//		for(MenuOrderVO menuOrder04:listAll) {
//			System.out.print(menuOrder04.getMenu_od_ID()+",");
//			System.out.print(menuOrder04.getMenu_od_status()+",");
//			System.out.print(menuOrder04.getMenu_od_start()+",");
//			System.out.print(menuOrder04.getMenu_od_book()+",");
//			System.out.print(menuOrder04.getMenu_od_end()+",");
//			System.out.print(menuOrder04.getMenu_od_rate()+",");
//			System.out.print(menuOrder04.getMenu_od_msg()+",");
//			System.out.print(menuOrder04.getCust_ID()+",");
//			System.out.print(menuOrder04.getChef_ID()+",");
//			System.out.print(menuOrder04.getMenu_ID()+"\n");
//		}
	}

	@Override
	public List<MenuOrderVO> findByCustID(String cust_ID) {
		List<MenuOrderVO> listAll = new ArrayList<MenuOrderVO>();
		MenuOrderVO menuOrderVO = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Class.forName(driver);
//			con = ds.getConnection();
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(Get_One_Stmt_CustID);

			
			pstmt.setString(1, cust_ID);
			
			rs = pstmt.executeQuery();

			while (rs.next()) {
				menuOrderVO = new MenuOrderVO();
				menuOrderVO.setMenu_od_ID(rs.getString("MENU_OD_ID"));
				menuOrderVO.setMenu_od_status(rs.getString("MENU_OD_STATUS"));
				menuOrderVO.setMenu_od_start(rs.getTimestamp("MENU_OD_START"));
				menuOrderVO.setMenu_od_book(rs.getTimestamp("MENU_OD_BOOK"));
				menuOrderVO.setMenu_od_end(rs.getDate("MENU_OD_END"));
				menuOrderVO.setMenu_od_rate(rs.getInt("MENU_OD_RATE"));
				menuOrderVO.setMenu_od_msg(rs.getString("MENU_OD_MSG"));
				menuOrderVO.setCust_ID(rs.getString("CUST_ID"));
				menuOrderVO.setChef_ID(rs.getString("CHEF_ID"));
				menuOrderVO.setMenu_ID(rs.getString("MENU_ID"));
				listAll.add(menuOrderVO);
			}
		} catch (SQLException se) {
			throw new RuntimeException("Database Error : " + se.getMessage());
		}catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());	
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
		return listAll;
	}

	@Override
	public List<MenuOrderVO> findByChefID(String chef_ID) {
		// TODO Auto-generated method stub
		return null;
	}



	@Override
	public void updateMenuOdStatus(String menu_od_ID, String menu_od_status) {
		// TODO Auto-generated method stub
		
	}


	@Override
	public void updateMenuOdRate(String menu_od_ID, float menu_od_rate, String menu_od_msg) {
		// TODO Auto-generated method stub
		
	}
}
