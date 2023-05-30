package laptrinhjavaweb.dao.admin;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import laptrinhjavaweb.models.user.Bill_Detail;
import laptrinhjavaweb.models.user.Bill_DetailMapper;
import laptrinhjavaweb.models.user.Bills;
import laptrinhjavaweb.models.user.BillsMapper;

@Repository
public class BillDaoAdmin {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public List<Bills> GetDataBill(){
		List<Bills> list = new ArrayList<Bills>();
		String sql = "SELECT *  FROM BILLS ORDER by id DESC";
		list = jdbcTemplate.query(sql, new BillsMapper());
		return list;
	}
	
	public void DeleteBill(int id) {
		String sql = "UPDATE BILLS SET is_delete = 1 WHERE id = " + id;
		jdbcTemplate.update(sql);
		

	}
	
	public void UpdateBill(Bills bills) {
		System.out.println(bills.getStatus());
		String sql = "UPDATE BILLS SET status = ? WHERE id = ? ";
		jdbcTemplate.update(sql,bills.getStatus(), bills.getId());
	}
	
	public Bills GetDataBillId(int id) {
		String sql = "SELECT *  FROM BILLS WHERE id = " + id;
		return jdbcTemplate.queryForObject(sql, new BillsMapper());
	}
	
	
	public List<Bill_Detail> GetDataBillDetail(int id){
		List<Bill_Detail> listBillDetail = new ArrayList<Bill_Detail>();
		String sql = "SELECT *  FROM BILL_DETAIL WHERE id_bill = " +id;
		listBillDetail = jdbcTemplate.query(sql, new Bill_DetailMapper());
		return listBillDetail;
	}
}
