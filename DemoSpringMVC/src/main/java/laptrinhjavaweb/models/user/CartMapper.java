package laptrinhjavaweb.models.user;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class CartMapper implements RowMapper<Cart>{

	public Cart mapRow(ResultSet rs, int rowNum) throws SQLException {
		Cart cart = new Cart();
		cart.setId(rs.getInt("id"));
		cart.setId_user(rs.getInt("id_user"));
		cart.setId_payment(rs.getInt("id_payment"));
		cart.setId_status(rs.getInt("id_status"));
		cart.setId_shipment(rs.getInt("id_shipment"));
		cart.setId_address(rs.getInt("id_address"));
		cart.setPayment_no(rs.getString("payment_no"));
		//cart.setTotal_purchase_price(rs.getFloat("total_purchase_priceca"));
		cart.setShip_fee(rs.getFloat("ship_fee"));
		cart.setCreate_at(rs.getTimestamp("create_at"));
		cart.setUpdate_at(rs.getTimestamp("update_at"));
		return cart;
	}

}
