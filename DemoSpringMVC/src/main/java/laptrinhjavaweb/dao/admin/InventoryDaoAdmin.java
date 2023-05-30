package laptrinhjavaweb.dao.admin;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import laptrinhjavaweb.models.user.Inventory;
import laptrinhjavaweb.models.user.InventoryMapper;

@Repository
public class InventoryDaoAdmin {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public List<Inventory> GetDataInventory(){
		List<Inventory> list = new ArrayList<Inventory>();
		String sql = "SELECT *  FROM inventory";
		
		list = jdbcTemplate.query(sql, new InventoryMapper());
		return list;
	}
	
	public List<Inventory> GetDataInventorysPage(int start, int totalPage){
		List<Inventory> list = new ArrayList<Inventory>();
		String sql = "SELECT *  FROM inventory LIMIT " + start + ", " + totalPage;
		list = jdbcTemplate.query(sql, new InventoryMapper());
		return list;
	}
	
	public Inventory GetDataInventoryId(int id) {
		String sql = "SELECT *  FROM Inventory WHERE id = " + id;
		return jdbcTemplate.queryForObject(sql, new InventoryMapper());
	}
	
	public void InsertInventory(Inventory Inventory) {
	    String sql = "INSERT INTO Inventory (id_product, sale_price, quantity, sold ) " + "VALUES (?,?,?,?)";
	    jdbcTemplate.update(sql,Inventory.getId_product(), Inventory.getSale_price(), Inventory.getQuantity(), Inventory.getSold());
	}
	
	public void UpdateInventory(Inventory Inventory) {
		String sql = "UPDATE Inventory SET id_product = ?, sale_price = ?, quantity = ?, sold = ? WHERE id = ? ";
		jdbcTemplate.update(sql,Inventory.getId_product(), Inventory.getSale_price(), Inventory.getQuantity(), Inventory.getSold(), Inventory.getId());
	}
	
	public void DeleteInventory(int id) {
		String sql = "DELETE FROM Inventory WHERE id = " + id;
		jdbcTemplate.update(sql);
	}
}
