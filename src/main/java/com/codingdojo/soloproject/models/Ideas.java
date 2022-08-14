package com.codingdojo.soloproject.models;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;


@Entity
@Table(name="ideas")
public class Ideas {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@NotBlank(message="Title required")
    private String title;
	
	@NotBlank(message="Language Type is Required")
    private String language;
	
	@NotBlank(message="Description required")
    private String description;
	@Column(updatable=false)
    private Date createdAt;
    private Date updatedAt;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="user_id")
    private User user;

	public Ideas() {}
	

	
	 public Ideas(Long id, @NotBlank(message = "Title required") String title,
			@NotBlank(message = "Language Type is Required") String language,
			@NotBlank(message = "Description required") String description, Date createdAt, Date updatedAt, User user) {
		super();
		this.id = id;
		this.title = title;
		this.language = language;
		this.description = description;
		this.createdAt = createdAt;
		this.updatedAt = updatedAt;
		this.user = user;
	}



	@PrePersist
	    protected void onCreate(){
	        this.createdAt = new Date();
	    }
	 @PreUpdate
	    protected void onUpdate(){
	        this.updatedAt = new Date();
	    }



	public Long getId() {
		return id;
	}



	public void setId(Long id) {
		this.id = id;
	}



	public String getTitle() {
		return title;
	}



	public void setTitle(String title) {
		this.title = title;
	}



	public String getLanguage() {
		return language;
	}



	public void setLanguage(String language) {
		this.language = language;
	}



	public String getDescription() {
		return description;
	}



	public void setDescription(String description) {
		this.description = description;
	}



	public Date getCreatedAt() {
		return createdAt;
	}



	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}



	public Date getUpdatedAt() {
		return updatedAt;
	}



	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}



	public User getUser() {
		return user;
	}



	public void setUser(User user) {
		this.user = user;
	}
	 
    

}
