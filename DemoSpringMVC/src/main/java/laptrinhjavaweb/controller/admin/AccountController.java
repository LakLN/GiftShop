package laptrinhjavaweb.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import laptrinhjavaweb.models.user.User;
import laptrinhjavaweb.service.admin.AccountServiceAdmin;

@Controller
public class AccountController extends BaseControllerAdmin {
	@Autowired AccountServiceAdmin accountServiceAdmin;
	
	@RequestMapping(value = "/admin/load-account")
	public ModelAndView Prodict() {
		_mv.addObject("Account", accountServiceAdmin.GetDataAccount());
		_mv.setViewName("admin/account/load");
		return _mv;
	}
	
	@RequestMapping(value= "/admin/EditAccount/{id}", method = RequestMethod.GET)
	public ModelAndView EditAccount(@PathVariable int id, Model model)
	{
		User account = accountServiceAdmin.GetDataAccountId(id);
		model.addAttribute("account", account);
		_mv.setViewName("admin/account/Edit");
		return _mv;
	}
	@RequestMapping(value= "/admin/EditAccount/{id}", method = RequestMethod.POST)
	public String EditAccount(@PathVariable int id, @ModelAttribute("account") User account)
	{
		
		accountServiceAdmin.UpdateAccount(account);
		return "redirect:/admin/load-account";
	}
}