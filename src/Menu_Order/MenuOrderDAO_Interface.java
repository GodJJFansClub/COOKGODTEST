package Menu_Order;

import java.util.List;

public interface MenuOrderDAO_Interface {
	
	public void insert(MenuOrderVO menuOdVO);
    public void update(MenuOrderVO menuOdVO);
    public void delete(String menuOdId);
    public MenuOrderVO findByPrimaryKey(String menuOdId);
    public List<MenuOrderVO> getAll();    
//  萬用複合查詢(傳入參數型態Map)(回傳 List)
//  public List<ChefVO> getAll(Map<String, String[]> map);
}
