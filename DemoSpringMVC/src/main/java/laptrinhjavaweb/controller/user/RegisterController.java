package laptrinhjavaweb.controller.user;

import java.util.Date;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import laptrinhjavaweb.models.user.User;
import laptrinhjavaweb.service.user.UserService;

@Controller
public class RegisterController {
	@Autowired
	private UserService userservice;
	@Autowired
	private JavaMailSender mailSender;
	
	@RequestMapping(value="/register",method = RequestMethod.GET)
	public ModelAndView Register (Model model)
	{
		ModelAndView mav= new ModelAndView("user/register");
		model.addAttribute("user",new User());
		return mav;
	}
	@RequestMapping(value="/register",method = RequestMethod.POST)
	public String CreateUser(@ModelAttribute("user") User user,HttpSession session,BindingResult result,Model model)
	{
		String userName = user.getLogin_name();
		String fullName = user.getFull_name();
		String email = user.getEmail();
		Date dob = user.getBirthdate();
		System.out.println(dob);
		// Họ tên
		if (fullName == "")
		{
			model.addAttribute("error","Họ tên không được để trống");
			return "user/register";
		}
		// Email
		if (email == "")
		{
			model.addAttribute("error","Email không được để trống!");
			return "user/register";
		}
		if (userservice.findByEmail(email))
		{	
			model.addAttribute("error","Email đã tồn tại!");
			return "user/register";
		}
		// Số điện thoại
		if ((user.getPhone().length() > 11) || (user.getPhone().length() < 10))
		{	
			model.addAttribute("error","Số điện thoại không hợp lệ!");
			return "user/register";
		}
		// Tên đăng nhập
		if (user.getLogin_name() == "")
		{	
			model.addAttribute("error","Tên tài khoản không được để trống!");
			return "user/register";
		}
		if (userName.length() < 6)
		{	
			model.addAttribute("error","Tên tài khoản không được ít hơn 6 ký tự!");
			return "user/register";
		}
		if (userName.length() > 12)
		{	
			model.addAttribute("error","Tên tài khoản không được nhiều hơn 12 ký tự!");
			return "user/register";
		}
		User temp = userservice.findByLogin_name(userName);
		if (temp != null)
		{
			 model.addAttribute("error","Tài khoản đã tồn tại: " + userName);
			 return "user/register";
		}
		// Mật khẩu
		if (user.getHashed_passwd() == "")
		{	
			model.addAttribute("error","Mật khẩu không được để trống!");
			return "user/register";
		}
		if (user.getHashed_passwd().length() < 6)
		{	
			model.addAttribute("error","Mật khẩu không được ít hơn 6 ký tự!");
			return "user/register";
		}
		if (user.getHashed_passwd().length() > 12)
		{	
			model.addAttribute("error","Mật khẩu không được nhiều hơn 12 ký tự!");
			return "user/register";
		}
		
		//userservice.save(user);
		//User registeredUser = userservice.findById(user.getId());
		session.setAttribute("userTemp",user);
		session.setAttribute("Email",email);
		
		//session.setAttribute("UserInfo",user);
		return "redirect:/verify";
	}
	@RequestMapping(value="/verify",method = RequestMethod.GET)
	public String VerifyRegister (Model model,HttpSession session)
	{
		/*
		 * userservice.save(user); session.setAttribute("UserInfo",user);
		 */
		String email = (String) session.getAttribute("Email");
		Random generator = new Random();
		int value = generator.nextInt((9999 - 1000) + 1) + 1000;
		SimpleMailMessage simpleMessage = new SimpleMailMessage();
		simpleMessage.setTo(email);
		simpleMessage.setSubject("Thông báo xác nhận đăng kí tài khoản");
		simpleMessage.setText("Mã OTP của bạn là: " + String.valueOf(value));
		session.setAttribute("OtpTemp",String.valueOf(value));
		mailSender.send(simpleMessage);
		//long currentTimeInMillis = System.currentTimeMillis();
		return "user/VerifyRegister";
	}
	@PostMapping(value="/sendMail")
	public String SendMail (HttpSession session, @RequestParam(name="OTP") String otp,Model model )
	{
		String OtpTemp = (String) session.getAttribute("OtpTemp");
		if (otp.equals(OtpTemp))
		{
			User temp = (User) session.getAttribute("userTemp");
			if (temp!= null)
			{
			userservice.save(temp); 
			
			}
			else
			{
				Random generator = new Random();
				int value = generator.nextInt((999999 - 100000) + 1) + 100000;
				SimpleMailMessage simpleMessage = new SimpleMailMessage();
				String emailTemp = (String) session.getAttribute("emailTemp");
				simpleMessage.setTo(emailTemp);
				simpleMessage.setSubject("Thông báo mật khẩu mới của bạn");
				simpleMessage.setText("Mật khẩu của bạn là: " + String.valueOf(value));
				session.setAttribute("OtpTemp",String.valueOf(value));
				userservice.updatePassword(String.valueOf(value));
				mailSender.send(simpleMessage);
			}
			session.removeAttribute("OtpTemp");
			session.removeAttribute("emailTemp");
			return "redirect:/login" ;
		}
		model.addAttribute("error","Sai mã OTP");
		return "user/VerifyRegister" ;
			
	}
}
