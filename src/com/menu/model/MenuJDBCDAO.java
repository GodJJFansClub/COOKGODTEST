package com.menu.model;

import java.util.*;
import com.menuDish.model.*;
import com.testuse.PicIOTest;
import java.sql.*;

public  class MenuJDBCDAO implements MenuDAO_interface {

	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "COOKGOD";
	String passwd = "123456";

	private static final String INSERT_STMT = "INSERT INTO MENU (MENU_ID,MENU_NAME,MENU_RESUME,MENU_PIC,MENU_STATUS,MENU_PRICE) VALUES ('M'||LPAD((MENU_SEQ.NEXTVAL),5,'0'),?, ?, ?, ?, ?)";
	private static final String GET_ALL_STMT = "SELECT * FROM MENU";
	private static final String GET_ONE_STMT = "SELECT * FROM MENU WHERE MENU_ID = ?";
	private static final String GET_Dishs_ByMenuID_STMT = "SELECT * FROM MENU_DISH where MENU_ID=? ";
	
	private static final String DELETE_DISHs ="DELETE FROM MENU_DISH where MENU_ID=?";
	private static final String DELETE_MENU =" DELETE FROM MENU where MENU_ID=?";
	private static final String UPDATE = "UPDATE MENU SET MENU_NAME= ?, MENU_RESUME= ?, MENU_PIC= ?, MENU_STATUS= ?, MENU_PRICE= ? WHERE MENU_ID = ?";

	@Override
	public void insert(MenuVO menuVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, menuVO.getMenu_name());
			pstmt.setString(2, menuVO.getMenu_resume());
			pstmt.setBytes(3, menuVO.getMenu_pic());
			pstmt.setString(4, menuVO.getMenu_status());
			pstmt.setInt(5, menuVO.getMenu_price());

			pstmt.executeUpdate();

		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
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
	public void update(MenuVO menuVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, menuVO.getMenu_name());
			pstmt.setString(2, menuVO.getMenu_resume());
			pstmt.setBytes(3, menuVO.getMenu_pic());
			pstmt.setString(4, menuVO.getMenu_status());
			pstmt.setInt(5, menuVO.getMenu_price());
			pstmt.setString(6, menuVO.getMenu_ID());

			pstmt.executeUpdate();

		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
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
	public void delete(String menu_ID) {
		
		int updateCount_DISHs = 0;

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);

			
			con.setAutoCommit(false);

			
			pstmt = con.prepareStatement(DELETE_DISHs);
			pstmt.setString(1, menu_ID);
			updateCount_DISHs = pstmt.executeUpdate();
			
