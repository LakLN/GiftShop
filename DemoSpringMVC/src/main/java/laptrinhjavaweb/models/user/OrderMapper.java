package laptrinhjavaweb.models.user;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class OrderMapper implements RowMapper<Order> {

	public Order mapRow(ResultSet rs, int rowNum) throws SQLException {
		Order order = new Order();
		order.setId_user(rs.getInt("id_user"));
		order.setId_inventory(rs.getInt("id_inventory"));
		order.setId_payment(rs.getInt("id_payment"));
		order.setId_status(rs.getInt("id_status"));
		order.setId_shipment(rs.getInt("id_shipment"));
		order.setId_address(rs.getInt("id_address"));
		order.setQuantity(rs.getInt("quantity"));
		order.setPayment_no(rs.getString("payment_no"));
		order.setTotal_purchase_price(rs.getFloat("total_purchase_priceca"));
		order.setShip_fee(rs.getFloat("ship_fee"));
		order.setCreate_at(rs.getTimestamp("create_at"));
		order.setUpdate_at(rs.getTimestamp("update_at"));
		return order;
	}

}
