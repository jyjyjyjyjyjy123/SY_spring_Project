<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<style>

</style>


<main>
	<div class="maindiv">
		<div id="deptList">
			<c:forEach items="${deptlist}" var="dto">
				<c:if test="${dto.departmentseq+0 >= 9}">
					<div id="tag${dto.departmentseq}" class="dept-tag dept-hide-tag btn custom-btn"
						onclick="seldept(${dto.departmentseq})">${dto.departmentname}</div>
				</c:if>
				<c:if test="${dto.departmentseq+0 <= 8}">
					<div id="tag${dto.departmentseq}" class="dept-tag btn custom-btn"
						onclick="seldept(${dto.departmentseq})">${dto.departmentname}</div>
				</c:if>
			</c:forEach>
		</div>
		<hr>
		<div class="more-button-div">
			<input type="button" class="deptlist-button more-button" value="진료과 더보기">
		</div>
		<hr>
		<div id="tagList">
			<c:forEach items="${symtomlist}" var="dto">
				<c:if test="${dto.selfsymtomseq+0 >= 25}">
					<div class="tag hide-tag btn custom-btn"
						onclick="selSystom(${dto.selfsymtomseq})">${dto.selfsymtomname}</div>
				</c:if>
				<c:if test="${dto.selfsymtomseq+0 <= 24}">
					<div class="tag btn custom-btn"
						onclick="selSystom(${dto.selfsymtomseq})">${dto.selfsymtomname}</div>
				</c:if>
			</c:forEach>
		</div>
		<hr>
		<div class="more-button-div">
			<input type="button" class="taglist-button more-button" value="증상 더보기">
			
		</div>
		
		<hr>
		<table id="hospital-list">
			<tbody>
				
			</tbody>
		</table>
	</div>
