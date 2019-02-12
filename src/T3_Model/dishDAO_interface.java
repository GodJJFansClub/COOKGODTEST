package T3_Model;

import java.util.*;

public interface dishDAO_interface {

	public void insert (dishVO dishVO);
	public void update (dishVO dishVO);
	public dishVO findyByPrimaryKey (String dishid);
	public List<dishVO> getAll();
}
