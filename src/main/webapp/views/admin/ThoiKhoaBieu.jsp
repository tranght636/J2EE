<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<div class="container-fluid">
	<!-- start list users -->

	<div class="div-select-filter">
		<select name="loaiThongBao" class="select-filter">
			<c:forEach var="Class" items="${dsClasses}">
				<option value="${Class.id}">${Class.name}</option>
			</c:forEach>
		</select>
	</div>
	<div>
		<form action="/jwat/xemlich" method="post">
			<div class="input-group md-form form-sm form-2 pl-0 "
				style="margin-bottom: 5px;">
				<div class="input-group-prepend">
					<span id="preWeek"
						class="btn input-group-text red lighten-3 backward span-ward"></span>
				</div>
				<input id="idInputWeek" type="week" name="weekSoanLich"
					style="width: 200px; height: 30px; border: 1px solid #999;" value="${weekinyear }" />
				<div class="input-group-append ">
					<span id="nextWeek"
						class="btn input-group-text red lighten-3 forward span-ward"></span>
				</div>

			</div>

		</form>
	</div>
	<table class="table table-striped table-bordered"
		style="text-align: center;">
		<thead>
			<tr>
				<th scope="col">Tuần</th>
				<th scope="col">Thứ 2</th>
				<th scope="col">Thứ 3</th>
				<th scope="col">Thứ 4</th>
				<th scope="col">Thứ 5</th>
				<th scope="col">Thứ 6</th>
				<th scope="col">Thứ 7</th>
				<th scope="col">chủ nhật</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th scope="col">Sáng</th>
				<th scope="col" data-toggle="modal" class="thSoanLich" buoi="s2"
					data-target="#exampleModalCenter">
				<c:if test='${not empty  mapSchedules.get("s2") }'>
					<span style="color: red;">${mapLesson.get(mapSchedules.get("s2").lesson_id).name}</span><br /> 
					(${mapSchedules.get("s2").sl}) <br />
					${mapSchedules.get("s2").name_room}<br />
					${mapSchedules.get("s2").getTrainer_name()}<br />
					${mapSchedules.get("s2").thoi_gian}
				</c:if> 
				</th>
				<th scope="col" data-toggle="modal" class="thSoanLich" buoi="s3"
					data-target="#exampleModalCenter">
					<c:if test='${not empty  mapSchedules.get("s3") }'>
					<span style="color: red;">${mapLesson.get(mapSchedules.get("s3").lesson_id).name}</span><br /> 
					(${mapSchedules.get("s3").sl}) <br />
					${mapSchedules.get("s3").name_room}<br />
					${mapSchedules.get("s3").getTrainer_name()}<br />
					${mapSchedules.get("s3").thoi_gian}
				</c:if> 
				</th>
				<th scope="col" data-toggle="modal" class="thSoanLich" buoi="s4"
					data-target="#exampleModalCenter">
				<c:if test='${not empty  mapSchedules.get("s4") }'>
					<span style="color: red;">${mapLesson.get(mapSchedules.get("s4").lesson_id).name}</span><br /> 
					(${mapSchedules.get("s4").sl}) <br />
					${mapSchedules.get("s4").name_room}<br />
					${mapSchedules.get("s4").getTrainer_name()}<br />
					${mapSchedules.get("s4").thoi_gian}
				</c:if> 	
				</th>
				<th scope="col" data-toggle="modal" class="thSoanLich" buoi="s5"
					data-target="#exampleModalCenter">
				<c:if test='${not empty  mapSchedules.get("s5") }'>
					<span style="color: red;">${mapLesson.get(mapSchedules.get("s5").lesson_id).name}</span><br /> 
					(${mapSchedules.get("s5").sl}) <br />
					${mapSchedules.get("s5").name_room}<br />
					${mapSchedules.get("s5").getTrainer_name()}<br />
					${mapSchedules.get("s5").thoi_gian}
				</c:if> 	
				</th>
				<th scope="col" data-toggle="modal" class="thSoanLich" buoi="s6"
					data-target="#exampleModalCenter">
				<c:if test='${not empty  mapSchedules.get("s6") }'>
					<span style="color: red;">${mapLesson.get(mapSchedules.get("s6").lesson_id).name}</span><br /> 
					(${mapSchedules.get("s6").sl}) <br />
					${mapSchedules.get("s6").name_room}<br />
					${mapSchedules.get("s6").getTrainer_name()}<br />
					${mapSchedules.get("s6").thoi_gian}
				</c:if> 	
				</th>
				<th scope="col" data-toggle="modal" class="thSoanLich" buoi="s7"
					data-target="#exampleModalCenter">
				<c:if test='${not empty  mapSchedules.get("s7") }'>
					<span style="color: red;">${mapLesson.get(mapSchedules.get("s7").lesson_id).name}</span><br /> 
					(${mapSchedules.get("s7").sl}) <br />
					${mapSchedules.get("s7").name_room}<br />
					${mapSchedules.get("s7").getTrainer_name()}<br />
					${mapSchedules.get("s7").thoi_gian}
				</c:if> 	
				</th>
				<th scope="col" data-toggle="modal" class="thSoanLich" buoi="s8"
					data-target="#exampleModalCenter">
				<c:if test='${not empty  mapSchedules.get("s8") }'>
					<span style="color: red;">${mapLesson.get(mapSchedules.get("s8").lesson_id).name}</span><br /> 
					(${mapSchedules.get("s8").sl}) <br />
					${mapSchedules.get("s8").name_room}<br />
					${mapSchedules.get("s8").getTrainer_name()}<br />
					${mapSchedules.get("s8").thoi_gian}
				</c:if> 
				</th>
			</tr>
			<tr>
				<th colspan="8"></th>
			</tr>
			<tr>
				<th scope="col">Chiều</th>
				<th scope="col" data-toggle="modal" class="thSoanLich" buoi="c2"
					data-target="#exampleModalCenter">
				<c:if test='${not empty  mapSchedules.get("c2") }'>
					<span style="color: red;">${mapLesson.get(mapSchedules.get("c2").lesson_id).name}</span><br /> 
					(${mapSchedules.get("c2").sl}) <br />
					${mapSchedules.get("c2").name_room}<br />
					${mapSchedules.get("c2").getTrainer_name()}<br />
					${mapSchedules.get("c2").thoi_gian}
				</c:if> 
				</th>
				<th scope="col" data-toggle="modal" class="thSoanLich" buoi="c3"
					data-target="#exampleModalCenter">
				<c:if test='${not empty  mapSchedules.get("c3") }'>
					<span style="color: red;">${mapLesson.get(mapSchedules.get("c3").lesson_id).name}</span><br /> 
					(${mapSchedules.get("c3").sl}) <br />
					${mapSchedules.get("c3").name_room}<br />
					${mapSchedules.get("c3").getTrainer_name()}<br />
					${mapSchedules.get("c3").thoi_gian}
				</c:if>
				</th>
				<th scope="col" data-toggle="modal" class="thSoanLich" buoi="c4"
					data-target="#exampleModalCenter">
				<c:if test='${not empty  mapSchedules.get("c4") }'>
					<span style="color: red;">${mapLesson.get(mapSchedules.get("c4").lesson_id).name}</span><br /> 
					(${mapSchedules.get("c4").sl}) <br />
					${mapSchedules.get("c4").name_room}<br />
					${mapSchedules.get("c4").getTrainer_name()}<br />
					${mapSchedules.get("c4").thoi_gian}
				</c:if>
				</th>
				<th scope="col" data-toggle="modal" class="thSoanLich" buoi="c5"
					data-target="#exampleModalCenter">
				<c:if test='${not empty  mapSchedules.get("c3") }'>
					<span style="color: red;">${mapLesson.get(mapSchedules.get("c5").lesson_id).name}</span><br /> 
					(${mapSchedules.get("c5").sl}) <br />
					${mapSchedules.get("c5").name_room}<br />
					${mapSchedules.get("c5").getTrainer_name()}<br />
					${mapSchedules.get("c5").thoi_gian}
				</c:if>
				</th>
				<th scope="col" data-toggle="modal" class="thSoanLich" buoi="c6"
					data-target="#exampleModalCenter">
				<c:if test='${not empty  mapSchedules.get("c6") }'>
					<span style="color: red;">${mapLesson.get(mapSchedules.get("c6").lesson_id).name}</span><br /> 
					(${mapSchedules.get("c6").sl}) <br />
					${mapSchedules.get("c6").name_room}<br />
					${mapSchedules.get("c6").getTrainer_name()}<br />
					${mapSchedules.get("c6").thoi_gian}
				</c:if>
				</th>
				<th scope="col" data-toggle="modal" class="thSoanLich" buoi="c7"
					data-target="#exampleModalCenter">
				<c:if test='${not empty  mapSchedules.get("c7") }'>
					<span style="color: red;">${mapLesson.get(mapSchedules.get("c7").lesson_id).name}</span><br /> 
					(${mapSchedules.get("c7").sl}) <br />
					${mapSchedules.get("c7").name_room}<br />
					${mapSchedules.get("c7").getTrainer_name()}<br />
					${mapSchedules.get("c7").thoi_gian}
				</c:if>
				</th>
				<th scope="col" data-toggle="modal" class="thSoanLich" buoi="c8"
					data-target="#exampleModalCenter">
				<c:if test='${not empty  mapSchedules.get("c8") }'>
					<span style="color: red;">${mapLesson.get(mapSchedules.get("c8").lesson_id).name}</span><br /> 
					(${mapSchedules.get("c8").sl}) <br />
					${mapSchedules.get("c8").name_room}<br />
					${mapSchedules.get("c8").getTrainer_name()}<br />
					${mapSchedules.get("c8").thoi_gian}
				</c:if>
				</th>
			</tr>
		</tbody>
	</table>
	
