package laptrinhjavaweb.dao.user;

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
public class BillsDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	public int AddBills(Bills bills) {
		String sql = "INSERT INTO bills (login_name, full_name, phone, email, address, note, total, quantity) "
				+ "VALUES (?,?,?,?,?,?,?,?)";
		return jdbcTemplate.update(sql, bills.getLogin_name(), bills.getFull_name(), bills.getPhone(), bills.getEmail(),
				bills.getAddress(), bills.getNote(), bills.getTotal(), bills.getQuantity());
	}

	/*
	 * public int AddBills(Bills bills) { StringBuffer sql = new StringBuffer();
	 * sql.
	 * append("INSERT INTO bill_detail (login_name, full_name, phone, email, note, total, quantity) VALUES ("
	 * + bills.getLogin_name()+ ", " +bills.getFull_name()+ ", " +bills.getPhone()+
	 * ", " +bills.getEmail()+ ", " +bills.getNote()+ ", " +bills.getTotal()+
	 * ", "+bills.getQuantity()+ ")"); int insert =
	 * jdbcTemplate.update(sql.toString()); return insert; }
	 */

	public int GetIdBills() {
		StringBuffer sql = new StringBuffer();
		sql.append("SELECT MAX(id) FROM bills;");
		int id = jdbcTemplate.queryForObject(sql.toString(), new Object[] {}, int.class);
		return id;
	}

	public void AddBillsDetail(Bill_Detail bill_Detail) {
		String sql = "INSERT INTO bill_detail (id_product, id_bill, name_product, quantity, total, image, create_at, update_at) "
				+ "VALUES (?,?,?,?,?,?,?,?)";
		jdbcTemplate.update(sql, bill_Detail.getId_product(), bill_Detail.getId_bill(), bill_Detail.getName_product(),
				bill_Detail.getQuantity(), bill_Detail.getTotal(), bill_Detail.getImage(), bill_Detail.getCreate_at(),
				bill_Detail.getUpdate_at());
	}

	public List<Bills> GetDataBillId(String string) {
		List<Bills> listBills = new ArrayList<Bills>();
		String sql = "SELECT *  FROM BILLS WHERE login_name = '" + string + "' ORDER BY create_at DESC";
		listBills = jdbcTemplate.query(sql, new BillsMapper());
		return listBills;
	}

	public List<Bill_Detail> GetDataBillDetail(String str) {
		List<Bill_Detail> listBillDetail = new ArrayList<Bill_Detail>();
		String sql = "SELECT BILL_DETAIL.*  FROM BILL_DETAIL INNER JOIN BILLS ON BILL_DETAIL.id_bill = BILLS.id WHERE BILLS.login_name = '" + str +"'";
		listBillDetail = jdbcTemplate.query(sql, new Bill_DetailMapper());
		return listBillDetail;
	}
	
//	public int AddBillsDetail(Bill_Detail bill_Detai) {
//		StringBuffer sql =  new StringBuffer();
//		sql.append("INSERT INTO bill_detail (id_product, id_bill, quantity, total) VALUES (" +bill_Detai.getId_product()+ ", " +bill_Detai.getId_bill()+ ", " +bill_Detai.getQuantity()+ ", " +bill_Detai.getTotal()+ ")");
//		int insert = jdbcTemplate.update(sql.toString().toString());
//		return insert;
//	}
}