			pstmt = con.prepareStatement(DELETE_MENU);
			pstmt.setString(1, menu_ID);
			pstmt.executeUpdate();

			
			con.commit();
			con.setAutoCommit(true);
			System.out.println("刪除套餐編號" + menu_ID + "時,共有菜色" + updateCount_DISHs
					+ "道同時被刪除");
			
			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			if (con != null) {
				try {
					
					con.rollback();
				} catch (SQLException excep) {
					throw new RuntimeException("rollback error occured. "
							+ excep.getMessage());
				}
			}
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
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
	public MenuVO findByPrimaryKey(String menu_ID) {
		MenuVO menuVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);

			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setString(1, menu_ID);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				menuVO = new MenuVO();
				menuVO.setMenu_ID(rs.getString("MENU_ID"));
				menuVO.setMenu_name(rs.getString("MENU_NAME"));
				menuVO.setMenu_resume(rs.getString("MENU_RESUME"));
				menuVO.setMenu_pic(rs.getBytes("MENU_PIC"));
				menuVO.setMenu_status(rs.getString("MENU_STATUS"));
				menuVO.setMenu_price(rs.getInt("MENU_PRICE"));
			}

		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "+ e.getMessage());
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
		return menuVO;
	}

	@Override
	public List<MenuVO> getAll() {
		List<MenuVO> list = new ArrayList<MenuVO>();
		MenuVO menuVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				menuVO = new MenuVO();
				menuVO.setMenu_ID(rs.getString("MENU_ID"));
				menuVO.setMenu_name(rs.getString("MENU_NAME"));
				menuVO.setMenu_resume(rs.getString("MENU_RESUME"));
				menuVO.setMenu_pic(rs.getBytes("MENU_PIC"));
				menuVO.setMenu_status(rs.getString("MENU_STATUS"));
				menuVO.setMenu_price(rs.getInt("MENU_PRICE"));
				list.add(menuVO);
			}

		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "+ e.getMessage());
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

	@Override
	public Set<MenuDishVO> getDishsByMenuID(String menu_ID) {
		
		
		Set<MenuDishVO> set = new HashSet<MenuDishVO>();
		MenuDishVO menuDishVO = null;
	
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
	
		try {
	
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_Dishs_ByMenuID_STMT);
			pstmt.setString(1, menu_ID);
			rs = pstmt.executeQuery();
	
			while (rs.next()) {
				menuDishVO = new MenuDishVO();
				
				menuDishVO.setMenu_ID(rs.getString("menu_ID"));
				menuDishVO.setDish_ID(rs.getString("dish_ID"));
				
				set.add(menuDishVO); 
			}

		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "+ e.getMessage());
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
		return set;
	}

	@Override
	public void insertWithDishs(MenuVO menuVO, List<MenuDishVO> list) {
		
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			
			
    		con.setAutoCommit(false);
			
    		
			String cols[] = {"MENU_ID"};
			pstmt = con.prepareStatement(INSERT_STMT , cols);
			
			pstmt.setString(1, menuVO.getMenu_name());
			pstmt.setString(2, menuVO.getMenu_resume());
			pstmt.setBytes(3, menuVO.getMenu_pic());
			pstmt.setString(4, menuVO.getMenu_status());
			pstmt.setInt(5, menuVO.getMenu_price());
			
			pstmt.executeUpdate();
			
			String next_menu_ID = null;
			ResultSet rs = pstmt.getGeneratedKeys();
			if (rs.next()) {
				next_menu_ID = rs.getString(1);
				System.out.println("自增主鍵值" + next_menu_ID +"(剛新增成功的套餐編號)");
			} else {
				System.out.println("未取的自增主鍵值");
			}
			rs.close();
			
			MenuDishJDBCDAO dao = new MenuDishJDBCDAO();
			System.out.println("list.size()-A="+list.size());
			for (MenuDishVO aMenuDish : list) {
				aMenuDish.setMenu_ID(new String(next_menu_ID)) ;
				dao.insert2(aMenuDish,con);
			}

			
			con.commit();
			con.setAutoCommit(true);
			System.out.println("list.size()-B="+list.size());
			System.out.println("新增套餐編號" + next_menu_ID + "時,共有菜色" + list.size()
					+ "道同時被新增");
			
			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			if (con != null) {
				try {
					
					System.err.print("Transaction is being ");
					System.err.println("rolled back-由-Menu");
					con.rollback();
				} catch (SQLException excep) {
					throw new RuntimeException("rollback error occured. "
							+ excep.getMessage());
				}
			}
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
	
	
	public static void main(String[] args) {

		MenuJDBCDAO dao = new MenuJDBCDAO();
		// 新增
		com.testuse.PicIOTest pic = new com.testuse.PicIOTest();
		
		MenuVO menuVO = new MenuVO();
		
		menuVO.setMenu_name("雞祥如意");
		menuVO.setMenu_resume("精選8種頂級餡料，特別保留烘烤時滲出的精華原汁，加入白酒與洋蔥拌炒成烤雞肉汁，享用時佐以微酸帶甜的蔓越莓醬，襯托出雞肉的鮮甜美味。");
		menuVO.setMenu_pic(pic.getPictureByteArray("C:/T3/年菜套餐/雞祥如意.jpeg"));
		menuVO.setMenu_status("M1");
		menuVO.setMenu_price(1280);
		
		
		List<MenuDishVO> testList = new ArrayList<MenuDishVO>();
		
		MenuDishVO menuDishVO1 = new MenuDishVO();
		
		menuDishVO1.setMenu_ID("M00002");
		menuDishVO1.setDish_ID("D00014");
		

		MenuDishVO menuDishVO2  = new MenuDishVO();
		
		menuDishVO2.setMenu_ID("M00002");
		menuDishVO2.setDish_ID("D00015");
		
		testList.add(menuDishVO1);
		testList.add(menuDishVO2);
		
		dao.insertWithDishs(menuVO, testList);
		
	}
}

		