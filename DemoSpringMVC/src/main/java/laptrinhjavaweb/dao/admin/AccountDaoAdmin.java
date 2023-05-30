package laptrinhjavaweb.dao.admin;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import laptrinhjavaweb.models.user.User;
import laptrinhjavaweb.models.user.UserMapper;

@Repository
public class AccountDaoAdmin {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public List<User> GetDataAccount(){
		List<User> list = new ArrayList<User>();
		String sql = "SELECT *  FROM user";
		list = jdbcTemplate.query(sql, new UserMapper());
		return list;
	}
	
	public User GetDataAccountId(int id) {
		String sql = "SELECT *  FROM user WHERE id = " + id;
		return jdbcTemplate.queryForObject(sql, new UserMapper());
	}
	
	public void UpdateAccount(User user) {
		String sql = "UPDATE user SET is_delete = ? WHERE id = ? ";
		jdbcTemplate.update(sql,user.isIs_delete(), user.getId());
	}
	public User checkAdmin(User user) {
		String sql = "SELECT * FROM user WHERE login_name= ? and hashed_passwd = ? and (id_permission= 2 or id_permission=3 or id_permission=4) ";
		  List<User> users = jdbcTemplate.query(sql,new UserMapper(),user.getLogin_name(),user.getHashed_passwd());
		  return users.size() > 0 ? users.get(0) : null;
		
	}
}