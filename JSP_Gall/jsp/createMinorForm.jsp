<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	main {width: 960px; margin: 20px auto 0;}
	main > h2 { margin-bottom: 10px;}
	
	h2 a {cursor: pointer;}
	
	footer {
		padding-bottom: 50px;
		font-size: 12px;
	}
	footer > div:first-of-type {
		width: 1050px;
	    margin: 0px auto 0;
	    padding-top: 28px;
	    text-align: center;
	}
	footer > div a:before {
	    content: "";
	    display: inline-block;
	    width: 1px;
	    height: 11px;
	    margin: 0 10px;
	    vertical-align: -1px;
	    background: #d7d7d7;
	}
	footer > div a:first-child:before {
		display: none;
	}
	footer > div:last-of-type {
	    width: 1050px;
	    margin: 10px auto 0;
	    text-align: center;
	    letter-spacing: 0;
	    font-size: 12px;
	    font-family: tahoma,sans-serif;
	    color: #333;
	}
	
	.main_color {color: #d2af8a;}
	.sub_color {color: #585857;}
	.small {font-size: 13px; color: #999; font-weight: bold; margin-left: 6px;}
	
	.border {border-top: 2px #d2af8a solid; border-bottom: 2px #d2af8a solid;}
	.border > h2 {font-size: 23px; color: #d31900; margin-top: 41px; padding-left: 69px;}
	.border > p {font-size: 17px; color: #222; font-weight: bold; margin: 5px 0 33px; padding-left: 69px;}
	
	.info {
		width: 411px;
	    padding: 19px 22px;
	    margin: 34px 0 34px 69px;
	    background: #f3f3f3;
	    border-radius: 2px;
	    line-height: 20px;
	    color: #555;
	    font-size: 12px;
	    letter-spacing: -0.05em;
	}
	.info > div:last-of-type {margin-top: 12px;}
	.info button {
		text-decoration: underline;
	    color: #d31900;
	    border: none;
	    background: none;
    }
    
    .label {
    	width: 130px;
	    float: left;
	}
	.label span {
	    padding-left: 3px;
	    color: #d31900;
    }
    .label label {font-weight: bold;}
	
	.abs {
		position: absolute;
	    right: 9px;
	    top: 4px;
	    color: #d2af8a;
	    font-weight: bold;
	}
	
	.fl {float: left;}
    .fl p {color: #d31900; font-weight: normal;}
    .fl textarea {
	    width: 470px;
	    height: 54px;
	    padding: 7px;
	    border: 1px #bbb solid;
	    margin-bottom: 5px;
	    resize: none;
	    font-size: 12px;
	    font-family: -apple-system,BlinkMacSystemFont,"Apple SD Gothic Neo","Malgun Gothic","맑은 고딕",arial,Dotum,돋움,sans-serif;
    }
    .fl .bl {color: #555;}
    
    .fr {float: right;}
    
    .input_box {
	    position: relative;
	    display: inline-block;
    }
    
    .ex {
    	width: 241px;
    	opacity: 0.7;
    	margin-left: 10px;
    }
    .ex textarea {
	    width: 225px;
	    color: #999;
	    height: 54px;
	    padding: 7px;
	    border: 1px #bbb solid;
	    margin-bottom: 5px;
	    resize: none;
	    font-size: 12px;
	    font-family: -apple-system,BlinkMacSystemFont,"Apple SD Gothic Neo","Malgun Gothic","맑은 고딕",arial,Dotum,돋움,sans-serif;
    }
    .ex > span {
    	color: #555;
    }
    
    .tiptxt {
	    color: #555;
	    font-size: 12px;
    	margin-left: 3px;
	}
	
	.tip_deco_dot {
	    content: "";
	    display: inline-block;
	    width: 2px;
	    height: 2px;
	    background: #333;
	    font-size: 0;
	    vertical-align: 4px;
	    margin-right: 6px;
	}
	
	.btnbox {
	    margin: 42px 0 86px;
	    text-align: center;
	}
	.btnbox button {
		width: 100px;
		height: 40px;
	    border-width: 1px 1px 3px 1px;
	    border-style: solid;
	    border-radius: 2px;
	    font-size: 14px;
	    font-weight: bold;
	    color: #fff;
	}
    
    #left {
	    width: 726px;
	    padding: 12px 0 2px;
    	display: table-cell;
    	color: #555;
    	font-size: 12px;
    }
    #left > div {
    	padding: 13px 0 14px 16px;
	    border-top: 1px #eee solid;
	    color: #555;
	    position: relative;
    }
    #left > div::after {
	    clear: both;
	    display: block;
	    visibility: hidden;
	    content: "";
    }
    #left > div:first-of-type {border: none; padding-top: 2px;}
    #left input:not([type=file]) {
	    color: #555;
	    height: 22px;
	    line-height: 20px;
	    border: 1px #bbb solid;
	    margin-bottom: 5px;
	    font-size: 12px;
    }
    
    #right {
	    width: 288px;
	    padding: 14px 21px 2px 15px;
	    background: #f3f3f3;
    	display: table-cell;
    	vertical-align: top;
    	font-size: 12px;
    }
    #right p {
	    padding-top: 5px;
	    color: #d31900;
	    font-size: 12px;
    }
    
    #name {
	    width: 250px;
	    padding: 0 92px 0 7px;
    }
    
    #addr {
	    padding: 0 7px;
    }
    
    #why {
    	width: 428px;
    	padding: 0 7px;
    }
    
    #ex_name {
	    width: 140px;
	    color: #999;
	    padding: 0 92px 0 7px;
	    height: 22px;
	    border: 1px #bbb solid;
	    margin-bottom: 5px;
	    font-size: 12px;
    }
    
    #bot {
    	padding-top: 24px;
    }
    
    #cancel {
	    background: #b2b4b2;
	    border-color: #b2b4b2;
    }
    
    #make {
	    background: #d2af8a;
	    border-color: #d2af8a;
    }
