package com.product;

public class Product {
	private int pid;
    private String title;
    private String description;
    private String category;
    private String price;
    private String stock;
    private String image;
 
    
	public Product(int pid, String title, String description, String category, String price, String stock, String image) {
		super();
		this.pid = pid;
		this.title = title;
		this.description = description;
		this.category = category;
		this.price = price;
		this.stock = stock;
		this.image = image;
		
	}

	public int getPid() {
		return pid;
	}

	public String getTitle() {
		return title;
	}

	public String getDescription() {
		return description;
	}

	public String getCategory() {
		return category;
	}

	public String getPrice() {
		return price;
	}

	public String getStock() {
		return stock;
	}
	public String getImage() {
		return image;
	}
	
}
