package Chef;

import java.util.List;

public interface ChefDAO_Interface {
	public void insert(ChefVO chefVO);
    public void update(ChefVO chefVO);
    public void delete(String chefId);
    public ChefVO findByPrimaryKey(Integer chefId);
    public List<ChefVO> getAll();
//    �U�νƦX�d��(�ǤJ�Ѽƫ��AMap)(�^�� List)
//    public List<EmpVO> getAll(Map<String, String[]> map); 
}
