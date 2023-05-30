package laptrinhjavaweb.models.user;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class ProductMapper implements RowMapper<Product>{

	public Product mapRow(ResultSet rs, int rowNum) throws SQLException {
		Product products = new Product();
		products.setId(rs.getInt("id"));
		products.setId_category(rs.getInt("id_category"));;
		products.setName_product(rs.getString("name_product"));
		products.setDesc_product(rs.getString("desc_product"));
		products.setFeatured_product(rs.getBoolean("featured_product"));
		products.setNew_product(rs.getBoolean("new_product"));
		products.setImage(rs.getString("image"));
		products.setPurchase_price(rs.getFloat("purchase_price"));
		products.setCreate_at(rs.getTimestamp("create_at"));
		products.setUpdate_at(rs.getTimestamp("update_at"));
		products.setPurchase_price(rs.getFloat("purchase_price"));
		products.setPromotional_price(rs.getFloat("promotional_price"));
		products.setColor(rs.getString("color"));
		products.setSize(rs.getInt("size"));
		return products;
	}

}
