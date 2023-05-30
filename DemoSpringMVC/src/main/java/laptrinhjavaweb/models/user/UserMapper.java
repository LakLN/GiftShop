package laptrinhjavaweb.models.user;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class UserMapper implements RowMapper<User>
{
	public User mapRow(ResultSet rs,int rowNum) throws SQLException {
		User user = new User ();
		user.setId(rs.getInt("id"));
		user.setLogin_name(rs.getString("login_name"));
		user.setSalt(rs.getString("salt"));
		user.setHashed_passwd(rs.getString("hashed_passwd"));
		user.setFull_name(rs.getString("full_name"));
		user.setImage(rs.getString("image"));
		user.setId_gender(rs.getInt("gender"));
		user.setBirthdate(rs.getDate("birthDate"));
		user.setPhone(rs.getString("phone"));
		user.setId_address(rs.getInt("id_address"));
		user.setEmail(rs.getString("email"));
		user.setId_permission(rs.getInt("id_permission"));
		user.setCreate_at(rs.getTimestamp("create_at"));
		user.setUpdate_at(rs.getTimestamp("update_at"));
		user.setIs_delete(rs.getBoolean("is_delete"));
		return user;
		
	}
}
