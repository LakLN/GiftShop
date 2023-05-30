package laptrinhjavaweb.dao.admin;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import laptrinhjavaweb.models.user.Category;
import laptrinhjavaweb.models.user.CategoryMapper;

@Repository
public class CategoryDaoAdmin {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public List<Category> GetDataCategory(){
		List<Category> list = new ArrayList<Category>();
		String sql = "SELECT *  FROM category";
		list = jdbcTemplate.query(sql, new CategoryMapper());
		return list;
	}
	
	public Category GetDataCategoryId(int id) {
		String sql = "SELECT *  FROM category WHERE id = " + id;
		return jdbcTemplate.queryForObject(sql, new CategoryMapper());
	}
	
	public void InsertCategory(Category category) {
	    String sql = "INSERT INTO category (cate_name, cate_desc, id_category) " + "VALUES (?,?,?)";
	    jdbcTemplate.update(sql,category.getCate_name(), category.getCate_desc(), category.getId_category());
	}
	
	public void UpdateCategory(Category category) {
		String sql = "UPDATE category SET cate_name = ?, cate_desc = ?, id_category = ? WHERE id = ? ";
		jdbcTemplate.update(sql,category.getCate_name(), category.getCate_desc(), category.getId_category(), category.getId());
	}
	
	public void DeleteCotegory(int id) {
		String sql = "DELETE FROM category WHERE id = " + id;
		jdbcTemplate.update(sql);
	}
}
