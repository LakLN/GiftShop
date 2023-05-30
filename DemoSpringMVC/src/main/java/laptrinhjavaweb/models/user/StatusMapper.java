package laptrinhjavaweb.models.user;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class StatusMapper implements RowMapper<Status> {

	public Status mapRow(ResultSet rs, int rowNum) throws SQLException {
		Status status = new Status();
		status.setId(rs.getInt("id"));
		status.setStatus_name(rs.getString("status_name"));
		status.setDesc_status(rs.getString("desc_status"));
		status.setCreate_at(rs.getTimestamp("create_at"));
		status.setUpdate_at(rs.getTimestamp("update_at"));
		return status;
	}

}
