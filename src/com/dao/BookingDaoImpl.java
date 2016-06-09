package com.dao;

import java.util.List;

import org.springframework.orm.hibernate3.HibernateTemplate;
import com.dao.BookingDao;

import com.model.Booking;


public class BookingDaoImpl implements BookingDao {
	private HibernateTemplate hibernateTemplate;

	@Override
	public void insert(Booking booking) {
		this.hibernateTemplate.save(booking);

	}

	@Override
	public void delete(Booking booking) {
		this.hibernateTemplate.delete(booking);

	}

	@Override
	public Booking update(Booking booking) {
		this.hibernateTemplate.update(booking);
		return this.queryById(booking.getId());
	}

	public Booking queryById(int id){
		String hql = "from Booking booking where booking.id=:n";
		List<Booking> bookings = this.hibernateTemplate.findByNamedParam(hql, "n", id);
		Booking booking = null;
		if(bookings != null && bookings.size() > 0){
			booking = bookings.get(0);
		} else{
			System.out.println("query():bookings.size=" + bookings.size());
		}
		return booking;
	}
	
	@Override
	public List<Booking> query(int uid) {
		String hql = "from Booking booking where booking.uid=:n";
		List<Booking> bookings = this.hibernateTemplate.findByNamedParam(hql, "n", uid);
		return bookings;
	}

	@Override
	public List<Booking> query() {
		String hql = "from Booking booking";
		List<Booking> bookings = this.hibernateTemplate.find(hql);
		return bookings;
	}
	
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate){
		this.hibernateTemplate = hibernateTemplate;
	}

}
