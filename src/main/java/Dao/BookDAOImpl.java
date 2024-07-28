package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.mysql.cj.protocol.Resultset;

import Models.BookDtls;

public class BookDAOImpl implements BookDAO {

	private Connection conn;

	public BookDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean addBooks(BookDtls b) {

		boolean f = false;
		try {
			String sql = "insert into book_details(bookname,author,price,bookcategory,status,photo,email) values(?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, b.getBookname());
			ps.setString(2, b.getAuthor());
			ps.setString(3, b.getPrice());
			ps.setString(4, b.getBookCategory());
			ps.setString(5, b.getStatus());
			ps.setString(6, b.getPhotoName());
			ps.setString(7, b.getEmail());

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public List<BookDtls> getAllBooks() {
		List<BookDtls> list = new ArrayList<BookDtls>();
		BookDtls b = null;

		try {
			String sql = "select * from book_details";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				b = new BookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public BookDtls getBookById(int id) {

		BookDtls b = null;
		try {
			String sql = "select * from book_details where bookId=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				b = new BookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return b;
	}

	public boolean updateEditBooks(BookDtls b) {
		boolean f = false;
		try {
			String sql = "update book_details set bookname=?,author=?,price=?,status=? where bookId=?";
			PreparedStatement pmst = conn.prepareStatement(sql);

			pmst.setString(1, b.getBookname());
			pmst.setString(2, b.getAuthor());
			pmst.setString(3, b.getPrice());
			pmst.setString(4, b.getStatus());
			pmst.setInt(5, b.getBookId());

			int i = pmst.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public boolean deleteBooks(int id) {
		boolean f = false;
		try {
			String sql = "delete from book_details where bookId=?";
			PreparedStatement pmst = conn.prepareStatement(sql);
			pmst.setInt(1, id);
			int i = pmst.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public List<BookDtls> getNewBook() {

		List<BookDtls> list = new ArrayList<BookDtls>();

		BookDtls b = null;
		try {

			String sql = "select * from book_details  where bookCategory=? and status=? order by bookId DESC";
			PreparedStatement pmst = conn.prepareStatement(sql);

			pmst.setString(1, "New");
			pmst.setString(2, "Active");

			ResultSet rs = pmst.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {

				b = new BookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<BookDtls> getRecentBook() {
		List<BookDtls> list = new ArrayList<BookDtls>();

		BookDtls b = null;
		try {

			String sql = "select * from book_details  where status=? order by bookId DESC";
			PreparedStatement pmst = conn.prepareStatement(sql);
			pmst.setString(1, "Active");

			ResultSet rs = pmst.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {

				b = new BookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<BookDtls> getOldBook() {
		List<BookDtls> list = new ArrayList<BookDtls>();

		BookDtls b = null;
		try {

			String sql = "select * from book_details  where bookCategory=? and status=? order by bookId DESC";
			PreparedStatement pmst = conn.prepareStatement(sql);

			pmst.setString(1, "Old");
			pmst.setString(2, "Active");

			ResultSet rs = pmst.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {

				b = new BookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<BookDtls> getAllRecentBooks() {
		List<BookDtls> list = new ArrayList<BookDtls>();

		BookDtls b = null;
		try {

			String sql = "select * from book_details  where status=? order by bookId DESC";
			PreparedStatement pmst = conn.prepareStatement(sql);
			pmst.setString(1, "Active");

			ResultSet rs = pmst.executeQuery();
//			int i=1;
			while (rs.next()) {

				b = new BookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
//				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<BookDtls> getAllOldBooks() {
		List<BookDtls> list = new ArrayList<BookDtls>();

		BookDtls b = null;
		try {

			String sql = "select * from book_details  where bookCategory=? and status=? order by bookId DESC";
			PreparedStatement pmst = conn.prepareStatement(sql);

			pmst.setString(1, "Old");
			pmst.setString(2, "Active");

			ResultSet rs = pmst.executeQuery();
//			int i=1;
			while (rs.next()) {

				b = new BookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
//				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<BookDtls> getAllNewBooks() {
		List<BookDtls> list = new ArrayList<BookDtls>();

		BookDtls b = null;
		try {

			String sql = "select * from book_details  where bookCategory=? and status=? order by bookId DESC";
			PreparedStatement pmst = conn.prepareStatement(sql);

			pmst.setString(1, "New");
			pmst.setString(2, "Active");

			ResultSet rs = pmst.executeQuery();
//			int i=1;
			while (rs.next()) {

				b = new BookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
//				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public List<BookDtls> getBookByOld(String email, String category) {
		
		List<BookDtls> list = new ArrayList<BookDtls>();
		BookDtls b = null;
		
		try {
			
			String sql = "select * from book_details where bookCategory=? and email=?";
			PreparedStatement pmst = conn.prepareStatement(sql);
			pmst.setString(1, category);
			pmst.setString(2, email);
			ResultSet rs = pmst.executeQuery();
			
			while (rs.next()) {

				b = new BookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	public boolean oldbookdelete(int bookId,String email, String category) {
		boolean f =false;
		
		try {
			String sql="delete from book_details where bookId=? and bookCategory=? and email=?";
			PreparedStatement pmst = conn.prepareStatement(sql);
			pmst.setInt(1, bookId);
			pmst.setString(2, category);
			pmst.setString(3, email);
			
			int i = pmst.executeUpdate();
			if(i==1) {
				f= true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	
	public List<BookDtls> getBookBySearch(String ch) {
		List<BookDtls> list = new ArrayList<BookDtls>();
		BookDtls b = null;
		
		try {
			
			String sql = "select * from book_details where bookname like ? or author like ? or bookCategory like ? and status=?";
			PreparedStatement pmst = conn.prepareStatement(sql);
			
			pmst.setString(1, "%"+ch+"%");
			pmst.setString(2, "%"+ch+"%");
			pmst.setString(3, "%"+ch+"%");
			pmst.setString(4, "Active");
			
			ResultSet rs = pmst.executeQuery();
			
			while (rs.next()) {

				b = new BookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
}
