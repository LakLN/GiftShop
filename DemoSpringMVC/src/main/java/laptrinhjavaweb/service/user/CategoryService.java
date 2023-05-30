package laptrinhjavaweb.service.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import laptrinhjavaweb.dao.user.ProductsDao;
import laptrinhjavaweb.models.user.Product;
@Service
public class CategoryService{
	@Autowired
	private ProductsDao productsDao;
	
	public List<Product> GetDataProductsId(int id) {
		List<Product> listProducts = productsDao.GetDataProductsId(id);
		return listProducts;
	}
	
	public List<Product> GetDataProductsPage(int id, int start, int totalPage) {
		List<Product> listProducts = productsDao.GetDataProductsPage(id, start, totalPage);
		return listProducts;
	}
	
	
}
