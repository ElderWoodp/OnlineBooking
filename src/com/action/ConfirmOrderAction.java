package com.action;

import java.util.HashMap;
import java.util.Map;

import com.model.Doctor;
import com.model.User;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.util.ValueStack;
import com.service.BookingService;
import com.service.DoctorService;
import com.service.UserService;

public class ConfirmOrderAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	private UserService userService;
	private DoctorService doctorService;
	private BookingService bookingService;
	
	@Override
	public String execute() throws Exception {
		ActionContext context = ActionContext.getContext();
		ValueStack stack = context.getValueStack();
		int userId = (int)stack.findValue("userId");
		int docId = (int)stack.findValue("docId");
		Map<String,Integer> map = new HashMap<String,Integer>();
		map = (Map)stack.findValue("map");
		
		System.out.println("userId");
		System.out.println("docId");
		System.out.println("map");
		
		if(userId > 0 && docId > 0 && map != null){
			User user = this.userService.find(userId);
			Doctor doctor = this.doctorService.find(docId);
			
			int fee = doctor.getFee();
			if(fee <= 0 ){
				return ERROR;
			}
			
			int account = user.getAccount();
			if(account >= fee){
			user.setAccount(account - fee);
			this.userService.modify(user);
			} else{
				return ERROR;
			}
			
		}
		
		return SUCCESS;
	}
	
	public UserService getUserService(){
		return userService;
	}
	
	public void setUserService(UserService userService){
		this.userService = userService;
	}
	
	public DoctorService getDoctorService(){
		return doctorService;
	}
	
	public void setDoctorService(DoctorService doctorService){
		this.doctorService = doctorService;
	}
	
	public BookingService getBookingService(){
		return bookingService;
	}
	
	public void setBookingService(BookingService bookingService){
		this.bookingService = bookingService;
	}

}
