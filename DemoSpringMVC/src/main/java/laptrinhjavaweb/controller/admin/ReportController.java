package laptrinhjavaweb.controller.admin;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import laptrinhjavaweb.models.user.Bills;
import laptrinhjavaweb.service.admin.BillServiceAdmin;
import laptrinhjavaweb.service.admin.ReportServiceAdmin;

@Controller
public class ReportController extends BaseControllerAdmin {
	@Autowired
	private ReportServiceAdmin reportServiceAdmin;
	@Autowired
	private BillServiceAdmin billServiceAdmin;
	

	@RequestMapping(value = "/admin/report-income", method = RequestMethod.GET)
	public ModelAndView GetIncome() {
		_mv.setViewName("admin/report/load-income");
		return _mv;
	}

	@RequestMapping(value = "/admin/report-income", method = RequestMethod.POST)
	public String PostIncome(Model model, HttpServletRequest request) {
		String begin_date = (String) request.getParameter("begin_date");
		String end_date = (String) request.getParameter("end_date");
		String time_option = (String) request.getParameter("time_option");
		if (begin_date != null && end_date != null && begin_date.trim() != "" && end_date.trim() != "") {
			model.addAttribute("SuccessBill", reportServiceAdmin.GetDataSuccessBillByDate(begin_date, end_date));
			model.addAttribute("WaitingBill", reportServiceAdmin.GetDataWaitingBillByDate(begin_date, end_date));
			model.addAttribute("ProcessBill", reportServiceAdmin.GetDataProcessingBillByDate(begin_date, end_date));
			model.addAttribute("WaitConfirmBill", reportServiceAdmin.GetDataWaitConfirmBillByDate(begin_date, end_date));
			model.addAttribute("ConfirmedBill", reportServiceAdmin.GetDataConfirmedBillByDate(begin_date, end_date));
			model.addAttribute("CancelBill", reportServiceAdmin.GetDataConfirmedBillByDate(begin_date, end_date));
			model.addAttribute("BillReport", reportServiceAdmin.GetIncomeBill(begin_date, end_date, time_option));
			model.addAttribute("CateReport", reportServiceAdmin.GetIncomeCategory(begin_date, end_date));
			model.addAttribute("begin_date", begin_date);
			model.addAttribute("end_date", end_date);
			model.addAttribute("time_option", time_option);
		}
		return "admin/report/load-income";
	}
	
	@RequestMapping(value = "/admin/report/detail/{id}", method = RequestMethod.GET)
	public ModelAndView EditBill(@PathVariable int id, Model model) {

		Bills bills = billServiceAdmin.GetDataBillId(id);
		model.addAttribute("bills", bills);
		_mv.addObject("BillDetail", billServiceAdmin.GetDataBillDetail(id));
		_mv.setViewName("admin/report/detail");
		return _mv;
	}
}
