package laptrinhjavaweb.models.user;

public class Cart_Item extends AbstractModel<Cart_Item> {
	private int id_inventory;
	private int id_cart;
	private int quantity;
	private float total_purchase_price;
	private Product product;
	private int inventory;
	
	public Cart_Item() {
		
	}
	
	public Cart_Item(int id_inventory, int id_cart, int quantity, float total_purchase_price, Product product, int inventory) {
		this.id_inventory = id_inventory;
		this.id_cart = id_cart;
		this.quantity = quantity;
		this.total_purchase_price = total_purchase_price;
		this.product = product;
		this.inventory = inventory;
	}

	public int getId_inventory() {
		return id_inventory;
	}

	public void setId_inventory(int id_inventory) {
		this.id_inventory = id_inventory;
	}

	public int getId_cart() {
		return id_cart;
	}

	public void setId_cart(int id_cart) {
		this.id_cart = id_cart;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public float getTotal_purchase_price() {
		return total_purchase_price;
	}

	public void setTotal_purchase_price(float total_purchase_price) {
		this.total_purchase_price = total_purchase_price;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public int getInventory() {
		return inventory;
	}

	public void setInventory(int inventory) {
		this.inventory = inventory;
	}
}
