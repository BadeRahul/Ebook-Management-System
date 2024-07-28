package Dao;

import java.util.List;

//import Models.BookDtls;
import Models.Cart;

public interface CartDAO {

	public boolean addCart(Cart c);
	
	public List<Cart> getBookByUser(int userId);
	
	public boolean deleteBook(int bid,int uid);
}
