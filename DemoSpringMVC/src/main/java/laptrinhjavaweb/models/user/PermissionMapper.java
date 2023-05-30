package laptrinhjavaweb.models.user;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class PermissionMapper implements RowMapper<Permission> {

	public Permission mapRow(ResultSet rs, int rowNum) throws SQLException {
		Permission permission = new Permission();
		permission.setId(rs.getInt("id"));
		permission.setPermission_name(rs.getString("permission_name"));
		permission.setDesc_permission(rs.getString("desc_permission"));
		permission.setCreate_at(rs.getTimestamp("create_at"));
		permission.setUpdate_at(rs.getTimestamp("update_at"));
		return permission;
	}

}
