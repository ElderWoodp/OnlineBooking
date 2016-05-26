package com.service;

import com.dao.BookingDao;
import com.model.Booking;

public class BookingServiceImpl implements BookingService {
	private BookingDao bookingDao;

	@Override
	public Booking find(int uid) {
		Booking booking = null;
		booking = this.bookingDao.query(uid);
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
	
	public void setBookingDao(BookingDao bookingDao){
		this.bookingDao = bookingDao;
	}

}
