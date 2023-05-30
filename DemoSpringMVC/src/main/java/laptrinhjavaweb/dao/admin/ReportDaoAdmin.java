package laptrinhjavaweb.dao.admin;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import laptrinhjavaweb.models.user.Bill_Report;
import laptrinhjavaweb.models.user.Bill_ReportMapper;
import laptrinhjavaweb.models.user.Bills;
import laptrinhjavaweb.models.user.BillsMapper;
import laptrinhjavaweb.models.user.Cate_Report;
import laptrinhjavaweb.models.user.Cate_ReportMapper;

@Repository
public class ReportDaoAdmin {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	
	public List<Bill_Report> GetIncomeBill(String begin_date, String end_date, String time_option){
		List<Bill_Report> list = new ArrayList<Bill_Report>();
		System.out.print(time_option);
		if(time_option.equals("DATE"))
			time_option = "%d - %m - %Y";
		else if(time_option.equals("MONTH"))
			time_option = "%m - %Y";
		else
			time_option = "%Y";
		System.out.print(time_option);
		
		String sql = "SELECT DATE_FORMAT(update_at, '"+time_option+"' ) as update_date, SUM(total) as total_by_date "
				+ "FROM BILLS "
				+ "WHERE update_at BETWEEN'"+begin_date+"'AND '"+end_date+"' AND BILLS.status = N'Đã giao hàng' "
				+ "GROUP BY DATE_FORMAT(update_at, '"+time_option+"' ) "
				+ "ORDER BY update_at ASC;";
		list = jdbcTemplate.query(sql, new Bill_ReportMapper());
		return list;
	}
	
	public List<Cate_Report> GetIncomeCategory(String begin_date, String end_date){
		List<Cate_Report> list = new ArrayList<Cate_Report>();
		String sql = "SELECT CATEGORY.cate_name, SUM(BILLS.total) AS Total_Quantity "
				+ "FROM BILLS "
				+ "INNER JOIN BILL_DETAIL ON BILLS.id = BILL_DETAIL.id_bill "
				+ "INNER JOIN PRODUCT ON PRODUCT.id = BILL_DETAIL.id_product "
				+ "INNER JOIN CATEGORY ON PRODUCT.id_category = CATEGORY.id "
				+ "WHERE DATE(BILLS.update_at) BETWEEN '"+begin_date+"' AND '"+end_date+"' AND BILLS.status = N'Đã giao hàng' "
				+ "GROUP BY CATEGORY.cate_name";
		list = jdbcTemplate.query(sql, new Cate_ReportMapper());
		return list;
	}
	
	public List<Bills> GetDataSuccessBillByDate(String begin_date, String end_date) {
		List<Bills> list = new ArrayList<Bills>();
		String sql = "SELECT * "
				+ "FROM BILLS "
				+ "WHERE DATE(update_at) BETWEEN '"+begin_date+"' AND '"+end_date+"' AND BILLS.status = N'Đã giao hàng' "
				+ "ORDER BY update_at DESC;";
		list = jdbcTemplate.query(sql, new BillsMapper());
		return list;
	}
	
	public List<Bills> GetDataWaitingBillByDate(String begin_date, String end_date) {
		List<Bills> list = new ArrayList<Bills>();
		String sql = "SELECT * "
				+ "FROM BILLS "
				+ "WHERE DATE(update_at) BETWEEN '"+begin_date+"' AND '"+end_date+"' AND BILLS.status = N'Chờ giao hàng' "
				+ "ORDER BY update_at DESC;";
		list = jdbcTemplate.query(sql, new BillsMapper());
		return list;
	}
	
	public List<Bills> GetDataProcessingBillByDate(String begin_date, String end_date) {
		List<Bills> list = new ArrayList<Bills>();
		String sql = "SELECT * "
				+ "FROM BILLS "
				+ "WHERE DATE(update_at) BETWEEN '"+begin_date+"' AND '"+end_date+"' AND BILLS.status = N'Đang giao hàng' "
				+ "ORDER BY update_at DESC;";
		list = jdbcTemplate.query(sql, new BillsMapper());
		return list;
	}
	
	public List<Bills> GetDataWaitConfirmBillByDate(String begin_date, String end_date) {
		List<Bills> list = new ArrayList<Bills>();
		String sql = "SELECT * "
				+ "FROM BILLS "
				+ "WHERE DATE(update_at) BETWEEN '"+begin_date+"' AND '"+end_date+"' AND BILLS.status = N'Chờ xác nhận' "
				+ "ORDER BY update_at DESC;";
		list = jdbcTemplate.query(sql, new BillsMapper());
		return list;
	}
	
	public List<Bills> GetDataConfirmedBillByDate(String begin_date, String end_date) {
		List<Bills> list = new ArrayList<Bills>();
		String sql = "SELECT * "
				+ "FROM BILLS "
				+ "WHERE DATE(update_at) BETWEEN '"+begin_date+"' AND '"+end_date+"' AND BILLS.status = N'Xác nhận' "
				+ "ORDER BY update_at DESC;";
		list = jdbcTemplate.query(sql, new BillsMapper());
		return list;
	}
	
	public List<Bills> GetDataCancelBillByDate(String begin_date, String end_date) {
		List<Bills> list = new ArrayList<Bills>();
		String sql = "SELECT * "
				+ "FROM BILLS "
				+ "WHERE DATE(update_at) BETWEEN '"+begin_date+"' AND '"+end_date+"' AND BILLS.status = N'Hủy "
				+ "ORDER BY update_at DESC;";
		list = jdbcTemplate.query(sql, new BillsMapper());
		return list;
	}
}
