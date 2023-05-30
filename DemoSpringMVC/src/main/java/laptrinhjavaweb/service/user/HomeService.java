package laptrinhjavaweb.service.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import laptrinhjavaweb.models.user.Product;
import laptrinhjavaweb.dao.user.CategoryDao;
import laptrinhjavaweb.dao.user.ProductsDao;
import laptrinhjavaweb.models.user.Category;

@Service
public class HomeService{
	@Autowired
	private CategoryDao categoryDao;
	
	@Autowired
	private ProductsDao productsDao;
	
	public List<Category> GetDataCategory() {
		return categoryDao.GetDataCategory();
	}

	public List<Category> GetDataCategory2() {
		return categoryDao.GetDataCategory2();
	}
	
	public List<Category> GetDataCategory3() {
		return categoryDao.GetDataCategory3();
	}
	
	public List<Category> GetDataCategoryFull() {
		return categoryDao.GetDataCategoryFull();
	}
	
	public List<Product> GetDataNewProducts() {
		List<Product> listProducts = productsDao.GetDataNewProducts();
		return listProducts;
	}
	
	public List<Product> GetDataFeaturedProducts() {
		List<Product> listProducts = productsDao.GetDataFeaturedProducts();
		return listProducts;
	}
}