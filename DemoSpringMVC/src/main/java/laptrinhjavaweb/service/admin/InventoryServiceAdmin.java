package laptrinhjavaweb.service.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import laptrinhjavaweb.dao.admin.InventoryDaoAdmin;
import laptrinhjavaweb.models.user.Inventory;

@Service
public class InventoryServiceAdmin {
	
	@Autowired
	private InventoryDaoAdmin inventoryDaoAdmin;
	
	public List<Inventory> GetDataInventory(){
		return inventoryDaoAdmin.GetDataInventory();
	}
	
	public List<Inventory> GetDataInventorysPage(int start, int totalPage) {
		List<Inventory> listProducts = inventoryDaoAdmin.GetDataInventorysPage(start, totalPage);
		return listProducts;
	}
	
	public Inventory GetDataInventoryId(int id) {
		return inventoryDaoAdmin.GetDataInventoryId(id);	
	}
	
	public void DeleteInventory(int id) {
		inventoryDaoAdmin.DeleteInventory(id);;
	}
	
	public void UpdateInventory(Inventory inventory) {
		inventoryDaoAdmin.UpdateInventory(inventory);
	}
	
	public void InsertInventory(Inventory inventory) {
		inventoryDaoAdmin.InsertInventory(inventory);
	}

}
