package com.service;

import com.model.User;

public interface UserService {
	public User find(int userid);
	
	public User find(String email);

	public void save(User user);

	public User modify(User user);
}