</style>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
	$(function() {
		$("#name").on("keyup", function() {
			let content = $(this).val()
			$("#nn").text(content.length)
			if (content.length > 12) {
				$(this).val(content.substring(0, 12))
				$('#nn').text(12)
			}
	    });
		
		$("#desc").on("keyup", function() {
			let content = $(this).val()
			$("#dn").text(content.length)
			if (content.length > 200) {
				$(this).val(content.substring(0, 200))
				$('#dn').text(200)
			}
	    });
		
		$("#addr").on("keyup", function() {
			let content = $(this).val()
			$("#an").text(content.length)
			if (content.length > 20) {
				$(this).val(content.substring(0, 20))
				$('#an').text(20)
			}
	    });
		
		$("#why").on("keyup", function() {
			let content = $(this).val()
			$("#wn").text(content.length)
			if (content.length > 100) {
				$(this).val(content.substring(0, 100))
				$('#wn').text(100)
			}
	    });
	});
	
	function input_check() {
		let name = document.getElementById("name")
		let cate = document.getElementById("cate")
		let why = document.getElementById("why")
		
		if (!name.value) {
		    alert("이름을 입력하세요.")
		    name.focus()
		    return false
		}
		if (cate.value == 'null') {
		    alert("카테고리를 선택하세요.")
		    cate.focus()
		    return false
		}
		if (!why.value) {
		    alert("개설이유를 입력하세요.")
		    why.focus()
		    return false
		}
		
		document.create.submit()
	}
