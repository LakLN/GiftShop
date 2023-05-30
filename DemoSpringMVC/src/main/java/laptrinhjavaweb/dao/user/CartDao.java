package laptrinhjavaweb.dao.user;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import laptrinhjavaweb.models.user.Cart_Item;
import laptrinhjavaweb.models.user.Inventory;
import laptrinhjavaweb.models.user.Product;
@Repository
public class CartDao {
	@Autowired
	ProductsDao productsDao = new ProductsDao();

	
	public HashMap<Long, Cart_Item> AddCart(long id, HashMap<Long, Cart_Item> cart){
		Cart_Item itemCart = new Cart_Item();
		Product product = productsDao.ProductId(id);
		Inventory iventory = productsDao.GetQuantityProduct(String.valueOf(id));
		int quantityInventory= (iventory.getQuantity() - iventory.getSold());
		if(product != null && cart.containsKey(id)) {
			itemCart = cart.get(id);
			itemCart.setQuantity(itemCart.getQuantity() + 1);
			itemCart.setTotal_purchase_price(itemCart.getQuantity() * itemCart.getProduct().getPurchase_price());
		}
		else {
			itemCart.setProduct(product);
			itemCart.setQuantity(1);
			itemCart.setTotal_purchase_price(product.getPurchase_price());
		}
		itemCart.setInventory(quantityInventory);
		cart.put(id, itemCart);
		return cart;
	}
	
	public HashMap<Long, Cart_Item> AddCartBySoLuong(long id,int quantity, HashMap<Long, Cart_Item> cart){
		Cart_Item itemCart = new Cart_Item();
		Product product = productsDao.ProductId(id);
		Inventory iventory = productsDao.GetQuantityProduct(String.valueOf(id));
		int quantityInventory= (iventory.getQuantity() - iventory.getSold());
		if(product != null && cart.containsKey(id)) {
			itemCart = cart.get(id);
			itemCart.setQuantity(itemCart.getQuantity() + quantity);
			itemCart.setTotal_purchase_price(itemCart.getQuantity() * itemCart.getProduct().getPurchase_price());
		}
		else {
			itemCart.setProduct(product);
			itemCart.setQuantity(quantity);
			itemCart.setTotal_purchase_price(product.getPurchase_price());
		}
		cart.put(id, itemCart);
		itemCart.setInventory(quantityInventory);
		return cart;
	}
	
	public HashMap<Long, Cart_Item> UpdateCart(long id, int quantity, HashMap<Long, Cart_Item> cart){
		if (cart == null) {
			return cart;
		}
		Cart_Item itemCart = new Cart_Item();
		Product product = productsDao.ProductId(id);
			
		if(cart.containsKey(id)) 
		{
			itemCart = cart.get(id);
			itemCart.setQuantity(quantity);
			float totalPrice = quantity * itemCart.getProduct().getPurchase_price();
			itemCart.setTotal_purchase_price(totalPrice);
			itemCart.setProduct(product);
			cart.put(id, itemCart);	
		}	
		
		return cart;
	}
	
	public HashMap<Long, Cart_Item> DeleteCart(long id, HashMap<Long, Cart_Item> cart){
		if (cart == null) {
			return cart;
		}
		if(cart.containsKey(id)) {
			cart.remove(id);
		}
		return cart;
	}
	
	public int TotalQuantity(HashMap<Long, Cart_Item> cart){
		int totalQuantity = 0;
		for(Map.Entry<Long, Cart_Item> itemCart : cart.entrySet()) {
			totalQuantity += itemCart.getValue().getQuantity();
		}
		return totalQuantity;
	}
	
	public float TotalPrice(HashMap<Long, Cart_Item> cart) {
		float totalPrice = 0;
		for(Map.Entry<Long, Cart_Item> itemCart : cart.entrySet()) {
			totalPrice += itemCart.getValue().getTotal_purchase_price();
		}
		return totalPrice;
	}
}
