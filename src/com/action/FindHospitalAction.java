package com.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.model.Hospital;
import com.opensymphony.xwork2.ActionSupport;
import com.service.HospitalService;

public class FindHospitalAction extends ActionSupport {
	HospitalService hospitalService;
	
	@Override
	public String execute() throws Exception {
		List<Hospital> hospitals = this.hospitalService.find();
		if(hospitals == null){
			return ERROR;
		} else{
			HttpServletRequest request = ServletActionContext.getRequest();
			HttpSession session = request.getSession();
			session.setAttribute("hospitals", hospitals);
			return SUCCESS;
		}
	}
	
	public HospitalService getHospitalService(){
		return hospitalService;
	}
	
	public void setHospitalService(HospitalService hospitalService){
		this.hospitalService = hospitalService;
	}

}