</div>

<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1"
	role="dialog" aria-labelledby="exampleModalCenterTitle"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">

		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>

			<form 
			<c:choose>
			  <c:when test="${not empty weekinyear}">
			  	action="/admin/soan-thoi-khoa-bieu?action=soanthoikhoabieu&weekinyear=${weekinyear}"
			  </c:when>
			  <c:otherwise>
			  	action="/admin/soan-thoi-khoa-bieu?action=soanthoikhoabieu "
			  </c:otherwise>
			</c:choose>
			 method="post">
				<input id="buoi" name="day" hidden/>
				<input id="week" name="week_in_year" hidden/>
				<div class="modal-body">
					<div class="card">
						<div class="card-body">
							<label class="mr-sm-2">Nội dung: </label> <select
								class="form-control mb-2 mr-sm-2" name="lesson_id" id="lesson_id">
								<c:forEach var="lesson" items="${lessons}">
									<option value="${lesson.id}">${lesson.name}</option>
								</c:forEach>
							</select> <label class="mr-sm-2">Số lượng: </label> <input name="sl"
								type="number" class="form-control mb-2 mr-sm-2"> <label
								class="mr-sm-2">Phòng: </label> <input name="name_room" type="text"
								class="form-control mb-2 mr-sm-2"> <label
								class="mr-sm-2">Trainer: </label> <input name="trainer_name"
								type="text" class="form-control mb-2 mr-sm-2"> <label
								class="mr-sm-2">Thời gian: </label> <input name="thoi_gian"
								type="text" class="form-control mb-2 mr-sm-2">
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button type="submit" class="btn btn-primary">Lưu</button>
				</div>
			</form>
		</div>

	</div>
</div>
<script src="<c:url value='/js/admin/ThoiKhoaBieu.js' />"></script>