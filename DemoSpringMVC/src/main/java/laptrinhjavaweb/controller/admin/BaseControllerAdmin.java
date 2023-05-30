package laptrinhjavaweb.controller.admin;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BaseControllerAdmin {
	
	public ModelAndView _mv = new ModelAndView();
	@PostConstruct
	public ModelAndView Initt( ) {

		return _mv;
	}
}
