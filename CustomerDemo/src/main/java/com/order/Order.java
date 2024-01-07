package com.order;

public class Order {
	
	private int oid;
	private String title;
    private String description;
    private String price;
    private String stockb;
    
    public Order(int oid, String title, String description, String price, String stockb) {
		super();
		this.oid = oid;
		this.title = title;
		this.description = description;
		this.price = price;
		this.stockb = stockb;
	}

	public int getOid() {
		return oid;
	}

	public String getTitle() {
		return title;
	}

	public String getDescription() {
		return description;
	}

	public String getPrice() {
		return price;
	}

	public String getStockb() {
		return stockb;
	}
	
}
