package laptrinhjavaweb.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import laptrinhjavaweb.models.user.Bills;
import laptrinhjavaweb.service.admin.BillServiceAdmin;
@Controller
public class BillController extends BaseControllerAdmin {
	@Autowired BillServiceAdmin HoadonService;
	
	@RequestMapping(value = "/admin/load-bill")
	public ModelAndView bills() {
		_mv.addObject("Bill", HoadonService.GetDataBill());
		_mv.setViewName("admin/bill/load");
		return _mv;
	}
	
	@RequestMapping(value = { "/admin/DeleteBill/{id}" })
	public String DeleteProduct(@PathVariable int id) {

		HoadonService.DeleteBill(id);
		return "redirect:/admin/load-bill";
	}
	
	@RequestMapping(value = "/admin/load-bill_detail/{id}", method = RequestMethod.GET)
	public ModelAndView EditBill(@PathVariable int id, Model model) {

		Bills bills = HoadonService.GetDataBillId(id);
		model.addAttribute("bills", bills);
		_mv.addObject("BillDetail", HoadonService.GetDataBillDetail(id));
		_mv.setViewName("admin/bill_detail/load");
		return _mv;
	}

	@RequestMapping(value = "/admin/load-bill_detail/{id}", method = RequestMethod.POST)
	public String EditBill(@PathVariable int id, @ModelAttribute("bills") Bills bills) {
		HoadonService.UpdateBill(bills);
		return "redirect:/admin/load-bill";
	}
	
	/*
	 * @RequestMapping(value = "/admin/load-bill_detail/{id}") public ModelAndView
	 * bill_detail(@PathVariable int id) { _mv.addObject("BillDetail",
	 * HoadonService.GetDataBillDetail(id));
	 * _mv.setViewName("admin/bill_detail/load"); return _mv; }
	 */
}
