package laptrinhjavaweb.models.user;

public class Image_Product extends AbstractModel<Image_Product> {
	private String image;
	private int id_product;

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public int getId_product() {
		return id_product;
	}

	public void setId_product(int id_product) {
		this.id_product = id_product;
	}
}
