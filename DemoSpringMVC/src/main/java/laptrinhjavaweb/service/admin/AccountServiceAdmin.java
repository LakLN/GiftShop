package laptrinhjavaweb.service.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import laptrinhjavaweb.dao.admin.AccountDaoAdmin;
import laptrinhjavaweb.models.user.User;

@Service
public class AccountServiceAdmin {
	@Autowired
	private AccountDaoAdmin accountDaoAdmin;
	
	public List<User> GetDataAccount(){
		return accountDaoAdmin.GetDataAccount();
	}
	public User GetDataAccountId(int id) {
		return accountDaoAdmin.GetDataAccountId(id);	
	}
	public void UpdateAccount(User account) {
		accountDaoAdmin.UpdateAccount(account);
	}
	public User checkADmin(User user) {
		User check = accountDaoAdmin.checkAdmin(user);
		return check;
	}
}