package com.action;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.model.Booking;
import com.model.Doctor;
import com.model.User;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.util.ValueStack;
import com.service.BookingService;
import com.service.DoctorService;
import com.service.UserService;

public class UnsubscribeAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	private DoctorService doctorService;
	private UserService userService;
	private BookingService bookingService;
	private int bookingId;
	
	@Override
	public String execute() throws Exception {
		ActionContext context = ActionContext.getContext();
		ValueStack stack = context.getValueStack();
		int bookingId = (int)stack.findValue("bookingId");
		System.out.println(bookingId);
		
		if(bookingId <= 0){
			return ERROR;
		} else{
			Booking booking = this.bookingService.findById(bookingId);
			
			if(booking == null){
				return ERROR;
			}
			if(booking.isIsOverdue()){
				return ERROR;
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
						booking.setIsOverdue(true);
						this.bookingService.modify(booking);
						return ERROR;
					} else{
						int uid = booking.getUid();
						int docId = booking.getDocId();
						
						Doctor doctor = this.doctorService.find(docId);
						Integer fee = doctor.getFee();
						
						User user = this.userService.find(uid);
						int account = user.getAccount();
						
						user.setAccount(account + fee);
						
						String[] records = doctor.getScheduling().split(",");
						String schedule = "";
						for(int i = 0; i < records.length; i++){
							String[] reParts = records[i].split(" ");
							
							if(vt[1].equals(reParts[0]) && vt[2].equals(reParts[1])){
								String amount = reParts[2];
								int amountInt = Integer.valueOf(amount);
								amountInt++;
								amount = String.valueOf(amountInt);
								records[i] = vt[1] + " " + vt[2] + " " + amount;
							}
							
							schedule = schedule + records[i] + ",";
						}
						
						schedule = schedule.substring(0, schedule.length()-1);
						System.out.println(schedule);
						doctor.setScheduling(schedule);
						
						this.userService.modify(user);
						this.doctorService.modify(doctor);
						this.bookingService.delete(booking);
						return SUCCESS;
					}
				} catch (ParseException e) {
					e.printStackTrace();
				}
			}
			return ERROR;
		}
	}

	public DoctorService getDoctorService() {
		return doctorService;
	}

	public void setDoctorService(DoctorService doctorService) {
		this.doctorService = doctorService;
	}

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
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
