package laptrinhjavaweb.models.user;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class PaymentMapper implements RowMapper<Payment> {

	public Payment mapRow(ResultSet rs, int rowNum) throws SQLException {
		Payment payment = new Payment();
		payment.setId(rs.getInt("id"));
		payment.setPayment_name(rs.getString("payment_name"));
		payment.setPayment_desc(rs.getString("payment_desc"));
		payment.setImage(rs.getString("image"));
		payment.setCreate_at(rs.getTimestamp("create_at"));
		payment.setUpdate_at(rs.getTimestamp("update_at"));
		return payment;
	}

}
