package laptrinhjavaweb.models.user;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class BillsMapper implements RowMapper<Bills> {
	public Bills mapRow(ResultSet rs, int rowNum) throws SQLException {
		Bills bill = new Bills();
		bill.setId(rs.getInt("id"));
		bill.setLogin_name(rs.getString("login_name"));
		bill.setFull_name(rs.getString("full_name"));
		bill.setPhone(rs.getString("phone"));
		bill.setEmail(rs.getString("email"));
		bill.setAddress(rs.getString("address"));
		bill.setNote(rs.getString("note"));
		bill.setTotal(rs.getFloat("total"));
		bill.setQuantity(rs.getInt("quantity"));
		bill.setStatus(rs.getString("status"));
		bill.setCreate_at(rs.getTimestamp("create_at"));
		bill.setUpdate_at(rs.getTimestamp("update_at"));
		bill.setIs_delete(rs.getBoolean("is_delete"));
		return bill;
	}
}
