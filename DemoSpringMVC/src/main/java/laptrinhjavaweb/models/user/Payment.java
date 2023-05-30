package laptrinhjavaweb.models.user;

public class Payment extends AbstractModel<Payment> {
	private String payment_name;
	private String payment_desc;
	private String image;

	public String getPayment_name() {
		return payment_name;
	}

	public void setPayment_name(String payment_name) {
		this.payment_name = payment_name;
	}

	public String getPayment_desc() {
		return payment_desc;
	}

	public void setPayment_desc(String payment_desc) {
		this.payment_desc = payment_desc;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}
}
