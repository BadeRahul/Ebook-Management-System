package Dao;

import java.util.List;

import Models.BookDtls;

public interface BookDAO {
	
	public boolean addBooks(BookDtls b);
	
	public List<BookDtls> getAllBooks();
	
	public BookDtls getBookById(int id);
	
	public boolean updateEditBooks(BookDtls b);

	public boolean deleteBooks(int id);
	
	public List<BookDtls> getNewBook();
	
	public List<BookDtls> getRecentBook();
	
	public List<BookDtls> getOldBook();
	
	public List<BookDtls> getAllRecentBooks();
	
	public List<BookDtls> getAllOldBooks();
	
	public List<BookDtls> getAllNewBooks();
	
	public List<BookDtls> getBookByOld(String email,String category);
	
	public boolean oldbookdelete(int bookId,String email,String category);
	
	public List<BookDtls> getBookBySearch(String ch);
	
}
