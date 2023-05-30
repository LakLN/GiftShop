package laptrinhjavaweb.models.user;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class GenderMapper implements RowMapper<Gender> {

	public Gender mapRow(ResultSet rs, int rowNum) throws SQLException {
		Gender gender = new Gender();
		gender.setId(rs.getInt("id"));
		gender.setGender(rs.getString("gender"));
		gender.setCreate_at(rs.getTimestamp("create_at"));
		gender.setUpdate_at(rs.getTimestamp("update_at"));
		return gender;
	}

}
