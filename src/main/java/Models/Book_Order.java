package Models;

public class Book_Order {
	
	private int id;
	private String orderId;
	private String username;
	private String email;
	private String phno;
	private String fulladd;
	private String bookName;
	private String author;
	private String price;
	private String paymentType;
	
	
	
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhno() {
		return phno;
	}
	public void setPhno(String phno) {
		this.phno = phno;
	}
	public String getFulladd() {
		return fulladd;
	}
	public void setFulladd(String fulladd) {
		this.fulladd = fulladd;
	}
	public String getPaymentType() {
		return paymentType;
	}
	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
	}
	
	
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public Book_Order(int id, String orderId, String username, String email, String phno, String fulladd,
			String paymentType) {
		super();
		this.id = id;
		this.orderId = orderId;
		this.username = username;
		this.email = email;
		this.phno = phno;
		this.fulladd = fulladd;
		this.paymentType = paymentType;
	}
	public Book_Order() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	

}
