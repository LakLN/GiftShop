package laptrinhjavaweb.models.user;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class Image_ProductMapper implements RowMapper<Image_Product> {

	public Image_Product mapRow(ResultSet rs, int rowNum) throws SQLException {
		Image_Product image_product = new Image_Product();
		image_product.setId(rs.getInt("id"));
		image_product.setImage(rs.getString("image"));
		image_product.setId_product(rs.getInt("id_product"));
		image_product.setCreate_at(rs.getTimestamp("create_at"));
		image_product.setUpdate_at(rs.getTimestamp("update_at"));
		return image_product;
	}
	
}
