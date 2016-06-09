package com.action;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.model.Booking;
import com.opensymphony.xwork2.ActionSupport;
import com.service.BookingService;

public class UpdateOrderStateAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	private BookingService bookingService;

	@Override
	public String execute() throws Exception {
		List<Booking> bookings = this.bookingService.find();
		
		if(bookings != null && bookings.size() > 0){
			for(int i = 0; i < bookings.size(); i++){
				Booking booking = bookings.get(i);
				
				if(!booking.isIsOverdue()){
					SimpleDateFormat df=new SimpleDateFormat("yyyy/MM/dd hh:mm");
					String visitTime = booking.getVisitTime();
					String[] vt = visitTime.split(" ");
					String[] hours = vt[2].split("-");
					String deadline = vt[0] + " " + hours[1];
					try {
						Date dl = df.parse(deadline);
						Date date = new Date();
						if(date.after(dl)){
							booking.setIsOverdue(true);
							this.bookingService.modify(booking);
						}
					} catch (ParseException e) {
						e.printStackTrace();
					}
				}
			}
		}
		return SUCCESS;
	}
	
	public BookingService getBookingService() {
		return bookingService;
	}

	public void setBookingService(BookingService bookingService) {
		this.bookingService = bookingService;
	}
}
