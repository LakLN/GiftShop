package laptrinhjavaweb.service.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import laptrinhjavaweb.dao.admin.ProductsDaoAdmin;
import laptrinhjavaweb.models.user.Product;

@Service
public class ProductServiceAdmin {
	@Autowired
	private ProductsDaoAdmin productsDaoAdmin;
	
	public List<Product> GetDataProduct(){
		return productsDaoAdmin.GetDataProduct();
	}
	
	public List<Product> GetDataProductsPage(int start, int totalPage) {
		List<Product> listProducts = productsDaoAdmin.GetDataProductsPage(start, totalPage);
		return listProducts;
	}
	
	public Product GetDataProductId(int id) {
		return productsDaoAdmin.GetDataProductId(id);	
	}
	
	public void DeleteProduct(int id) {
		productsDaoAdmin.DeleteProduct(id);;
	}
	
	public void UpdateProduct(Product Product) {
		productsDaoAdmin.UpdateProduct(Product);
	}
	
	public void InsertProduct(Product Product) {
		productsDaoAdmin.InsertProduct(Product);
	}

}
