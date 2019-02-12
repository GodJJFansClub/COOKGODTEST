package T3_Model;

import java.util.*;
import java.sql.*;

public class dishDAO implements dishDAO_interface{

	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "COOKGOD";
	String passwd = "123456";
	
	private static final String INSERT_STMT =
			"INSERT INTO DISH (DISH_ID,DISH_NAME,DISH_STATUS,DISH_RESUME,DISH_PRICE) VALUES (DISH_seq.NEXTVAL,?,?,?,?)";
	private static final String GET_ALL_STMT =
			"SELECT DISH_ID,DISH_NAME,DISH_STATUS,DISH_RESUME,DISH_PRICE FROM DISH order by DISH_ID";
	private static final String GET_ONE_STMT = 
			"SELECT DISH_ID,DISH_NAME,DISH_STATUS,DISH_RESUME,DISH_PRICE FROM DISH where DISH_ID = ?";
	private static final String UPDATE = 
			"UPDATE DISH set DISH_NAME=?,DISH_STATUS=?,DISH_RESUME=?,DISH_PRICE=? where DISH_ID = ?";
	@Override
	public void insert(dishVO dishVO) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);
			
			pstmt.setString(1, dishVO.getDishid());
			pstmt
		}catch ()
		
	}

	@Override
	public void update(dishVO dishVO) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public dishVO findyByPrimaryKey(String dishid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<dishVO> getAll() {
		// TODO Auto-generated method stub
		return null;
	}
	

}
