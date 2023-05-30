package laptrinhjavaweb.models.user;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class ShipmentMapper implements RowMapper<Shipment> {

	public Shipment mapRow(ResultSet rs, int rowNum) throws SQLException {
		Shipment shipment = new Shipment();
		shipment.setId(rs.getInt("id"));
		shipment.setShipment_name(rs.getString("shpment_name"));
		shipment.setShipment_desc(rs.getString("shpment_desc"));
		shipment.setShipment_time_range(rs.getString("shpment_time_range"));
		shipment.setImg(rs.getString("img"));
		shipment.setPrice_u(rs.getFloat("price_u"));
		shipment.setCreate_at(rs.getTimestamp("create_at"));
		shipment.setUpdate_at(rs.getTimestamp("update_at"));
		return shipment;
	}

}
