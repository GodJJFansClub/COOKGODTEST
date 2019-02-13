package Chef;

import java.util.List;

public interface ChefDAO_Interface {
	public void insert(ChefVO chefVO);
    public void update(ChefVO chefVO);
    public void delete(String chefId);
    public ChefVO findByPrimaryKey(String chefId);
    public List<ChefVO> getAll();
//  萬用複合查詢(傳入參數型態Map)(回傳 List)
//  public List<ChefVO> getAll(Map<String, String[]> map);
}
