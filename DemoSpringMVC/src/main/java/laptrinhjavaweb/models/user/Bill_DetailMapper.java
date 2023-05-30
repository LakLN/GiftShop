package laptrinhjavaweb.models.user;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class Bill_DetailMapper implements RowMapper<Bill_Detail>{

	public Bill_Detail mapRow(ResultSet rs, int rowNum) throws SQLException {
		Bill_Detail bill_Detail = new Bill_Detail();
		bill_Detail.setId(rs.getInt("id"));
		bill_Detail.setId_product(rs.getInt("id_product"));
		bill_Detail.setId_bill(rs.getInt("id_bill"));
		bill_Detail.setName_product(rs.getString("name_product"));
		bill_Detail.setTotal(rs.getFloat("total"));
		bill_Detail.setQuantity(rs.getInt("quantity"));
		bill_Detail.setImage(rs.getString("image"));
		bill_Detail.setCreate_at(rs.getTimestamp("create_at"));
		bill_Detail.setUpdate_at(rs.getTimestamp("update_at"));
		return bill_Detail;
	}
}