</main>
<script>
	var lists = [];
	var seqlist = [0,0,0,0,0,0,0,0];
	var count = 0;
	var onoff = false;
	var deptlist = [];
	var dept = 0;
	var deptcount = 0;
	document.getElementById('tag1').click();
	function seldept(deptseq) {
		if (deptlist[0] == null){
			deptlist[0] = event.target;
		} else {
			deptlist[0] = deptlist[1];			
		}
		deptlist[1] = event.target;
    	var tag = document.getElementsByClassName("tag");
    	var depttag = document.getElementsByClassName("dept-tag");
		if (event.target.classList.contains("clicked")) {
    		event.target.classList.remove("clicked");
    		dept=0;
        } else {
		    dept = deptseq;
		    deptlist[0].classList.remove("clicked");
	    	event.target.classList.add("clicked");
        }
		for (var i = 0; i < lists.length; i++) {
			lists[i].classList.remove("clicked");			
		}
	    seqlist = [0,0,0,0,0,0,0,0];
	    count = 0;
	    onoff = false;
		load(seqlist,deptseq);
	}
    function selSystom(seq) {
    	var tag = document.getElementsByClassName("tag");
    	var depttag = document.getElementsByClassName("dept-tag");
    	if (event.target.classList.contains("clicked")) {
    		event.target.classList.remove("clicked");
        	count--;	
        } else {
        	if (count >= 8) {
	    		count = 0;
	        	lists[count].classList.remove("clicked");
        	    lists[count] = event.target;
        	    seqlist[count] = seq;
	        	lists[count].classList.add("clicked");
	        	onoff = true;
        	} else {
        		if (onoff) {          	    			
	        		lists[count].classList.remove("clicked");      	    			
	        	    lists[count] = event.target;
        	    	seqlist[count] = seq;
		        	lists[count].classList.add("clicked");
        	    } else {
        	    	lists[count] = event.target;
        	    	seqlist[count] = seq;
		        	lists[count].classList.add("clicked");
        		}
        	}
    	}
    	if (deptlist[1] != null){
        	deptlist[1].classList.remove("clicked");	
		}
    	load(seqlist,'0');
       	count++;
	}
	function load(seqlist,deptseq) {
    	let obj = {
        	seq1 : seqlist[0],
    		seq2 : seqlist[1],
			seq3 : seqlist[2],
			seq4 : seqlist[3],
			seq5 : seqlist[4],
			seq6 : seqlist[5],
			seq7 : seqlist[6],
			seq8 : seqlist[7],
    		deptseq : deptseq
		};
        		

     	$.ajax({
 			type: 'POST',
 			url: '/apa/search/tagfind',
 			headers: {'Content-Type': 'application/json'},
			beforeSend : function(xhr){
				xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}');
			},
 			data: JSON.stringify(obj),
 			dataType: 'json',
 			success: function(result) {
 				$('#hospital-list tbody').html('');
 				$(result).each((index, item) => {
						let obj2={hospitalid:item.hospitalid};
						deptcount++;
 						let temp = `
 								<tr>
 									<td>
   								<a href="/apa/search/view.do?seq=\${item.hospitalid}&loginuserseq=${loginuserseq}">
   								<div class="hospital-info-list">
   								<div class="hospital-name-dept">
    								<h4 style="color : #000000;">\${item.hospitalname}</h4>
    								<div class="hospital-info-grid">
    								`;
    								$(item.deptlist).each((index, item) => {
    									temp+=`<p class="box-content dept-box-content">\${item.departmentname}</p>`;
    								});
    				    	temp += `</div>
    				    		</div>`;
    				    	if (item.opentime == "영업중") {
    				    		temp += `<div class="hospital-name-dept">
    				    			<div class="listopentimeinmark"></div>`;								
							} else {
								temp += `<div class="hospital-name-dept">
									<div class="listopentimeoutmark"></div>`;															
							}
    				    	temp += `	
								<p class="listopentime">\${item.opentime}</p>
    				    	</div>	
    				    	<p>\${item.hospitaladdress}</p>
			    				</a>
    				                <div >
	    				                	<div class="hospital-info-grid">
	    				                	`;
	    				                	if (item.face == 'y' || item.face == 'Y'){
	    				                		temp+=`
					    							<p class="box-content box-content-color">대면</p>
					    							`;
	    				                	}
	    				                	if (item.face == 'n' || item.face == 'N'){
	    				                		temp+=`
					    							<p class="box-content">대면</p>
					    							`;
	    				                	}
	    				                	if (item.unface == 'y' || item.unface == 'Y'){
	    				                		temp+=`
					    							<p class="box-content box-content-color">비대면</p>
					    							`;
	    				                	}
	    				                	if (item.unface == 'n' || item.unface == 'N'){
	    				                		temp+=`
					    							<p class="box-content">비대면</p>
					    							`;
	    				                	}
	    				                	if (item.housecall == 'y' || item.housecall == 'Y'){
	    				                		temp+=`
					    							<p class="box-content box-content-color">왕진</p>
					    							`;
	    				                	}
	    				                	if (item.housecall == 'n' || item.housecall == 'N'){
	    				                		temp+=`
					    							<p class="box-content">왕진</p>
					    							`;
	    				                	}
	    				                	if (item.ishealthcheck == 'y' || item.ishealthcheck == 'Y'){
	    				                		temp+=`
					    							<p class="box-content box-content-color">건강검진</p>
					    							`;
	    				                	}
	    				                	if (item.ishealthcheck == 'n' || item.ishealthcheck == 'N'){
	    				                		temp+=`
					    							<p class="box-content">건강검진</p>
					    							`;
	    				                	}
	    				                	if (item.vaccination == 'y' || item.vaccination == 'Y'){
	    				                		temp+=`
					    							<p class="box-content box-content-color">예방접종</p>
					    							`;
	    				                	}
	    				                	if (item.vaccination == 'n' || item.vaccination == 'N'){
	    				                		temp+=`
					    							<p class="box-content">예방접종</p>
					    							`;
	    				                	}
	    				                	if (item.ishospitalnightcare == 'y' || item.ishospitalnightcare == 'Y'){
	    				                		temp+=`
					    							<p class="box-content box-content-color">야간진료</p>
					    							`;
	    				                	}
	    				                	if (item.ishospitalnightcare == 'n' || item.ishospitalnightcare == 'N'){
	    				                		temp+=`
					    							<p class="box-content">야간진료</p>
					    							`;
	    				                	}
	    				                	if (item.ishospitalholiday == 'y' || item.ishospitalholiday == 'Y'){
	    				                		temp+=`
					    							<p class="box-content box-content-color">휴일진료</p>
					    							`;
	    				                	}
	    				                	if (item.ishospitalholiday == 'n' || item.ishospitalholiday == 'N'){
	    				                		temp+=`
					    							<p class="box-content">휴일진료</p>
					    							`;
	    				                	}
			    							temp+=`
			    							</div>
    				                </div>
    							</div>
 									</td>
 								</tr>
 								`;
			    	    $('#hospital-list tbody').append(temp);							
 					});
 				},
 				error: function(a,b,c) {
 					console.log(a,b,c);
 				}
 			});
}
        	
        	$(".taglist-button").click(function() {
    			if ($(".hide-tag").is(":visible")){
    				$(".hide-tag").slideUp();
    				$(".taglist-button").val("증상 더보기");    				
    			} else {
    				$(".hide-tag").slideDown();
    				$(".taglist-button").val("증상 숨기기");    				
    				$(".tag").css('display','inline');
    			}
    		});
        	$(".deptlist-button").click(function() {
    			if ($(".dept-hide-tag").is(":visible")){
    				$(".dept-hide-tag").slideUp();
    				$(".deptlist-button").val("진료과 더보기");    				
    			} else {
    				$(".dept-hide-tag").slideDown();
    				$(".deptlist-button").val("진료과 숨기기");    				
    				$(".dept-tag").css('display','inline');
    			}
    		});
        	
</script>