</script>
</head>
<body>
	<%@ include file="header.jsp" %>
	<main>
		<h2><a class=main_color><span class=sub_color>마이너 게시판</span> 만들기</a><span class=small>(만들기는 6개까지 가능합니다.)</span></h2>
		<div class=border>
			<h2>마이너 게시판은?</h2>
			<p>누구나 게시판을 개설할 수 있습니다. 게시판의 운영 권한 및 의무가 개설자에게 부여됩니다.</p>
			<div class=info>
				<div>
					<strong class="main_color">승격 안내</strong>
					<p>영화, 드라마 등 일부 마이너 게시판은 심사 후 메인 게시판으로 승격됩니다.</p>
					<p>승격 여부는 전적으로 회사에 의해 결정되며, 승격 시 매니저 권한은 회수됩니다.</p>
				</div>
				<div>
					<strong class="main_color">유의 사항</strong>
					<p>메인 게시판 승격을 위해서는 간결하고 정확한 단어형 이름을 입력하셔야 합니다.</p>
					<p>
						동일한 주제의 메인 게시판이 있을 경우 승격이 불가능합니다.
						<button type="button">자세히보기</button>
					</p>
				</div>
			</div>
			<form action=createMinor.jsp method=post id=create name=create enctype="multipart/form-data">
				<div class=border>
					<div id=left>
						<div>
							<div class=label><label for=name>이름<span>*</span></label></div>
							<div class=fl>
								<div class=input_box>
									<input id=name type=text name=name placeholder="마이너 게시판 이름을 간단히 넣어주세요.">
									<span class=abs>마이너 게시판</span>
								</div>
								<span id=nn>0</span>/<b>12</b>
								<p>※ 이름은 개설 후, 7일 내 1회만 수정할 수 있습니다.</p>
								<p>※ 동일한 주제의 마이너 게시판은 개설이 불가능합니다.</p>
							</div>
						</div>
						<div>
							<div class=label><label for=desc>설명</label></div>
							<div class=fl>
								<textarea id=desc name=desc placeholder="마이너 게시판에 대한 설명을 넣어주세요."></textarea>
								<div><span class=fr><span id=dn>0</span>/<b>200</b></span></div>
							</div>
						</div>
						<div>
							<div class=label><label for=image>대표 이미지</label></div>
							<div class=fl>
								<input id=image type=file name=image>
							</div>
						</div>
						<div>
							<div class=label><label for=cate>카테고리<span>*</span></label></div>
							<div class=fl>
								<select id=cate name=cate>
									<option value=null>카테고리를 선택해주세요.
									<option>게임
									<option>취미
									<option>스포츠
									<option>디지털/IT
								</select>
							</div>
						</div>
						<div>
							<div class=label><label for=why>개설이유<span>*</span></label></div>
							<div class=fl>
								<input id=why type=text name=why placeholder="운영자에게 전달되는 메세지입니다.">
								<span id=wn>0</span>/<b>100</b>
								<p class=bl>※ 마이너 게시판 개설은 이름, 설명, 주소, 개설 이유에 따라 승인 또는 반려될 수 있습니다.</p>
								<p class=bl>※ 개설 승인, 반려는 평일 정상근무 시간에 처리됩니다.</p>
							</div>
						</div>
					</div>
					<div id=right>
						<p class=fl>예시</p>
						<div class="fr ex">
							<div class=input_box>
								<input id=ex_name type=text value="백수" readonly="readonly">
								<span class=abs>마이너 게시판</span>
							</div>
							<textarea readonly="readonly">백수, 백조 모두 모두 모여요.</textarea>
							<span class=fr><span>17</span>/<b>200</b></span>
						</div>
					</div>
				</div>
			</form>
			<div id=bot>
				<p class="tiptxt">
					<em class="tip_deco_dot"></em>게시물의 관리 의무와 권리는 매니저(개설자)에게 있으며, 운영원칙을 위반한 경우 폐쇄 또는 매니저 해임이 될 수 있습니다.(음란물, 불량 게시물, 상업적 게시물, 댓글의 방치 등)
				</p>
			</div>
			<div class="btnbox">
				<button type="button" id="cancel" onclick="history.back()">취소</button>
				<button type="button" id="make" onclick=input_check()>만들기</button>
			</div>
		</div>
	</main>
	<footer>
	    <div>
	      <a href=>회사소개</a>
	      <a href=>제휴안내</a>
	      <a href=>광고안내</a>
	      <a href=>이용약관</a>
	      <a href=><b>개인정보처리방침</b></a>
	      <a href=>청소년보호정책</a>
	      <a href=>마이너 게시판 운영원칙</a>
	    </div>
	    <div>Copyright ⓒ 1999 - 2023 minami. All rights reserved.</div>
    </footer>
</body>
</html>