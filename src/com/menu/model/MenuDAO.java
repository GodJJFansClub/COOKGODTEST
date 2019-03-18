package com.menu.model;

import java.util.*;
import java.sql.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import com.menuDish.model.MenuDishJDBCDAO;
import com.menuDish.model.MenuDishVO;

public class MenuDAO implements MenuDAO_interface {

	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/CookGodDB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	private static final String INSERT_STMT = "INSERT INTO MENU (MENU_ID,MENU_NAME,MENU_RESUME,MENU_PIC,MENU_STATUS,MENU_PRICE) VALUES ('M'||LPAD((MENU_SEQ.NEXTVAL),5,'0'),?, ?, ?,'0', ?)";
	private static final String GET_ALL_STMT = "SELECT * FROM MENU";
	private static final String GET_ONE_STMT = "SELECT * FROM MENU WHERE MENU_ID = ?";
	private static final String GET_Dishs_ByMenuID_STMT = "SELECT * FROM MENU_DISH where MENU_ID = ?";
	private static final String DELETE = "DELETE FROM MENU WHERE MENU_ID = ?";
	private static final String UPDATE = "UPDATE MENU SET MENU_NAME= ?, MENU_RESUME= ?, MENU_PIC= ?, MENU_STATUS= ?, MENU_PRICE= ? WHERE MENU_ID = ?";

	@Override
	public void insert(MenuVO menuVO) {
		
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, menuVO.getMenu_name());
			pstmt.setString(2, menuVO.getMenu_resume());
			pstmt.setBytes(3, menuVO.getMenu_pic());
			pstmt.setInt(4, menuVO.getMenu_price());

			pstmt.executeUpdate();

		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());

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

			con = ds.getConnection();
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
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();

			pstmt = con.prepareStatement(DELETE);
			pstmt.setString(1, menu_ID);
			pstmt.executeUpdate();

			con.commit();

		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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
			con = ds.getConnection();
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

			con = ds.getConnection();
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
		
			Set<MenuDishVO> set = new LinkedHashSet<MenuDishVO>();
			MenuDishVO menuDishVO = null;
		
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
		
			try {
		
				con = ds.getConnection();
				pstmt = con.prepareStatement(GET_Dishs_ByMenuID_STMT);
				pstmt.setString(1, menu_ID);
				rs = pstmt.executeQuery();
		
				while (rs.next()) {
					menuDishVO = new MenuDishVO();
					menuDishVO.setMenu_ID(rs.getString("menu_ID"));
					menuDishVO.setDish_ID(rs.getString("dish_ID"));
					
					set.add(menuDishVO); 
				}
		
				// Handle any SQL errors
			} catch (SQLException se) {
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
			return set;
		}

	@Override
	public void insertWithDishs(MenuVO menuVO, List<MenuDishVO> list) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			
			con = ds.getConnection();
			
			con.setAutoCommit(false);
			
			String cols[] = {"MENU_ID"};
			pstmt = con.prepareStatement(INSERT_STMT , cols);
			
			pstmt.setString(1, menuVO.getMenu_name());
			pstmt.setString(2, menuVO.getMenu_resume());
			pstmt.setBytes(3, menuVO.getMenu_pic());
			pstmt.setString(4, menuVO.getMenu_status());
			pstmt.setInt(5, menuVO.getMenu_price());
			pstmt.executeUpdate();
			
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
}

		
	