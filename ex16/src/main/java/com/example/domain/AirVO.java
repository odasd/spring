package com.example.domain;

public class AirVO {
	
	private String title;
	private String info;
	private String rating;
	private String image;
	private String city;
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public String getRating() {
		return rating;
	}
	public void setRating(String rating) {
		this.rating = rating;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	
	@Override
	public String toString() {
		return "AirVO [title=" + title + ", info=" + info + ", rating=" + rating + ", image=" + image + ", city=" + city
				+ "]";
	}
	
	
	
	
}
