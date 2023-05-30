package laptrinhjavaweb.models.user;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class CategoryMapper implements RowMapper<Category>
{
	public Category mapRow(ResultSet rs,int rowNum) throws SQLException {
		Category category = new Category();
		category.setId(rs.getInt("id"));
		category.setCate_name(rs.getString("cate_name"));
		category.setCate_desc(rs.getString("cate_desc"));
		category.setId_category(rs.getInt("id_category"));
		category.setCreate_at(rs.getTimestamp("create_at"));
		category.setUpdate_at(rs.getTimestamp("update_at"));
		return category;
	}
}