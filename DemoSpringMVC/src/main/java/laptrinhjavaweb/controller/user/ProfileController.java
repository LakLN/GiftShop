package laptrinhjavaweb.controller.user;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import laptrinhjavaweb.models.user.Bill_Detail;
import laptrinhjavaweb.models.user.Bills;
import laptrinhjavaweb.models.user.User;
import laptrinhjavaweb.service.user.BillService;
import laptrinhjavaweb.service.user.UserService;

@Controller
public class ProfileController {
	@Autowired
	private UserService userservice;

	@Autowired
	private BillService billservice;

	@RequestMapping(value = { "/profile/{login_name}" }, method = RequestMethod.GET)
	public String Profile(Model model, HttpSession session, @PathVariable String login_name) {

		//ModelAndView mav = new ModelAndView("user/profile");
		User sameObject = (User) session.getAttribute("UserInfo");
		if (sameObject == null) {
			return "redirect:/login";
		}
		if (!login_name.equals(sameObject.getLogin_name())) {
			model.addAttribute("error", "Không thể truy cập! Vui lòng đăng nhập");
			return "admin/404";
		}
		User user = userservice.findByLogin_name(login_name);
		System.out.println(user.getLogin_name());
		List<Bills> bill = billservice.GetDataBillId(user.getLogin_name());
		List<Bill_Detail> billDetail = billservice.GetDataBillDetail(user.getLogin_name());
		int changeType = 0;

		model.addAttribute("changeType", changeType);
		model.addAttribute("billDetail", billDetail);
		model.addAttribute("Bill", bill);
		model.addAttribute("user", user);
		return "user/profile";
	}

	@RequestMapping(value = { "/profile/{login_name}" }, method = RequestMethod.POST )
	public String UpdateUser(@ModelAttribute("user") User user, HttpSession session, Model model,
			@PathVariable String login_name) {

		userservice.update(user);

		User temp = userservice.findByLogin_name(login_name);
		session.setAttribute("UserInfo", temp);

		return "redirect:/profile/{login_name}";
	}

}
