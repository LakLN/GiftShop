package laptrinhjavaweb.models.user;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class Cart_ItemMapper implements RowMapper<Cart_Item> {

	public Cart_Item mapRow(ResultSet rs, int rowNum) throws SQLException {
		Cart_Item cart_item = new Cart_Item();
		cart_item.setId(rs.getInt("id"));
		cart_item.setId_inventory(rs.getInt("id_inventory"));
		cart_item.setId_cart(rs.getInt("id_cart"));
		cart_item.setQuantity(rs.getInt("quantity"));
		cart_item.setCreate_at(rs.getTimestamp("create_at"));
		cart_item.setUpdate_at(rs.getTimestamp("update_at"));
		return cart_item;
	}
}
