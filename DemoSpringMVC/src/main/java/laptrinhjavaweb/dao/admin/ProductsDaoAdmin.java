package laptrinhjavaweb.dao.admin;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import laptrinhjavaweb.models.user.Product;
import laptrinhjavaweb.models.user.ProductMapper;

@Repository
public class ProductsDaoAdmin {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public List<Product> GetDataProduct(){
		List<Product> list = new ArrayList<Product>();
		String sql = "SELECT *  FROM product ORDER BY id DESC";
		list = jdbcTemplate.query(sql, new ProductMapper());
		return list;
	}
	
	public List<Product> GetDataProductsPage(int start, int totalPage){
		List<Product> list = new ArrayList<Product>();
		String sql = "SELECT *  FROM product ORDER BY id DESC LIMIT " + start + ", " + totalPage;
		list = jdbcTemplate.query(sql, new ProductMapper());
		return list;
	}
	
	public Product GetDataProductId(int id) {
		String sql = "SELECT *  FROM product WHERE id = " + id;
		return jdbcTemplate.queryForObject(sql, new ProductMapper());
	}
	
	public void InsertProduct(Product product) {
	    String sql = "INSERT INTO product (image, id_category, name_product, desc_product, featured_product, new_product, purchase_price, promotional_price, color, size ) " + "VALUES (?,?,?,?,?,?,?,?,?,?)";
	    jdbcTemplate.update(sql,product.getImage(), product.getId_category(), product.getName_product(), product.getDesc_product(), product.isFeatured_product(), product.isNew_product(), product.getPurchase_price(), product.getPromotional_price(), product.getColor(), product.getSize());
	}
	
	public void UpdateProduct(Product product) {
		String sql = "UPDATE product SET image = ?, id_category = ?, name_product = ?, desc_product = ?, featured_product = ?, new_product = ?, purchase_price = ?, promotional_price = ?, color = ?, size = ? WHERE id = ? ";
		jdbcTemplate.update(sql,product.getImage(), product.getId_category(), product.getName_product(), product.getDesc_product(), product.isFeatured_product(), product.isNew_product(), product.getPurchase_price(), product.getPromotional_price(), product.getColor(), product.getSize(), product.getId());
	}
	
	public void DeleteProduct(int id) {
		String sql = "DELETE FROM product WHERE id = " + id;
		jdbcTemplate.update(sql);
		String sql_ = "DELETE FROM INVENTORY WHERE id_product = " + id;
		jdbcTemplate.update(sql_);

	}
}
