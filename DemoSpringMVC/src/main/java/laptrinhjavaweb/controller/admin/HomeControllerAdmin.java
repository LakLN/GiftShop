package laptrinhjavaweb.controller.admin;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import laptrinhjavaweb.models.user.User;

@Controller
public class HomeControllerAdmin extends BaseControllerAdmin {

	@RequestMapping(value = { "/admin/home" })
	public String Home(HttpSession session) {
		//int id_permission = (User) session.getAttribute("userAdmin");
		User sameObject = (User) session.getAttribute("userAdmin");
		User sameObjectShipper = (User) session.getAttribute("userShipper");
		User sameObjectEmp = (User) session.getAttribute("userEmp");
		if (sameObject != null ||sameObjectShipper != null ||  sameObjectEmp != null)
		{
			if (sameObjectShipper != null)
			{
			_mv.setViewName("admin/account/load");
			return "redirect:/admin/load-bill";
			}
			if (sameObjectEmp != null)
			{
			_mv.setViewName("admin/account/load");
			return "redirect:/admin/load-bill";
			}
			return "redirect:/admin/load-account";
		}
		_mv.setViewName("admin/404");
		String Role = (String) session.getAttribute("Role");
		System.out.println(Role);
		if (Role!= null)
		{	
			if (Role.equals(("Admin")))
			{
				//_mv.setViewName("admin/home");
				session.setAttribute("Role",Role);
				return "redirect:/admin/load-account";
			}
			else
				return "redirect:/admin/404";
		}
		return  "redirect:/admin/404";
	}
	
	@RequestMapping(value = { "/admin/404" })
	public ModelAndView Loi404 ()
	{
		_mv.setViewName("admin/404");
		return _mv;
	}
	
}
