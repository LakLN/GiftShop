package laptrinhjavaweb.service.user;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import laptrinhjavaweb.dao.user.CartDao;
import laptrinhjavaweb.models.user.Cart_Item;

@Service
public class CartService {
	@Autowired
	private CartDao cartDao = new CartDao();
	
	public HashMap<Long, Cart_Item> AddCart(long id, HashMap<Long, Cart_Item> cart){
		return cartDao.AddCart(id, cart);
	}
	
	public HashMap<Long, Cart_Item> UpdateCart(long id, int quantity, HashMap<Long, Cart_Item> cart){
		return cartDao.UpdateCart(id, quantity, cart);
	}
	
	public HashMap<Long, Cart_Item> DeleteCart(long id, HashMap<Long, Cart_Item> cart){
		return cartDao.DeleteCart(id, cart);
	}
	
	public int TotalQuantity(HashMap<Long, Cart_Item> cart){
		return cartDao.TotalQuantity(cart);
	}
	
	public float TotalPrice(HashMap<Long, Cart_Item> cart) {
		return cartDao.TotalPrice(cart);
	}

	public HashMap<Long, Cart_Item> AddCartBySoLuong(long id, int quantity, HashMap<Long, Cart_Item> cart) {
		return cartDao.AddCartBySoLuong(id, quantity, cart);
	}
}
