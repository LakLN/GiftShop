package laptrinhjavaweb.models.user;

public class Order extends AbstractModel<Order> {
	private int id_user;
	private int id_inventory;
	private int id_payment;
	private int id_status;
	private int id_shipment;
	private int id_address;
	private int quantity;
	private String payment_no;
	private float total_purchase_price;
	private float ship_fee;

	public int getId_user() {
		return id_user;
	}

	public void setId_user(int id_user) {
		this.id_user = id_user;
	}

	public int getId_inventory() {
		return id_inventory;
	}

	public void setId_inventory(int id_inventory) {
		this.id_inventory = id_inventory;
	}

	public int getId_payment() {
		return id_payment;
	}

	public void setId_payment(int id_payment) {
		this.id_payment = id_payment;
	}

	public int getId_status() {
		return id_status;
	}

	public void setId_status(int id_status) {
		this.id_status = id_status;
	}

	public int getId_shipment() {
		return id_shipment;
	}

	public void setId_shipment(int id_shipment) {
		this.id_shipment = id_shipment;
	}

	public int getId_address() {
		return id_address;
	}

	public void setId_address(int id_address) {
		this.id_address = id_address;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getPayment_no() {
		return payment_no;
	}

	public void setPayment_no(String payment_no) {
		this.payment_no = payment_no;
	}

	public float getTotal_purchase_price() {
		return total_purchase_price;
	}

	public void setTotal_purchase_price(float total_purchase_price) {
		this.total_purchase_price = total_purchase_price;
	}

	public float getShip_fee() {
		return ship_fee;
	}

	public void setShip_fee(float ship_fee) {
		this.ship_fee = ship_fee;
	}
}
