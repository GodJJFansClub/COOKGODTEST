package Chef_Sch;

import java.util.List;

public interface ChefSchDAO_Interface {
	
	public void insert(ChefSchVO chefSchVO);
    public void update(ChefSchVO chefSchVO);
    public void delete(ChefSchVO chefSchVO);
    public ChefSchVO findByPrimaryKey(ChefSchVO chefSchVO);
    public List<ChefSchVO> getAll(); 
//  萬用複合查詢(傳入參數型態Map)(回傳 List)
//  public List<ChefVO> getAll(Map<String, String[]> map);
}
