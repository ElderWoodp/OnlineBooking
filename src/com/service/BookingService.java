package com.service;

import java.util.List;

import com.model.Booking;

public interface BookingService {
	public List<Booking> find(int uid);
	
	public List<Booking> find();

	public void save(Booking booking);

	public Booking modify(Booking booking);

}
