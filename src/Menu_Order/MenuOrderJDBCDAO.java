package Menu_Order;

import java.util.List;

public class MenuOrderJDBCDAO implements MenuOrderDAO_Interface{
	
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "COOKGOD";
	String passwd = "123456";
	
	private static final String Insert_Stmt = "";
	private static final String Update_Stmt = "";
	private static final String Delete_Stmt = "";
	private static final String Get_One_Stmt = "";
	private static final String Get_All_Stmt = "";
	
	

	public static void main(String[] args) {
	}


	@Override
	public void insert(MenuOrderVO menuOdVO) {
		
	}


	@Override
	public void update(MenuOrderVO menuOdVO) {
		
	}

	
	@Override
	public void delete(String menuOdId) {
		
	}


	@Override
	public MenuOrderVO findByPrimaryKey(String menuOdId) {
		return null;
	}


	@Override
	public List<MenuOrderVO> getAll() {
		return null;
	}
}
