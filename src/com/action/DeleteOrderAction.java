package com.action;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.model.Booking;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.util.ValueStack;
import com.service.BookingService;

public class DeleteOrderAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	private BookingService bookingService;
	private int bookingId;
	
	@Override
	public String execute() throws Exception {
		ActionContext context = ActionContext.getContext();
		ValueStack stack = context.getValueStack();
		int bookingId = (int)stack.findValue("bookingId");
		System.out.println(bookingId);
		
		if(bookingId >0){
			Booking booking = this.bookingService.findById(bookingId);
			if(booking == null){
				return ERROR;
			}
			if(booking.isIsOverdue()){
				this.bookingService.delete(booking);
				return SUCCESS;
			} else{
				SimpleDateFormat df=new SimpleDateFormat("yyyy/MM/dd hh:mm");
				String visitTime = booking.getVisitTime();
				String[] vt = visitTime.split(" ");
				String[] hours = vt[2].split("-");
				String deadline = vt[0] + " " + hours[1];
				try {
					Date dl = df.parse(deadline);
					Date date = new Date();
					if(date.after(dl)){
						this.bookingService.delete(booking);
						return SUCCESS;
					} else{
						return ERROR;
					}
				} catch (ParseException e) {
					e.printStackTrace();
				}
			}
			return ERROR;
		} else{
			return ERROR;
		}
	}

	public BookingService getBookingService() {
		return bookingService;
	}

	public void setBookingService(BookingService bookingService) {
		this.bookingService = bookingService;
	}

	public int getBookingId() {
		return bookingId;
	}

	public void setBookingId(int bookingId) {
		this.bookingId = bookingId;
	}

}
