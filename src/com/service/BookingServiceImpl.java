package com.service;

import java.util.List;

import com.dao.BookingDao;
import com.model.Booking;

public class BookingServiceImpl implements BookingService {
	private BookingDao bookingDao;

	@Override
	public List<Booking> find(int uid) {
		List<Booking> bookings = null;
		bookings = this.bookingDao.query(uid);
		return bookings;
	}
	
	public List<Booking> find(){
		List<Booking> bookings = null;
		bookings = this.bookingDao.query();
		return bookings;
	}
	
	public Booking findById(int id){
		Booking booking = null;
		booking = this.bookingDao.queryById(id);
		return booking;
	}

	@Override
	public void save(Booking booking) {
		this.bookingDao.insert(booking);

	}

	@Override
	public Booking modify(Booking booking) {
		return this.bookingDao.update(booking);
	}
	
	public void delete(Booking booking){
		this.bookingDao.delete(booking);
	}
	
	public void setBookingDao(BookingDao bookingDao){
		this.bookingDao = bookingDao;
	}

}
