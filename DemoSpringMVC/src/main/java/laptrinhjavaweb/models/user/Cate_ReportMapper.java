package laptrinhjavaweb.models.user;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class Cate_ReportMapper implements RowMapper<Cate_Report>{

	public Cate_Report mapRow(ResultSet rs, int rowNum) throws SQLException {
		Cate_Report cate_Report = new Cate_Report();
		cate_Report.setTotal(rs.getInt("Total_Quantity"));
		cate_Report.setName(rs.getString("cate_name"));
		return cate_Report;
	}

}
