package laptrinhjavaweb.models.user;

public class Product extends AbstractModel<Product> {
	private int id_category;
	private String name_product;
	private String desc_product;
	private boolean featured_product;
	private boolean new_product;
	private String image;
	private float purchase_price;
	private float promotional_price;
	private String color;
	private int size;
	
	public float getPromotional_price() {
		return promotional_price;
	}

	public void setPromotional_price(float promotional_price) {
		this.promotional_price = promotional_price;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public int getSize() {
		return size;
	}

	public void setSize(int size) {
		this.size = size;
	}
	
	public String getName_product() {
		return name_product;
	}

	public void setName_product(String name_product) {
		this.name_product = name_product;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public boolean isFeatured_product() {
		return featured_product;
	}

	public void setFeatured_product(boolean featured_product) {
		this.featured_product = featured_product;
	}

	public boolean isNew_product() {
		return new_product;
	}

	public void setNew_product(boolean new_product) {
		this.new_product = new_product;
	}


	public Product() {
		super();
	}

	public int getId_category() {
		return id_category;
	}

	public void setId_category(int id_category) {
		this.id_category = id_category;
	}

	public String getDesc_product() {
		return desc_product;
	}

	public void setDesc_product(String desc_product) {
		this.desc_product = desc_product;
	}

	public float getPurchase_price() {
		return purchase_price;
	}

	public void setPurchase_price(float purchase_price) {
		this.purchase_price = purchase_price;
	}
}
