<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
</style>
<main>
	<div class="maindiv">
		<table id="hospital-list">
			<tbody>
				<c:forEach items="${list}" var="dto">
				<tr>
					<td><a href="/apa/search/pharmacyview.do?seq=${dto.pharmacyid}">
							<div class="hospital-info-list">
								<div class="hospital-name-dept">
									<h6>${dto.pharmacyname}</h6>
									<div class="hospital-info-grid"></div>
								</div>
								
    				    	<div class="hospital-name-dept">
								<c:if test="${dto.opentime eq '영업중'}">
    				    			<div class="listopentimeinmark"></div>								
								</c:if>
								<c:if test="${dto.opentime eq '영업종료'}">
									<div class="listopentimeoutmark"></div>															
								</c:if>
							<p class="listopentime">${dto.opentime}</p>
    				    	</div>	
								<p>${dto.pharmacyaddress}</p>
					</a>
						<div>
							<div class="hospital-info-grid">
								<c:if test="${dto.ispharmarcynightcare =='y' || dto.ispharmarcynightcare == 'Y'}">
									<p class="box-content box-content-color">야간진료</p>								
								</c:if>
								<c:if test="${dto.ispharmarcynightcare =='n' || dto.ispharmarcynightcare == 'N'}">
								<p class="box-content">야간진료</p>						
								</c:if>
								<c:if test="${dto.ispharmarcyholiday =='y' || dto.ispharmarcyholiday == 'Y'}">
								<p class="box-content box-content-color">휴일진료</p>						
								</c:if>
								<c:if test="${dto.ispharmarcyholiday =='n' || dto.ispharmarcyholiday == 'N'}">
								<p class="box-content">휴일진료</p>						
								</c:if>
							</div>
						</div>
						</div></td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</main>
<script>
	
</script>
