package laptrinhjavaweb.controller.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController extends BaseController{

	@RequestMapping(value = {"/","/trang-chu"})
	public ModelAndView Index()
	{
		_mav.addObject("NewProducts", _homeservice.GetDataNewProducts());
		_mav.addObject("FeaturedProducts", _homeservice.GetDataFeaturedProducts());
		_mav.setViewName("user/index");
		return _mav;
	}
}