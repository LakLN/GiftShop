package laptrinhjavaweb.controller.user;

import java.io.IOException;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.http.client.ClientProtocolException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import laptrinhjavaweb.common.GooglePojo;
import laptrinhjavaweb.common.GoogleUtils;
import laptrinhjavaweb.models.user.User;
import laptrinhjavaweb.service.user.UserService;


@Controller
public class LoginController extends BaseController{
	@Autowired
	private UserService userservice;

	
	 @Autowired 
	 private GoogleUtils googleUtils;
	 
	 @Autowired
		private JavaMailSender mailSender;
	 
	@RequestMapping(value={"/login"},method = RequestMethod.GET)
	public String Login (@RequestParam(required = false) String message, Model model,HttpSession session)
	{
		if (message != null && !message.isEmpty()) {
			if (message.equals("logout")) {
		          model.addAttribute("message", "Đăng xuất!");
		        }
			if (message.equals("error")) {
		         model.addAttribute("message", "Tài khoản hoặc mật khẩu không đúng!");
		        }
	        if (message.equals("google_error")) {
	          model.addAttribute("message", "Tài khoản hoặc mật khẩu google không đúng!");
	        }
		}
		model.addAttribute("user",new User());
		return "user/login";
	}
	@SuppressWarnings("unused")
	@RequestMapping(value={"/login"},method = RequestMethod.POST)
	public String LoginUser (@ModelAttribute("user") User user ,HttpSession session)
	{	
		
		User check = userservice.checkAccount(user);
		
		if (check!=null)
		{
			String role = userservice.checkPermission(check.getId());
			if (role.equals("Admin"))
				session.setAttribute("userAdmin",check);
			session.setAttribute("Role",role);
			System.out.println(role);
			session.setAttribute("UserInfo",check);
		}
		else
		{
			return "redirect:/login?message=error" ;
		}
		return "redirect:/";
		
	}
		@RequestMapping("/login-google")
		public String loginGoogle(HttpServletRequest request, HttpSession session) throws ClientProtocolException, IOException {
	    String code = request.getParameter("code");
	    
	    if (code == null || code.isEmpty()) {
	      return "redirect:/login?messge=google_error";
	    }
	    String accessToken = googleUtils.getToken(code);
	    
	    GooglePojo googlePojo = googleUtils.getUserInfo(accessToken);
	    
	    UserDetails userDetail = googleUtils.buildUser(googlePojo);
	    UsernamePasswordAuthenticationToken authentication = new UsernamePasswordAuthenticationToken(userDetail, null,
	        userDetail.getAuthorities());
	    authentication.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));
	    SecurityContextHolder.getContext().setAuthentication(authentication);
	    if (userservice.findByEmail(googlePojo.getEmail())== false)
	    {
	    userservice.saveInfoGoogle(userDetail.getUsername().substring(0,10),userDetail.getUsername().substring(0,10),googlePojo.getEmail());
	   
	    }
	    User userinfo = userservice.findByLogin_name(userDetail.getUsername().substring(0,10)); 
	    session.setAttribute("UserInfo",userinfo);
	    return "redirect:/trang-chu";
	  }
		@RequestMapping(value={"/logout"})
		public ModelAndView Logout (HttpServletRequest request, HttpServletResponse response,HttpSession session)
		{
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			if (auth != null)
				new SecurityContextLogoutHandler().logout(request,response,auth);
			session.removeAttribute("UserInfo");
			session.invalidate();
			return new ModelAndView("redirect:/trang-chu");
		}
		@RequestMapping(value={"/forgotpassword"})
		public String ForgotPassword (Model model)
		{
			model.addAttribute("Category", _homeservice.GetDataCategory());
			 model.addAttribute("Category2", _homeservice.GetDataCategory2());
			 model.addAttribute("Category3", _homeservice.GetDataCategory3());
			 model.addAttribute("CategoryFull", _homeservice.GetDataCategoryFull());
			return "user/ForgotPassword";
		}
		@PostMapping(value={"/Verifyforgotpassword"})
		public String _ForgotPassword (Model model,HttpServletRequest request,HttpSession session )
		{
			model.addAttribute("Category", _homeservice.GetDataCategory());
			 model.addAttribute("Category2", _homeservice.GetDataCategory2());
			 model.addAttribute("Category3", _homeservice.GetDataCategory3());
			 model.addAttribute("CategoryFull", _homeservice.GetDataCategoryFull());
			 String email = request.getParameter("email");
			 if (userservice.findByEmail(email)== false)
			 {
				 model.addAttribute("error","Email chưa đăng kí tài khoản");
				 return "user/ForgotPassword";
			 }
			Random generator = new Random();
			int value = generator.nextInt((9999 - 1000) + 1) + 1000;
			SimpleMailMessage simpleMessage = new SimpleMailMessage();
			simpleMessage.setTo(email);
			simpleMessage.setSubject("Thông báo xác nhận lấy lại mật khẩu");
			simpleMessage.setText("Mã OTP của bạn là: " + String.valueOf(value));
			session.setAttribute("OtpTemp",String.valueOf(value));
			session.setAttribute("emailTemp",email);
			mailSender.send(simpleMessage);
			return "user/VerifyRegister";
		}
}
