package laptrinhjavaweb.models.user;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class InventoryMapper implements RowMapper<Inventory> {

	public Inventory mapRow(ResultSet rs, int rowNum) throws SQLException {
		Inventory inventory = new Inventory();
		inventory.setId(rs.getInt("id"));
		inventory.setId_product(rs.getInt("id_product"));
		inventory.setSale_price(rs.getFloat("sale_price"));
		inventory.setQuantity(rs.getInt("quantity"));
		inventory.setSold(rs.getInt("sold"));
		inventory.setCreate_at(rs.getTimestamp("create_at"));
		inventory.setUpdate_at(rs.getTimestamp("update_at"));
		return inventory;
	}

}
