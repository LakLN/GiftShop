package laptrinhjavaweb.controller.user;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import laptrinhjavaweb.models.user.Bills;
import laptrinhjavaweb.models.user.Cart_Item;
import laptrinhjavaweb.models.user.User;
import laptrinhjavaweb.service.user.BillService;
import laptrinhjavaweb.service.user.CartService;
import laptrinhjavaweb.service.user.UserService;

@Controller
public class CartController extends BaseController {

	@Autowired
	CartService cartService = new CartService();

	@Autowired
	BillService billsService = new BillService();

	@Autowired
	private UserService userservice;

	@RequestMapping(value = { "/cart" })
	public ModelAndView Cart(HttpSession session) {
		// User sameObject = (User) session.getAttribute("UserInfo");
		// int Id = sameObject.getId();
		
		_mav.setViewName("user/Cart");
		return _mav;
	}

	@RequestMapping(value = "AddCart/{id}")
	public String AddCart(HttpServletRequest request, HttpSession session, @PathVariable long id) {
		@SuppressWarnings("unchecked")
		HashMap<Long, Cart_Item> cart = (HashMap<Long, Cart_Item>) session.getAttribute("cart");
		if (cart == null) {
			cart = new HashMap<Long, Cart_Item>();
		}
		cart = cartService.AddCart(id, cart);
		session.setAttribute("cart", cart);
		session.setAttribute("TotalQuantity", cartService.TotalQuantity(cart));
		session.setAttribute("TotalPrice", cartService.TotalPrice(cart));
		return "redirect:" + request.getHeader("Referer");
		//return "redirect:/product-details/{id}";
	}

	@RequestMapping(value = "UpdateCart/{id}/{quantity}")
	public String UpdateCart(HttpServletRequest request, HttpSession session, @PathVariable long id,
			@PathVariable int quantity) {
		@SuppressWarnings("unchecked")
		HashMap<Long, Cart_Item> cart = (HashMap<Long, Cart_Item>) session.getAttribute("cart");
		if (cart == null) {
			cart = new HashMap<Long, Cart_Item>();
		}
		cart = cartService.UpdateCart(id, quantity, cart);
		session.setAttribute("cart", cart);
		session.setAttribute("TotalQuantity", cartService.TotalQuantity(cart));
		session.setAttribute("TotalPrice", cartService.TotalPrice(cart));
		return "redirect:" + request.getHeader("Referer");
	}
	@RequestMapping(value = "AddCartBySoLuong/{id}/{quantity}")
	public String AddCartByQuantity(HttpServletRequest request, HttpSession session, @PathVariable long id,
			@PathVariable int quantity) {
		@SuppressWarnings("unchecked")
		HashMap<Long, Cart_Item> cart = (HashMap<Long, Cart_Item>) session.getAttribute("cart");
		if (cart == null) {
			cart = new HashMap<Long, Cart_Item>();
		}
		//Inventory iventory = productDetailService.GetQuantityProduct(String.valueOf(id));
		//int quantityInventory= (iventory.getQuantity() - iventory.getSold());
		cart = cartService.AddCartBySoLuong(id, quantity, cart);
		session.setAttribute("cart", cart);
		session.setAttribute("TotalQuantity", cartService.TotalQuantity(cart));
		session.setAttribute("TotalPrice", cartService.TotalPrice(cart));
		return "redirect:" + request.getHeader("Referer");
	}

	@RequestMapping(value = "DeleteCart/{id}")
	public String DeleteCart(HttpServletRequest request, HttpSession session, @PathVariable long id) {
		@SuppressWarnings("unchecked")
		HashMap<Long, Cart_Item> cart = (HashMap<Long, Cart_Item>) session.getAttribute("cart");
		if (cart == null) {
			cart = new HashMap<Long, Cart_Item>();
		}
		cart = cartService.DeleteCart(id, cart);
		session.setAttribute("cart", cart);
		session.setAttribute("TotalQuantity", cartService.TotalQuantity(cart));
		session.setAttribute("TotalPrice", cartService.TotalPrice(cart));
		return "redirect:" + request.getHeader("Referer");
	}

	@RequestMapping(value = "/checkout/{login_name}", method = RequestMethod.GET)
	public ModelAndView Checkout(Model model, HttpServletRequest request, HttpSession session,
			@PathVariable String login_name) {
		_mav.setViewName("user/checkout");

		User user = userservice.findByLogin_name(login_name);
		model.addAttribute("user", user);

		Bills bills = new Bills();
		/* User userInfo = (User)session.getAttribute("user"); */
		/*
		 * if (user != null) { bills.setFull_name(user.getFull_name());
		 * bills.setLogin_name(user.getLogin_name()); bills.setEmail(user.getEmail()); }
		 */
		_mav.addObject("bills", bills);
		return _mav;
	}

	@RequestMapping(value = "/checkout/{login_name}", method = RequestMethod.POST)
	public String CheckoutBill(Model model, HttpServletRequest request, HttpSession session, @ModelAttribute("bills") Bills bills, @PathVariable String login_name) {
		bills.setQuantity(((Integer) session.getAttribute("TotalQuantity")));
		bills.setTotal(((Float) session.getAttribute("TotalPrice")));
		bills.setLogin_name(((String) login_name));
		if(bills.getFull_name() == "") {
			model.addAttribute("error","Họ tên không được để trống");
			return "user/checkout";
		
		}
		if(bills.getPhone() == "") {
			model.addAttribute("error","Số điện thoại không được để trống");
			return "user/checkout";
		
		}
		if(bills.getPhone().length() > 11 || bills.getPhone().length() < 10) {
			model.addAttribute("error","Số điện thoại không hợp lệ ");
			return "user/checkout";
		
		}
		if(bills.getEmail() == "") {
			model.addAttribute("error","Email không được để trống");
			return "user/checkout";
		
		}
		if(bills.getAddress() == "") {
			model.addAttribute("error","Địa chỉ không được để trống");
			return "user/checkout";
		
		}
		if (billsService.AddBills(bills) > 0) {
			HashMap<Long, Cart_Item> carts = (HashMap<Long, Cart_Item>)session.getAttribute("cart");
			billsService.AddBillsDetail(carts);
			/* model.addAttribute("is_checkout", "check"); */
		}
		//session.setAttribute("getAlert", 0);
		
		session.removeAttribute("cart");
		session.setAttribute("TotalPrice", 0);
		session.setAttribute("TotalQuantity", 0);
		return "redirect:cart";
	}

}
