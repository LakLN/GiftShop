package laptrinhjavaweb.dao.user;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import laptrinhjavaweb.models.user.User;
import laptrinhjavaweb.models.user.UserMapper;
@Repository
@Transactional
public class UserDao {
  @Autowired
  private JdbcTemplate jdbcTemplate;
  public void save(User user) {
    String sql = "INSERT INTO user (login_name, hashed_passwd, full_name, phone, email, gender, birthdate) "
    		+ "VALUES (?,?,?,?,?,?,?)";
    jdbcTemplate.update(sql,user.getLogin_name(), user.getHashed_passwd(), user.getFull_name(), user.getPhone(), user.getEmail(), user.getId_gender(), user.getBirthdate());
  }
  public void delete(int id) {
    String sql = "DELETE FROM user WHERE id = " + id;
    jdbcTemplate.update(sql);
  }
  
  public void update(User user) {
    String sql = "UPDATE user SET full_name = ?, phone = ? WHERE id = ?";
    jdbcTemplate.update(sql, user.getFull_name(), user.getPhone(), user.getId());
  }
  public User findById(int id) {
    String sql = "SELECT * FROM user WHERE id = ?";
    return jdbcTemplate.queryForObject(sql, new UserMapper(), id);
  }
  public  User findByLogin_name(String login_name)
  {
	  String sql = "SELECT * FROM user WHERE login_name = ?";
	  List<User> users = jdbcTemplate.query(sql, new UserMapper(), login_name);
	  return users.size() > 0 ? users.get(0) : null;
  }
  public List<User> findAll() {
    String sql = "SELECT * FROM user";
    return jdbcTemplate.query(sql, new UserMapper());
  }
  public User checkAccount(User user)
  {
	  String sql = "SELECT * FROM user WHERE login_name= ? and hashed_passwd = ? and is_delete = false";
	  List<User> users = jdbcTemplate.query(sql,new UserMapper(),user.getLogin_name(),user.getHashed_passwd());
	  return users.size() > 0 ? users.get(0) : null;
	  
  }
  public String checkPermission (int id)
  {
	  String sql = "SELECT DISTINCT permission.permission_name from user, permission where user.id_permission = permission.id and user.id = ? ";
	  String permission = (String) jdbcTemplate.queryForObject(sql,String.class,id);
	  return permission;
  }
  public boolean findByEmail(String email) 
  {
	String sql = "SELECT * FROM user WHERE email = ?";
	  List<User> users = jdbcTemplate.query(sql,new UserMapper(),email);
	  return users.size() > 0 ? true : false;
  }
  public void saveInfoGoogle(String login_name, String password, String email) {
		 String sql = "INSERT INTO user (login_name, hashed_passwd, full_name, email,is_delete) "
		    		+ "VALUES (?,?,?,?,?)";
		    jdbcTemplate.update(sql,login_name, password, email, email, 0);	
	}
  public void updatePassword(String password)
  {
	  String sql = "UPDATE user SET hashed_passwd= ? ";
	  jdbcTemplate.update(sql,password);
  }
}
