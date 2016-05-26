package com.service;

import com.model.Booking;

public interface BookingService {
	public Booking find(int uid);

	public void save(Booking booking);

	public Booking modify(Booking booking);

}
