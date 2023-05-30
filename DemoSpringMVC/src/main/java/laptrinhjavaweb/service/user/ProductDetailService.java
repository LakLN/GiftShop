package laptrinhjavaweb.service.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import laptrinhjavaweb.dao.user.ProductsDao;
import laptrinhjavaweb.models.user.Image_Product;
import laptrinhjavaweb.models.user.Inventory;
import laptrinhjavaweb.models.user.Product;

@Service
public class ProductDetailService{
	@Autowired
	private ProductsDao productsDao;
	
	public Product GetProductId(long id) {
		List<Product> listProducts = productsDao.GetProductId(id);
		return listProducts.get(0);
	}
	
	public List<Product> GetProductIdCategory(int id) {
		List<Product> listProducts = productsDao.GetDataProductsIds(id);
		return listProducts;
	}

	public List<Product> findByKeyWord(String keyword) {
		List<Product> listProducts = productsDao.findByKeyWord(keyword);
		return listProducts;
	}
	
	public List<Product> SortByKeyWord(String keyword,String key_word) {
		List<Product> listProducts = productsDao.SortByKeyWord(keyword,key_word);
		return listProducts;
	}
	
	public List<Product> Sort(String keyword) {
		List<Product> listProducts = productsDao.Sort(keyword);
		return listProducts;
	}

	public List<Product> SortPage(String keyword, int idCategory) {
		List<Product> listProducts = productsDao.SortPage(keyword,idCategory);
		return listProducts;
	}
	
	public List<Image_Product> GetDataProductDetail(int id_product) {
		List<Image_Product> listProducts = productsDao.GetDataProductDetail(id_product);
		return listProducts;
	}
	
	public Inventory GetQuantityProduct(String id) {
		Inventory inventory= productsDao.GetQuantityProduct(id);
		return inventory;
	}

	public void UpdateSoLuong(int id_product, int soluong) {
		productsDao.UpdateSoLuong(id_product,soluong);
		
	}
}
