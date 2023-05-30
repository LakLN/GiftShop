package laptrinhjavaweb.dao.user;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import laptrinhjavaweb.models.user.Category;
import laptrinhjavaweb.models.user.CategoryMapper;

@Repository
public class CategoryDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public List<Category> GetDataCategory(){
		List<Category> list = new ArrayList<Category>();
		String sql = "SELECT *  FROM category WHERE id_category = 1";
		list = jdbcTemplate.query(sql, new CategoryMapper());
		return list;
		
	}
	
	public List<Category> GetDataCategory2(){
		List<Category> list = new ArrayList<Category>();
		String sql = "SELECT *  FROM category WHERE id_category = 2";
		list = jdbcTemplate.query(sql, new CategoryMapper());
		return list;
		
	}
	
	public List<Category> GetDataCategory3(){
		List<Category> list = new ArrayList<Category>();
		String sql = "SELECT *  FROM category WHERE id_category = 3";
		list = jdbcTemplate.query(sql, new CategoryMapper());
		return list;
		
	}
	
	public List<Category> GetDataCategoryFull(){
		List<Category> list = new ArrayList<Category>();
		String sql = "SELECT *  FROM category";
		list = jdbcTemplate.query(sql, new CategoryMapper());
		return list;
		
	}
}