package laptrinhjavaweb.models.user;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class Bill_ReportMapper implements RowMapper<Bill_Report>{

	public Bill_Report mapRow(ResultSet rs, int rowNum) throws SQLException {
		Bill_Report bill_Report = new Bill_Report();
		bill_Report.setTotal(rs.getInt("total_by_date"));
		bill_Report.setDate(rs.getString("update_date"));
		return bill_Report;
	}

}
