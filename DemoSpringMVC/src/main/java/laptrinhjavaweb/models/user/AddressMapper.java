package laptrinhjavaweb.models.user;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class AddressMapper implements RowMapper<Address> {

	public Address mapRow(ResultSet rs, int rowNum) throws SQLException {
		Address address = new Address();
		address.setId(rs.getInt("id"));
		address.setAddress_line_1(rs.getString("address_line_1"));
		address.setAddress_line_2(rs.getString("address_line_2"));
		address.setAddress_line_3(rs.getString("address_line_3"));
		address.setCreate_at(rs.getTimestamp("create_at"));
		address.setUpdate_at(rs.getTimestamp("update_at"));
		return address;
	}
	
}
