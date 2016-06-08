package com.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.model.Booking;
import com.model.Doctor;
import com.model.User;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.util.ValueStack;
import com.service.BookingService;
import com.service.DoctorService;
import com.service.UserService;
import com.sun.jmx.snmp.Timestamp;

public class ConfirmOrderAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	private UserService userService;
	private DoctorService doctorService;
	private BookingService bookingService;
	private int userId;
	private int docId;
	private String visitTime;
	
	@Override
	public String execute() throws Exception {
		ActionContext context = ActionContext.getContext();
		ValueStack stack = context.getValueStack();
		int userId = (int)stack.findValue("userId");
		int docId = (int)stack.findValue("docId");
		String visitTime = (String)stack.findValue("visitTime");
		
		System.out.println(userId);
		System.out.println(docId);
		System.out.println(visitTime);
		
		if(userId > 0 && docId > 0 && visitTime != null){
			User user = this.userService.find(userId);
			Booking booking = new Booking();
			List<Booking> bookings = this.bookingService.find();
			Doctor doctor = this.doctorService.find(docId);
			
			String[] visitTimeParts = visitTime.split(" ");
			String dayOfWeek = visitTimeParts[1];
			String hour = visitTimeParts[2];
			
			System.out.println(dayOfWeek);
			System.out.println(hour);
			
			//对用户表的账户进行模拟扣费
			int fee = doctor.getFee();
			if(fee <= 0 ){
				return ERROR;
			}
			
			int account = user.getAccount();
			if(account >= fee){
				user.setAccount(account - fee);
			} else{
				return ERROR;
			}
			
			//对医生表中特定时间的放号数减一
			String[] records = doctor.getScheduling().split(",");
			String schedule = "";
			for(int i = 0; i < records.length; i++){
				String[] reParts = records[i].split(" ");
				
				if(dayOfWeek.equals(reParts[0]) && hour.equals(reParts[1])){
					String amount = reParts[2];
					if(amount.compareTo("0") > 0){
						int amountInt = Integer.valueOf(amount);
						amountInt--;
						amount = String.valueOf(amountInt);
						records[i] = dayOfWeek + " " + hour + " " + amount;
					} else{
						return ERROR;
					}
				}
				
				schedule = schedule + records[i] + ",";
			}
			
			schedule = schedule.substring(0, schedule.length()-1);
			System.out.println(schedule);
			doctor.setScheduling(schedule);
			
			
			//新添加一条订单记录
			Date d = new Date();
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd");
			String date = formatter.format(d);
			System.out.println(date);
			int count = 0;
			for(int i = 0; i < bookings.size(); i++){
				String vt = bookings.get(i).getVisitTime();
				String reDate = vt.split(" ")[0];
				if(date.equals(reDate)){
					count++;
				}
			}
			count++;
			String serialNum = String.valueOf(count);
			Date bookDate = new Date();
			
			booking.setUid(userId);
			booking.setDocId(docId);
			booking.setVisitTime(visitTime);
			booking.setIsOverdue(false);
			booking.setNumber(serialNum);
			booking.setBookTime(bookDate);
			
			this.userService.modify(user);
			this.doctorService.modify(doctor);
			this.bookingService.save(booking);
			
			return SUCCESS;
		} else{
			return ERROR;
		}
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
	
	public int getUserId(){
		return userId;
	}
	
	public void setUserId(int userId){
		this.userId = userId;
	}
	
	public int getDocId(){
		return docId;
	}
	
	public void setDocId(int docId){
		this.docId = docId;
	}
	
	public String getVisitTime(){
		return visitTime;
	}
	
	public void setVisitTime(String visitTime){
		this.visitTime = visitTime;
	}

}
