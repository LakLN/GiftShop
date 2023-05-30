package laptrinhjavaweb.models.user;

public class Shipment extends AbstractModel<Shipment>{
	private String shipment_name;
	private String shipment_desc;
	private String shipment_time_range;
	private String img;
	private float price_u;

	public String getShipment_name() {
		return shipment_name;
	}

	public void setShipment_name(String shipment_name) {
		this.shipment_name = shipment_name;
	}

	public String getShipment_desc() {
		return shipment_desc;
	}

	public void setShipment_desc(String shipment_desc) {
		this.shipment_desc = shipment_desc;
	}

	public String getShipment_time_range() {
		return shipment_time_range;
	}

	public void setShipment_time_range(String shipment_time_range) {
		this.shipment_time_range = shipment_time_range;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public float getPrice_u() {
		return price_u;
	}

	public void setPrice_u(float price_u) {
		this.price_u = price_u;
	}
}
