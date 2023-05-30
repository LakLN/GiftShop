package laptrinhjavaweb.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import laptrinhjavaweb.models.user.Category;
import laptrinhjavaweb.service.admin.CategoryServiceAdmin;

@Controller
public class CategoryControllerAdmin extends BaseControllerAdmin{
	@Autowired
	CategoryServiceAdmin categoryServiceAdmin;
	
	@RequestMapping(value= "/admin/load-category")
	public ModelAndView Category()
	{
		_mv.addObject("Category", categoryServiceAdmin.GetDataCategory());
		_mv.setViewName("admin/category/load");
		return _mv;
	}
	
	@RequestMapping(value= "/admin/create-category", method = RequestMethod.GET)
	public ModelAndView CreateCategory(Model model)
	{
		model.addAttribute("category", new Category());
		_mv.setViewName("admin/category/create");
		return _mv;
	}
	@RequestMapping(value= "/admin/create-category", method = RequestMethod.POST)
	public String CreateCategory(@ModelAttribute("category") Category category)
	{
		categoryServiceAdmin.InsertCategory(category);
		return "redirect:/admin/load-category";
	}
	
	@RequestMapping(value = {"/admin/Delete/{id}"})
	public String DeleteCategory(@PathVariable int id) {

		categoryServiceAdmin.DeleteCategory(id);
		return "redirect:/admin/load-category";
	}
	
	@RequestMapping(value= "/admin/Edit/{id}", method = RequestMethod.GET)
	public ModelAndView EditCategory(@PathVariable int id, Model model)
	{
		Category category = categoryServiceAdmin.GetDataCategoryId(id);
		model.addAttribute("category", category);
		_mv.setViewName("admin/category/Edit");
		return _mv;
	}
	@RequestMapping(value= "/admin/Edit/{id}", method = RequestMethod.POST)
	public String EditCategory(@PathVariable int id, @ModelAttribute("category") Category category)
	{
		categoryServiceAdmin.UpdateCategory(category);
		return "redirect:/admin/load-category";
	}
	
}
