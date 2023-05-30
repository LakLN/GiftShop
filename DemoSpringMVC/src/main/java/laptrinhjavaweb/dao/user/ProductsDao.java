package laptrinhjavaweb.dao.user;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import laptrinhjavaweb.models.user.Image_Product;
import laptrinhjavaweb.models.user.Image_ProductMapper;
import laptrinhjavaweb.models.user.Inventory;
import laptrinhjavaweb.models.user.InventoryMapper;
import laptrinhjavaweb.models.user.Product;
import laptrinhjavaweb.models.user.ProductMapper;
@Repository
public class ProductsDao{

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private final boolean YES = true;
	private final boolean NO = false;
	
	public StringBuffer sqlString() {
		StringBuffer sql = new StringBuffer();
		sql.append("SELECT product.id, name_product, product.desc_product, product.image, featured_product, new_product, product.id_category, product.create_at, product.update_at, purchase_price, promotional_price, color, size ");
		sql.append("FROM product INNER JOIN inventory ");
		sql.append("ON product.id = inventory.id_product ");
		//sql.append("WHERE inventory.sold > (SELECT MAX(sold) FROM inventory WHERE id_product = product.id) ");
		//sql.append("AND inventory.stock > 0 ");
		return sql;
	}
	
	public String sqlProducts(boolean newProduct, boolean featuredProduct) {
		StringBuffer sql = sqlString();
		if (featuredProduct) {
			sql.append("AND featured_product = true ");
		}
		if (newProduct) {
			sql.append("AND new_product = true ");
		}
		sql.append("GROUP BY product.id ");
		sql.append("ORDER BY RAND() ");
		if (featuredProduct) {
			sql.append("LIMIT 4 ");
		}
		if (newProduct) {
			sql.append("LIMIT 8 ");
		}
		return sql.toString();
	}
	
	public StringBuffer sqlProductsId(int id) {
		StringBuffer sql = sqlString();
		sql.append("AND id_category = " + id + " ");
		return sql;
	}
	
	public StringBuffer sqlProductsIds(int id) {
		StringBuffer sql = sqlString();
		sql.append("WHERE true ");
		sql.append("AND id_category = " + id + " ");
		sql.append("LIMIT 6 ");
		return sql;
	}
	
	public String sqlProductsPage(int id, int start, int totalPage) {
		StringBuffer sql = sqlProductsId(id);
		sql.append("LIMIT " + start + ", " + totalPage);
		return sql.toString();
	}
	
	public List<Product> GetDataNewProducts() {
		String sql = sqlProducts(YES, NO);
		List<Product> listProducts = jdbcTemplate.query(sql, new ProductMapper());
				return listProducts;
	}
	
	public List<Product> GetDataFeaturedProducts() {
		String sql = sqlProducts(NO, YES);
		List<Product> listProducts = jdbcTemplate.query(sql, new ProductMapper());
				return listProducts;
	}
	
	public List<Product> GetDataProductsId(int id) {
		String sql = sqlProductsId(id).toString();
		List<Product> listProducts = jdbcTemplate.query(sql, new ProductMapper());
				return listProducts;
	}
	
	public List<Product> GetDataProductsIds(int id) {
		String sql = sqlProductsIds(id).toString();
		List<Product> listProducts = jdbcTemplate.query(sql, new ProductMapper());
				return listProducts;
	}
	
	public List<Product> GetDataProductsPage(int id, int start, int totalPage) {
		StringBuffer sqlGetId = sqlProductsId(id);
		List<Product> listProductsId = jdbcTemplate.query(sqlGetId.toString(), new ProductMapper());
		List<Product> listProducts = new ArrayList<Product>();
		if(listProductsId.size() > 0) {
			String sql = sqlProductsPage(id, start, totalPage);
			listProducts = jdbcTemplate.query(sql, new ProductMapper());
		}
		return listProducts;
	}
	
	public String sqlProductId(long id) {
		StringBuffer sql = sqlString();
		sql.append("AND product.id = " + id + " ");
		sql.append("LIMIT 1 " );
		return sql.toString();
	}
	
	public List<Product> GetProductId(long id) {
		String sql = sqlProductId(id);
		List<Product> listProductId = jdbcTemplate.query(sql, new ProductMapper());
		return listProductId;
	}
	
	public Product ProductId(long id) {
		String sql = sqlProductId(id);
		Product ProductId = jdbcTemplate.queryForObject(sql, new ProductMapper());
		return ProductId;
	}
	
	public List<Image_Product> GetDataProductDetail(int id_product) {
		String sql = "SELECT * FROM image_product  WHERE id_product = " + id_product + " LIMIT 2";
		List<Image_Product> listProductDetail = jdbcTemplate.query(sql, new Image_ProductMapper());
		return listProductDetail;
	}
	
	public List<Product> findByKeyWord(String keyword) {
		String sql="";
		if (keyword == "")
			 sql= " SELECT * FROM PRODUCT ";
		else
		{
			 sql = "SELECT * FROM PRODUCT  WHERE name_product LIKE '%" + keyword + "%'" + " OR desc_product LIKE '%"
				+ keyword + "%'" + " OR CONCAT(name_product, desc_product) LIKE '%" + keyword + "%' ";
		}
		List<Product> listProductId = jdbcTemplate.query(sql, new ProductMapper());
		return listProductId;
	}
	
	public List<Product> SortByKeyWord(String keyword,String key_word) {
		String sortby= null;
		//System.out.println(keyword);
		if (keyword.equals("Name"))
			 sortby= " name_product";	
		else if (keyword.equals("Price"))
			 sortby= "purchase_price";
		String sql = "SELECT * FROM PRODUCT  WHERE name_product LIKE '%" +key_word+ "%'"
	            + " OR desc_product LIKE '%"+key_word+"%'"
	            + " OR CONCAT(name_product, desc_product) LIKE '%"+key_word+"%' " 
	            + " order by " + sortby;
		System.out.println(sortby);

		List<Product> listProduct = jdbcTemplate.query(sql, new ProductMapper());
		return listProduct;
	}
	
	public List<Product> Sort(String keyword) {
		String sortby= null;
		//System.out.println(keyword);
		if (keyword.equals("Name"))
			 sortby= " name_product";	
		else if (keyword.equals("Price"))
			 sortby= "purchase_price";
		String sql = "SELECT * FROM PRODUCT  " + " order by " + sortby;
		System.out.println(sortby);
		List<Product> listProduct = jdbcTemplate.query(sql, new ProductMapper());
		return listProduct;
	}

	public List<Product> SortPage(String keyword, int idCategory) {
		String sortby= null;	
		System.out.println(idCategory);
		String s=String.valueOf(idCategory);
		if (keyword.equals("Name"))
			 sortby= "name_product";	
		else if (keyword.equals("Price"))
			 sortby= "purchase_price";
		String sql = "SELECT * FROM PRODUCT where id_category ="+ s + " order by " + sortby;
		System.out.println(sortby);
		List<Product> listProducts = jdbcTemplate.query(sql, new ProductMapper());
		return listProducts;
	}
	
	public Inventory GetQuantityProduct(String id) {
		String sql = "select * from inventory where id_product= ?";
		Inventory inventory = jdbcTemplate.queryForObject(sql,new InventoryMapper(),id);
		return inventory;
	}

	public void UpdateSoLuong(int id_product, int soluong) {
		String sql = "UPDATE INVENTORY set sold= sold+ "+ soluong +"  where id_product=  " + id_product;
		jdbcTemplate.update(sql);
		
	}
	
}
