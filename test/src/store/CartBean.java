package store;

public class CartBean {//장바구니 cart 테이블
	
	private String customer_id;
	private int item_code;
	private int cart_qty;
	
	public CartBean() {
		
	}

	//모든 변수 다 집어넣는 생성자
	public CartBean(String customer_id, int item_code, int cart_qty) {
		super();
		this.customer_id = customer_id;
		this.item_code = item_code;
		this.cart_qty = cart_qty;
	}

	public String getCustomer_id() {
		return customer_id;
	}

	public void setCustomer_id(String customer_id) {
		this.customer_id = customer_id;
	}

	public int getItem_code() {
		return item_code;
	}

	public void setItem_code(int item_code) {
		this.item_code = item_code;
	}

	public int getCart_qty() {
		return cart_qty;
	}

	public void setCart_qty(int cart_qty) {
		this.cart_qty = cart_qty;
	}
	
}
