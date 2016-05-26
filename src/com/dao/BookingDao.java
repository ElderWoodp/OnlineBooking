package com.dao;

import java.util.List;

import com.model.Booking;

public interface BookingDao {
	public void insert(Booking booking);

	public void delete(Booking booking);

	public Booking update(Booking booking);

	public Booking query(int booking);

	public List<Booking> query();

}
