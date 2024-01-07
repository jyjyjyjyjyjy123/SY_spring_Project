<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
        h1 {
            margin-top: 40px;
            font-size: 40px;
            text-align: center;
        }
        #list {
            width: 80%;
            border-collapse: collapse;
            margin: 0 auto;
            margin-bottom: 20px;
            margin-top: 20px;
        }
        #list, th, td {
            border: 1px solid black;
            padding: 10px;
            text-align: left;
            font-size: 1.1rem;
        }
        th {
            background-color: #edf0f7;
            width: 12%;
        }

		#list tr:nth-child(1) th:nth-child(1) {
			width: 40%;
		}

		#list tr:nth-child(1) th {
			text-align:center;
		}
		
		#list > tbody > tr > td {
			text-align:	center;
			background-color: white;
		}

		#list > tbody > tr > td:nth-child(1) {
			text-align: left;
		}
		
        #btn, #btn2 {
            text-align: center;
            border: 0;
        	display: flex;
        	margin: 0 auto;
            font-size: 1.2rem;
            background: #edf0f7;
            color: #858796;
            padding: 10px;
            cursor: pointer;
            border-radius: 10px;
            width: 100px;
            justify-content: center
        }
	  	
	  	#btn:hover, #btn2:hover {
			background-color: #dddfeb;
		}     
        
        #btn-box {
        	width: 80%;
        	margin: 0 auto;
        }
        
        label {
	        line-height: 50px;
		    width: 100%;
		    height: 50px;
        }
        
        #box-20 {
        	height: 20px;
        }
        
        .resultList > div > img {
        	width: 100px;
        }
        
        .resultList {
        	display: flex;
        	align-items: center;
        	justify-content: space-evenly;
        	font-size: 1.3rem;
        	margin-bottom: 20px;
        	padding-top: 10px;
        	padding-bottom: 10px;
        }

        #resultScore {
        	background-color: #6c757d2b;
        }
        
        .resultList > div:nth-child(3) {
        	width: 1000px;
        }
        
        
</style>

<h1 class="sub" id="self-test-title"></h1>

	<input type="hidden" name="seq" value="${seq}">
	<table id="list">
		<thead>
			<tr>
				<th>문항</th>
			</tr>
		</thead>
		<tbody>
		</tbody>
	</table>
	<div id="box-20"></div>
	<div id="btn-box">
		<input id="btn" type="button" value="결과 보기" onclick="submit(${tseq});">
	</div>
	
	<div id="box-20"></div>
	<div id="box-20"></div>
	
	<div id="score">
	</div>
	<div id="result">
		
	</div>
	<div id="save">
		
	</div>
<div id="box-20"></div>
<div id="box-20"></div>

<script>
	
	var mediTestSeq = ${tseq}	
	var userSeq = '${seq}'	
	
	loadTest(${tseq});
	loadAnswer(${tseq});
	
	//alert(${seq});
	
	function loadTest(seq) {
		
		$.ajax({
			type: 'GET',
			url: '/apa/api/user/' + seq + '/selftest',
			beforeSend : function(xhr) {
                xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}');
            },
			dataType: 'json',
			success: list => {
				$(list).each((index, item) => {
					
					var test = '';
					for (var i=0; i<item.meditestAnswerNo.length; i++) {
						test += `<td><label><input type="radio" name="q\${item.meditestQuestionNo}" value="\${item.meditestAnswerNo[i]}"/></label></td>`;
					}
					
					$('#list > tbody').append(`
						<tr>
							<td>\${item.meditestQuestionNo}. \${item.meditestContent}</td>
							\${test}
						</tr>
					`);
					
				});
			},
			error: (a,b,c) => {
				console.log(a,b,c);
			}
		});		
		
	}
	
	function loadAnswer(seq) {
		
		$.ajax({
			type: 'GET',
			url: '/apa/api/user/' + seq + '/selftest/answercontent',
			beforeSend : function(xhr) {
                xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}');
            },
			dataType: 'json',
			success: list => {
				var answer = '';
				$(list).each((index, item) => {
					
					answer += `<th>\${item.meditestAnswerContent}</th>`;
					
					
				});
				$('#list > thead > tr > th').after(`
					\${answer}
				`);
			},
			error: (a,b,c) => {
				console.log(a,b,c);
			}
		});		
	}
	
	let totalValue = 0;
	let oldValue = {};

	$(document).on('change', 'input[type=radio]', function() {
	    let name = $(this).attr('name');
	    let value = parseInt($(this).val());

	    if(oldValue[name]) {
	        totalValue -= oldValue[name];
	    }

	    totalValue += value;

	    oldValue[name] = value;
	    
	    //console.log(totalValue);

	});
	
	function validateForm() {
	    var isValid = true;
	    $('input[type="radio"]').each(function() {
	        if($('input[name="' + $(this).attr('name') + '"]:checked').length == 0) {
	            isValid = false;
	        }
	    });
	    return isValid;
	}	
	
	function submit(seq) {
		
	    if (!validateForm()) {
	        alert('모든 항목을 선택해주세요.');
	        return;
	    }
		
		$('#score').append(`
			<div class="resultList">
				당신의 점수: \${totalValue}점
			</div>
		`);

		$('#save').append(`
			<input id="btn2" type="button" value="결과 저장" onclick="saveResult(\${totalValue});">
		`);
		
		$.ajax({
			type: 'GET',
			url: '/apa/api/user/' + seq + '/selftest/result',
			beforeSend : function(xhr) {
                xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}');
            },
			dataType: 'json',
			success: list => {
				
				$(list).each((index, item) => {
					
					var html = parseInt(item.minScore) <= `\${totalValue}` && parseInt(item.maxScore) >= `\${totalValue}` 
					? `<div class="resultList" id="resultScore">
					   <div><img src="/apa/resources/images/icons/result\${item.num}.png"></div><div>\${item.minScore} ~ \${item.maxScore}점</div><div>\${item.meditestResultContent}</div>
					   </div>`
					: `<div class="resultList">
					   <div><img src="/apa/resources/images/icons/result\${item.num}.png"></div><div>\${item.minScore} ~ \${item.maxScore}점</div><div>\${item.meditestResultContent}</div>
					   </div>`
					
					
					$('#result').append(`
						\${html}
					`);
					
				});
			},
			error: (a,b,c) => {
				console.log(a,b,c);
			}
		});
		
	    var resultScroll = document.querySelector('#score');
	    resultScroll.scrollIntoView({behavior: "smooth"});
		
	    var button = document.querySelector('#btn');
	    button.removeAttribute('onclick');
	}
	
	function saveResult(totalValue) {
		
		if (userSeq == '-1') {
			alert("비회원은 저장하실 수 없습니다.")
			return;
		}
		
		let obj = {
				meditestSeq: mediTestSeq,
				userSeq: userSeq,
				meditestTotalScore: totalValue
		};
		
		$.ajax({
			type: 'POST',
			url: '/apa/api/user/selftest/save',
			headers: {'Content-Type': 'application/json'},
			beforeSend : function(xhr) {
                xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}');
            },
			data: JSON.stringify(obj),
			dataType: 'json',
			success: result => {
				if (result == 1) {
					alert('성공적으로 저장하였습니다. 저장된 결과는 마이페이지에서 확인하실 수 있습니다.');				
				} else {
					alert('failed');
				}
			},
			error: (a,b,c) => {
				console.log(a,b,c);
			}
		});		
	}	
	
</script>