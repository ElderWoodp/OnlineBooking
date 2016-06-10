
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title></title>
<!-- Bootstrap -->
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
<script src="js/jquery_1.11.3_jquery.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="js/bootstrap.min.js"></script>
<!-- <link href="css/department.css" type="text/css" rel="stylesheet"> -->
</head>
<body>
	<!-- top nav -->
	<jsp:include page="top-navigation.jsp" />

	<!-- department info-->
	<c:forEach var="department" items="${departments }">
		<c:if test="${department.id == param.depId}">
			<!--jumbotron-->
			<div class="container ">
				<div class="page-header">
					<h3 style="color: #4094c7; font-weight: bold">
						${department.name} <small style="color: #4094c7">[${department.level}]</small>
					</h3>
					<h2 style="font-weight: bold">
						科室排班 <small style="color: gray; font-size: medium">(放号时间和可预约天数，请以医院为准)</small>
					</h2>
				</div>
			</div>

		</c:if>
	</c:forEach>

	<!-- action to find all doctors by hid and depId -->
	<s:action name="findDoctor" namespace="/">
		<s:param name="hid" value="#{param.hid}"></s:param>
		<s:param name="depId" value="#{param.depId}"></s:param>
	</s:action>

	<!-- doctor schedule information -->
	<div class="container">
		<table class="table table-bordered table-hover"
			style="table-layout: fixed">
			<thead>
			<colgroup>
				<col width='20%'>
				<col width='20%'>
				<col width='15%'>
				<col width='5%'>
				<col width='5%'>
				<col width='5%'>
				<col width='5%'>
				<col width='5%'>
				<col width='5%'>
				<col width='5%'>
				<col width='5%'>
				<col width='5%'>
			</colgroup>
			<tr class="table-head">
				<th>科室专家</th>
				<th>擅长</th>
				<th>医生服务</th>
				<th>
					<button type="button" class="btn btn-default"
						aria-label="Left Align">
						<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
					</button>
				</th>
				<th id="day" data-day-offset="0"></th>
				<th data-day-offset="1"></th>
				<th data-day-offset="2"></th>
				<th data-day-offset="3"></th>
				<th data-day-offset="4"></th>
				<th data-day-offset="5"></th>
				<th data-day-offset="6"></th>
				<th>
					<button type="button" class="btn btn-default"
						aria-label="Left Align">
						<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
					</button>
				</th>
			</tr>
			</thead>

			<script>
			    <!-- set days of table  -->
				function setOrderDate() {
					$('.table-head').find('th').each(function() {
						var _this = $(this);
						if (_this.attr('data-day-offset')) {
							var time=new Date();
							//must transform _this.attr('data-day-offset') to Number type
							time.setDate(time.getDate()+(Number)(_this.attr('data-day-offset')));
			
							//month
								var month=time.getMonth()+1;
								month=month<10?("0"+month):month;//add prefix zero
			
								//day
			 					var day=time.getDate();
			 					day=day<10?("0"+day):day;//add prefix zero
			
								//day of week
			 					var dayOfWeek_index=time.getDay();
			                   //(0,1,2,3,4,5,6)-->("周日","周一","周二","周三","周四","周五","周六")
			 					var dayOfWeek =new Array("周日","周一","周二","周三","周四","周五","周六");
								
							_this.text(month+"/"+day+" "+dayOfWeek[dayOfWeek_index]);
						}
					});
				};
				setOrderDate();						
			    </script>

			<tbody>
				<tr>
					<td class="text-center" colspan="12"
						style="color: #dd1144; font-size: small"><marquee>号源更新可能会有延迟，请选择该医生具体排班日期查看实时动态！</marquee>
					</td>
				</tr>

				<c:forEach var="doctor" items="${doctors }">

					<!--TODO:delete this test string  -->
					<!--<c:out value="${doctor.scheduling}"></c:out>  -->


					<tr class="am" data-doc-id="${doctor.id}"
						data-doc-name="${doctor.name}" data-doc-fee="${doctor.fee}">
						<td rowspan="2">${doctor.name}</td>
						<td rowspan="2">${doctor.introduction}</td>
						<td rowspan="2"></td>
						<td>上午</td>
						<!-- onmouseover="showScheduleTime('${doctor.scheduling}')" -->
						<td><a href="#" class="order-time" data-x="0"></a></td>
						<td><a href="#" class="order-time" data-x="1"></a></td>
						<td><a href="#" class="order-time" data-x="2"></a></td>
						<td><a href="#" class="order-time" data-x="3"></a></td>
						<td><a href="#" class="order-time" data-x="4"></a></td>
						<td><a href="#" class="order-time" data-x="5"></a></td>
						<td><a href="#" class="order-time" data-x="6"></a></td>
						<td></td>
					</tr>
					<tr class="pm" data-doc-id="${doctor.id}"
						data-doc-name="${doctor.name}" data-doc-fee="${doctor.fee}">
						<td>下午</td>
						<td><a href="#" class="order-time" data-x="0"></a></td>
						<td><a href="#" class="order-time" data-x="1"></a></td>
						<td><a href="#" class="order-time" data-x="2"></a></td>
						<td><a href="#" class="order-time" data-x="3"></a></td>
						<td><a href="#" class="order-time" data-x="4"></a></td>
						<td><a href="#" class="order-time" data-x="5"></a></td>
						<td><a href="#" class="order-time" data-x="6"></a></td>
						<td></td>
					</tr>

					<script>
					
					//find the index of dayOfWeek
					function getDayOfWeekIndex(dayOfWeek){
						var idx = 0;
						$('.table-head')
								.find('th')
								.each(function() {
											var _this = $(this);
											if(_this.attr('data-day-offset')){
												var dayValue= $(_this).text().split(" ")[1];
												if (dayValue==dayOfWeek) {													
													return false;//jump out all loop
												}else{
													idx++;
													return true;//jump out current loop,enter next loop
													}
												}
										});
						return idx;
					};

					//set order link
					function setSchedule(timePart,ticket,dayOfWeek){
						console.log(timePart+" "+ticket+" "+dayOfWeek);
												
						//confirm timePart is am or pm
						if(timePart.substr(0, 2)<=11){//am
							console.log("timePart: am");
							if(ticket>0){//has ticket

								//TODO:add judge timePart logic to isOverdue 
								console.log("ticket: "+ticket);
								 var data_x=getDayOfWeekIndex(dayOfWeek);
								 var hrefEle=$("tr[class='am'][data-doc-id='${doctor.id}']").find('.order-time[data-x='+data_x+']');
								 if(hrefEle.text().trim()==""){
									 //show order link
									 hrefEle.text("预约");
									 }
								 switch(timePart){
								 case '09:00-10:00':
									 hrefEle.attr("t09:00-10:00",ticket);
									 break;
								 case '10:00-11:00':
									 hrefEle.attr("t10:00-11:00",ticket);
									 break;
								 case '11:00-12:00':
									 hrefEle.attr("t11:00-12:00",ticket);
									 break;
								 }
								 							 	
// 								var tips[0][0]+=timePart+":剩"+ticket+"张票"+"\r\n";
								}else{
									//no ticket,don't show order link
									}
						}else{//pm
							console.log("timePart: pm");
							if(ticket>0){//has remaining ticket
								console.log("ticket: "+ticket);
								var data_x=getDayOfWeekIndex(dayOfWeek);
								var hrefEle2=$("tr[class='pm'][data-doc-id='${doctor.id}']").find('.order-time[data-x='+data_x+']');
								if(hrefEle2.text().trim()==""){
									//show order link
									hrefEle2.text("预约");
									}
								switch(timePart){
								 case '14:00-15:00':
									 hrefEle2.attr("t14:00-15:00",ticket);
									 break;
								 case '15:00-16:00':
									 hrefEle2.attr("t15:00-16:00",ticket);
									 break;
								 }
// 								hrefEle2.attr(timePart+"",ticket+"");	
// 								 hrefEle2.attr("data-time-periods",'{"'+timePart+'":"'+ticket+'"}');									
// 								var tips[1][0]+=timePart+":剩"+ticket+"张票"+"\r\n";
								}else{
									//no remaining ticket，don't show order link
									}
							};
						};
					
											
					function showOrder(scheduling){
// 						alert(scheduling);
				 		var part=scheduling.split(",");
				
				 		// a array to save order tips string
				        for(var i=0;i<part.length;i++){
				 			var arr=part[i].split(" ");
				 			var dayOfWeek=arr[0];
				 			var timePart=arr[1];
							var ticket=arr[2];

							setSchedule(timePart,ticket,dayOfWeek);
					        }                      
				 		};
			 		
					showOrder('${doctor.scheduling}');
					</script>
				</c:forEach>
			</tbody>
		</table>

		<!-- TODO:pagination -->
		<nav>
			<ul class="pagination pagination-lg">
				<li><a href="#" aria-label="Previous"> <span
						aria-hidden="true">&laquo;</span>
				</a></li>
				<li><a href="#">1</a></li>
				<li><a href="#">2</a></li>
				<li><a href="#">3</a></li>
				<li><a href="#">4</a></li>
				<li><a href="#">5</a></li>
				<li><a href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
				</a></li>
			</ul>
		</nav>

		<!-- Modal -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title " id="myModalLabel"
							style="font-weight: bold">选择预约时间段</h4>
					</div>
					<div class="modal-body">
						<div class="container">
							<!-- TODO: solve action path-->
							<form method="get" class="form-group" role="form">
								<!--show doctor info; current date; morning or afternoon -->
								<div class="order_pre_info">
									<label id="docId" class="hidden"></label> <span class="">医生：</span><label
										id="doc_name" class="text-info"></label><br /> <span>预约日期：</span><label
										id="visitTime" class="text-info"></label><br /> <span>挂号费：</span><label
										id="doc_fee" class="text-info"></label><span>元</span><br /> <span>时间：</span><label
										id="am_or_pm" class="text-info"></label>
								</div>
								<div class="btn-group-vertical " role="radiogroup">
									<hr />
									<div id="isAM">
										<h4 class="">上午</h4>
										<label class="radio-inline"> <input type="radio"
											name="inlineRadioOptions" id="inlineRadio1"
											value="09:00-10:00"> 9:00-10:00 剩余<span
											id="radio-period1"></span>
										</label> <label class="radio-inline"> <input type="radio"
											name="inlineRadioOptions" id="inlineRadio2"
											value="10:00-11:00"> 10:00-11:00 剩余<span
											id="radio-period2"></span>
										</label> <label class="radio-inline"> <input type="radio"
											name="inlineRadioOptions" id="inlineRadio3"
											value="11:00-12:00"> 11:00-12:00 剩余<span
											id="radio-period3"></span>
										</label>
										<hr />
									</div>

									<div id="isPM">
										<h4>下午</h4>
										<label class="radio-inline"> <input type="radio"
											name="inlineRadioOptions" id="inlineRadio4"
											value="14:00-15:00"> 14:00-15:00 剩余<span
											id="radio-period4"></span>
										</label> <label class="radio-inline"> <input type="radio"
											name="inlineRadioOptions" id="inlineRadio5"
											value="15:00-16:00"> 15:00-16:00 剩余<span
											id="radio-period5"></span>
										</label>
									</div>
								</div>
							</form>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
						<button type="button" class="btn btn-primary" id="submit-order">确定</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- script to toggle order dialog -->
	<script>
		//backdrop:static时,空白处不关闭.
		//keyboard:false时,esc键盘不关闭.
		var options = {
			backdrop : 'static',
			keyboard : false
		};
		$(document)
				.ready(
						function() {
							$(".order-time")
									.click(
											function() {
												//get doctor fee
												var docId = $(this).parent()
														.parent()
														.attr("data-doc-id");
												document.getElementById("docId").innerHTML = docId;
												
												//get doctor fee
												var doc_fee = $(this).parent()
														.parent()
														.attr("data-doc-fee");
												document.getElementById("doc_fee").innerHTML = doc_fee;
												
												//get doctor name
												var doc_name = $(this).parent()
														.parent()
														.attr("data-doc-name");
												document
														.getElementById("doc_name").innerHTML = doc_name;

												//get am or pm
												var am_pm = $(this).parent()
														.parent().attr("class");
												document
														.getElementById("am_or_pm").innerHTML = am_pm == "am" ? "上午"
														: "下午";

												if(am_pm=="am"){
													$("#isAM").css("display", "block");
													$("#isPM").css("display", "none");
													
													if($(this).attr('t09:00-10:00')!=null){
														document.getElementById("radio-period1").innerHTML=$(this).attr('t09:00-10:00');
														}else{
															$('input[id=inlineRadio1]').parent().css("display","none");
															}
													
													if($(this).attr('t10:00-11:00')!=null){
														document.getElementById("radio-period2").innerHTML=$(this).attr('t10:00-11:00');
													}else{
														$('input[id=inlineRadio2]').parent().css("display","none");
													}
													
													if($(this).attr('t11:00-12:00')!=null){
														document.getElementById("radio-period3").innerHTML=$(this).attr('t11:00-12:00');
													}else{
														$('input[id=inlineRadio3]').parent().css("display","none");
													}
																										
												}else{
													$("#isPM").css("display", "block");
													$("#isAM").css("display", "none");
													if($(this).attr('t14:00-15:00')!=null){
														document.getElementById("radio-period4").innerHTML=$(this).attr('t14:00-15:00');
													}else{
														$('input[id=inlineRadio4]').parent().css("display","none");
													}
													
													if($(this).attr('t15:00-16:00')!=null){
														document.getElementById("radio-period5").innerHTML=$(this).attr('t15:00-16:00');
													}else{
														$('input[id=inlineRadio5]').parent().css("display","none");
													}

												}

												//get date
												var data_x = $(this).attr(
														"data-x");

												function getOrderDate(index) {
													var ths = [];
													$('.table-head')
															.find('th')
															.each(
																	function() {
																		var _this = $(this);
																		if (_this
																				.attr('data-day-offset')) {
																			ths
																					.push(_this);
																		}
																	});
													return ths[index].text();
												}

												var date = getOrderDate(data_x);
												var fullYear = new Date().getFullYear();
												date = fullYear + "/" + date;
												document.getElementById("visitTime").innerHTML = date;

												//show modal
												$("#myModal").modal(options);

											});

 							$("#submit-order")
 									.click(
											function() {
                                                var docId=$("#docId").text();
												
												var time = $(".radio-inline input:radio:checked").val();
 												var visitTime = $("#visitTime").text()+" "+time;

 												/* alert("${user.userid}"+docId+"\n"+visitTime); */  												
 												if("${user!=null}"){
 												var turnForm = document.createElement("form");   
 												 //一定要加入到body中！！   
 												 document.body.appendChild(turnForm);
 												 turnForm.method = 'get';
 												 turnForm.action = 'confirmOrder'; 												 
 												 /*  turnForm.target = '_blank'; */
 												 //创建隐藏表单
 												var userIdArea = document.createElement("input");
 												    userIdArea.setAttribute("name","userId");
 												   userIdArea.setAttribute("id","userId");
 												  userIdArea.setAttribute("type","hidden");
 												 userIdArea.setAttribute("value","${user.userid}");
 											        turnForm.appendChild(userIdArea);
 											        
 	 											var docIdArea = document.createElement("input");
 	 											docIdArea.setAttribute("id","docId");
 	 											docIdArea.setAttribute("name","docId");
 	 											docIdArea.setAttribute("type","hidden");
 	 											docIdArea.setAttribute("value",docId);
  											        turnForm.appendChild(docIdArea);
  											        
	 	 										var visitTimeArea = document.createElement("input");
	 	 										visitTimeArea.setAttribute("id","visitTime");
	 	 										visitTimeArea.setAttribute("name","visitTime");
	 	 										visitTimeArea.setAttribute("type","hidden");
	 	 										visitTimeArea.setAttribute("value",visitTime);
											        turnForm.appendChild(visitTimeArea);
  											        												   												 
 												    turnForm.submit();
 												  
 												    
 												    
 												}else{
                                                       //jump to login.jsp
 	 												}

 												//hide modal
 											    $('#myModal').modal('hide');
												 											
 											 }); 
						});
	</script>
</body>
</html>