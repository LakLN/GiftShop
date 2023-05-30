package laptrinhjavaweb.controller.user;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import laptrinhjavaweb.models.user.ProductPage;
import laptrinhjavaweb.models.user.Inventory;
import laptrinhjavaweb.models.user.Product;
import laptrinhjavaweb.service.user.CategoryService;
import laptrinhjavaweb.service.user.ProductDetailService;
import laptrinhjavaweb.service.user.ProductPageService;

@Controller
public class ProductController extends BaseController{
	
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private ProductPageService productPageService;
	
	@Autowired
	private ProductDetailService productDetailService;
	
	private int TotalPage = 9;

	@RequestMapping(value = {"/product/{id}"})
	public ModelAndView getProduct(@PathVariable String id) {
		_mav.addObject("NewProducts", _homeservice.GetDataNewProducts());
		_mav.addObject("idCategory", id);
		
		int totalProduct = categoryService.GetDataProductsId(Integer.parseInt(id)).size();
		ProductPage pageInfo = productPageService.GetInfoProductPage(totalProduct, TotalPage, 1);

		_mav.addObject("PageInfo", pageInfo);
		_mav.addObject("ProductPage", categoryService.GetDataProductsPage(Integer.parseInt(id), pageInfo.getStart(), TotalPage));

		_mav.setViewName("user/products");
		return _mav;	
	}
	
	@RequestMapping(value = {"/product/{id}/{currentPage}"})
	public ModelAndView Product(@PathVariable String id,@PathVariable String currentPage) {
		_mav.addObject("NewProducts", _homeservice.GetDataNewProducts());
		_mav.addObject("idCategory", id);
		
		int totalProduct = categoryService.GetDataProductsId(Integer.parseInt(id)).size();
		ProductPage pageInfo = productPageService.GetInfoProductPage(totalProduct, TotalPage, Integer.parseInt(currentPage));
		
		_mav.addObject("PageInfo", pageInfo);
		_mav.addObject("ProductPage", categoryService.GetDataProductsPage(Integer.parseInt(id),pageInfo.getStart(), TotalPage));

		_mav.setViewName("user/products");
		return _mav;	
	}
	
	@RequestMapping("/product-details/{id}")
	public ModelAndView Product_Details(@PathVariable String id) {
		_mav.setViewName("user/product_details");
		_mav.addObject("Product", productDetailService.GetProductId(Integer.parseInt(id)));
		Inventory iventory = productDetailService.GetQuantityProduct(id);
		int quantity= (iventory.getQuantity() - iventory.getSold());
		System.out.println(quantity);
		_mav.addObject("Quantity",quantity);
		int idCategory = productDetailService.GetProductId(Integer.parseInt(id)).getId_category();
		_mav.addObject("ProductCategory", productDetailService.GetProductIdCategory(idCategory));
		
		_mav.addObject("Image_Product", productDetailService.GetDataProductDetail(Integer.parseInt(id)));
		return _mav;
	}
	
	@RequestMapping(value={"/search"},method=RequestMethod.POST)
	public String searchProduct(Model model, HttpServletRequest request)
	{
		String keyword= StringEscapeUtils.escapeHtml4(request.getParameter("keyword")) ;
		//String keyword= request.getParameter("keyword") ;
		System.out.println(keyword);
		
		List<Product> products= productDetailService.findByKeyWord(keyword.replace(" ", "%"));
		model.addAttribute("ProductPage",products);
		model.addAttribute("key_word",keyword);
		model.addAttribute("Category", _homeservice.GetDataCategory());
		
		model.addAttribute("Category2", _homeservice.GetDataCategory2());
		model.addAttribute("Category3", _homeservice.GetDataCategory3());
		model.addAttribute("CategoryFull", _homeservice.GetDataCategoryFull());
		model.addAttribute("FeaturedProducts", _homeservice.GetDataFeaturedProducts());
		return "user/products";
	}
	
	@RequestMapping(value={"/sort/{key_word}"},method=RequestMethod.POST)
	public ModelAndView sortProduct(Model model, HttpServletRequest request,@PathVariable String key_word)
	{
		String keyword= request.getParameter("word");
		System.out.println(key_word);
		System.out.println(keyword);
		List<Product> products= productDetailService.SortByKeyWord(keyword,key_word);
		model.addAttribute("ProductPage",products);
		_mav.setViewName("user/products");
		return _mav;
	}
	
	
	@RequestMapping(value={"/sort"},method=RequestMethod.POST)
	public String sort(Model model, HttpServletRequest request)
	{
		
		String keyword= request.getParameter("word");
		//System.out.println(key_word);
		System.out.println(keyword);
		List<Product> products= productDetailService.Sort(keyword);
		model.addAttribute("ProductPage",products);
		model.addAttribute("Category", _homeservice.GetDataCategory());
		return "user/products";
	}
	@RequestMapping(value={"/sort/{idCategory}"})
	public String sortPage(Model model, HttpServletRequest request,@PathVariable int idCategory)
	{
		
		String keyword= request.getParameter("word");
		//System.out.println(keyword);
		List<Product> products= productDetailService.SortPage(keyword,idCategory);
		model.addAttribute("ProductPage",products);
		model.addAttribute("Category", _homeservice.GetDataCategory());
		return "redirect:/product/{idCategory}";
	}
	@RequestMapping(value={"/deleteCart"})
	public String deleteCart(Model model,HttpSession session)
	{
		session.setAttribute("cart", null);
		model.addAttribute("Category", _homeservice.GetDataCategory());
		session.setAttribute("TotalPrice",0);
		session.setAttribute("TotalQuantity",0);
		return "user/Cart";
		
	}
}
