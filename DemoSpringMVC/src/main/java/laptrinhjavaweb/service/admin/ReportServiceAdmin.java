package laptrinhjavaweb.service.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import laptrinhjavaweb.dao.admin.ReportDaoAdmin;
import laptrinhjavaweb.models.user.Bill_Report;
import laptrinhjavaweb.models.user.Bills;
import laptrinhjavaweb.models.user.Cate_Report;

@Service
public class ReportServiceAdmin {

	@Autowired
	private ReportDaoAdmin reportDaoAdmin;

	public List<Bill_Report> GetIncomeBill(String begin_date, String end_date, String time_option) {
		return reportDaoAdmin.GetIncomeBill(begin_date, end_date, time_option);
	}

	public List<Cate_Report> GetIncomeCategory(String begin_date, String end_date) {
		return reportDaoAdmin.GetIncomeCategory(begin_date, end_date);
	}

	public List<Bills> GetDataSuccessBillByDate(String begin_date, String end_date) {
		return reportDaoAdmin.GetDataSuccessBillByDate(begin_date, end_date);
	}

	public List<Bills> GetDataWaitingBillByDate(String begin_date, String end_date) {
		return reportDaoAdmin.GetDataWaitingBillByDate(begin_date, end_date);
	}

	public List<Bills> GetDataProcessingBillByDate(String begin_date, String end_date) {
		return reportDaoAdmin.GetDataProcessingBillByDate(begin_date, end_date);
	}
	
	public List<Bills> GetDataWaitConfirmBillByDate(String begin_date, String end_date){
		return reportDaoAdmin.GetDataWaitConfirmBillByDate(begin_date, end_date);
	}
	
	public List<Bills> GetDataConfirmedBillByDate(String begin_date, String end_date){
		return reportDaoAdmin.GetDataConfirmedBillByDate(begin_date, end_date);
	}
	
	public List<Bills> GetDataCancelBillByDate(String begin_date, String end_date) {
		return reportDaoAdmin.GetDataCancelBillByDate(begin_date, end_date);
	}
}
