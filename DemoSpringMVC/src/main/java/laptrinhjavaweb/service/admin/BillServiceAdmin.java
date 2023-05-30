package laptrinhjavaweb.service.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import laptrinhjavaweb.dao.admin.BillDaoAdmin;
import laptrinhjavaweb.models.user.Bill_Detail;
import laptrinhjavaweb.models.user.Bills;

@Service
public class BillServiceAdmin {
	@Autowired
	private BillDaoAdmin billDaoAdmin;
	
	public List<Bills> GetDataBill(){
		return billDaoAdmin.GetDataBill();
	}
	
	public void DeleteBill(int id) {
		billDaoAdmin.DeleteBill(id);
	}
	
	public void UpdateBill(Bills bills) {
		billDaoAdmin.UpdateBill(bills);
	}
	
	public Bills GetDataBillId(int id) {
		return billDaoAdmin.GetDataBillId(id);	
	}
	
	public List<Bill_Detail> GetDataBillDetail(int id){
		return billDaoAdmin.GetDataBillDetail(id);
	}
}
