package com.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.model.Booking;
import com.model.Department;
import com.model.Doctor;
import com.model.Hospital;
import com.model.Order;
import com.model.User;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.util.ValueStack;
import com.service.BookingService;
import com.service.DepartmentService;
import com.service.DoctorService;
import com.service.HospitalService;
import com.service.UserService;

public class FindOrdersAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	private BookingService bookingService;
	private UserService userService;
	private DoctorService doctorService;
	private HospitalService hospitalService;
	private DepartmentService departmentService;
	private int userId;
	
	@Override
	public String execute() throws Exception {
		ActionContext context = ActionContext.getContext();
		ValueStack stack = context.getValueStack();
		int userId = (int)stack.findValue("userId");
		System.out.println(userId);
		
		if(userId > 0){
			List<Order> orders = new ArrayList<Order>();
			List<Booking> bookings = this.bookingService.find(userId);
			
			if(bookings != null && bookings.size() > 0){
				for(int i = 0; i < bookings.size(); i++){
					Order order = new Order();
					Booking booking = bookings.get(i);
					
					order.setBookingId(booking.getId());
					order.setVisitTime(booking.getVisitTime());
					order.setIsOverdue(booking.isIsOverdue());
					order.setNumber(booking.getNumber());
					
					int uid = booking.getUid();
					int docId = booking.getDocId();
					
					User user = this.userService.find(uid);
					order.setUserName(user.getUsername());
					
					Doctor doctor = this.doctorService.find(docId);
					order.setDoctorName(doctor.getName());
					order.setFee(doctor.getFee());
					
					int hid = doctor.getHid();
					int depId = doctor.getDepId();
					
					Hospital hospital = this.hospitalService.find(hid);
					order.setHospitalName(hospital.getName());
					order.setHospitalAddress(hospital.getAddress());
					
					Department department = this.departmentService.find(depId);
					order.setDepartmentName(department.getName());
					
					orders.add(order);
				}
				HttpServletRequest request = ServletActionContext.getRequest();
				HttpSession session = request.getSession();
				session.setAttribute("orders", orders);
				return SUCCESS;
			} else{
				System.out.println("There is no booking");
				return SUCCESS;
			}
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

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public DoctorService getDoctorService() {
		return doctorService;
	}

	public void setDoctorService(DoctorService doctorService) {
		this.doctorService = doctorService;
	}

	public HospitalService getHospitalService() {
		return hospitalService;
	}

	public void setHospitalService(HospitalService hospitalService) {
		this.hospitalService = hospitalService;
	}

	public DepartmentService getDepartmentService() {
		return departmentService;
	}

	public void setDepartmentService(DepartmentService departmentService) {
		this.departmentService = departmentService;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

}
