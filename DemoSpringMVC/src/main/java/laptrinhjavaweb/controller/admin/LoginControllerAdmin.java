package laptrinhjavaweb.controller.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import laptrinhjavaweb.models.user.User;
import laptrinhjavaweb.service.admin.AccountServiceAdmin;

@Controller
public class LoginControllerAdmin extends BaseControllerAdmin{
	@Autowired
	private AccountServiceAdmin accountService;
	
	@RequestMapping(value = {"/loginAdmin"},method = RequestMethod.GET)
	public ModelAndView LoginAdm(HttpSession session)
	{
		 User sameObject = (User) session.getAttribute("userAdmin");
			if (sameObject != null)
			{
				_mv.setViewName("admin/login");
				return _mv;
			}
		_mv.setViewName("admin/login");
		_mv.addObject("user",new User());
		return _mv;
	}
	@RequestMapping(value = {"/loginAdmin"},method = RequestMethod.POST )
	public String  LoginAdmin(@ModelAttribute("user") User user ,HttpSession session,HttpServletRequest request,Model model)
	{
		User check = accountService.checkADmin(user);
		
		System.out.println(user.getLogin_name());
		if (check != null)
		{
			int maRole = check.getId_permission();
			if (maRole == 2)
				session.setAttribute("userAdmin",check);
			else if (maRole == 3)
				session.setAttribute("userShipper",check);
			else
				session.setAttribute("userEmp",check);
					
			return "redirect:/admin/home";
		}
		else
		{
			
			model.addAttribute("error","Tài khoản hoặc mật khẩu không đúng");
			return "admin/login";
		}
	}
	
	
	@RequestMapping(value={"/admin"})
	public ModelAndView Login(HttpSession session)
	{
		_mv.setViewName("admin/login");
		String Role = (String) session.getAttribute("Role");
		System.out.println(Role);
		if (Role!= null)
		{	
			if (Role.equals(("Admin")))
			{
				_mv.setViewName("admin/home");
				session.setAttribute("Role",Role);
				return _mv;
			}
			else
				_mv.setViewName("admin/404");
		}
		return  _mv;
	
	}
	@RequestMapping(value={"/logoutAdmin"})
	public ModelAndView Logout (HttpServletRequest request, HttpServletResponse response,HttpSession session)
	{
		session.invalidate();
		return new ModelAndView("redirect:/loginAdmin");
	}
}
