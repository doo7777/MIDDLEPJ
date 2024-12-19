<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
	    #main {
	            position: relative;
	            left: 2px;
	    }
	
	   body {
	       margin: 0;
	       width: 100%;
	       overflow-x: hidden;
	       background: black;
	   }
	   
        
    	.cardWrap {
        width: 27em;
        margin: 3em auto;
        color: #fff;
        padding-bottom: 200px; /* #company의 높이보다 조금 더 큰 여백을 추가 */
        }

        .card {
        background: linear-gradient(to bottom, #e84c3d 0%, #e84c3d 26%, #ecedef 26%, #ecedef 100%);
        height: 12em;
        float: left;
        position: relative;
        padding: 1em;
        margin-top: 10px;
        }

        .cardLeft {
        border-top-left-radius: 8px;
        border-bottom-left-radius: 8px;
        width: 16em;
        }

        .cardRight {
        width: 6.5em;
        border-left: .18em dashed black;
        border-top-right-radius: 8px;
        border-bottom-right-radius: 8px;
        &:before,
        &:after {
            content: "";
            position: absolute;
            display: block;
            width: .9em;
            height: .9em;
            background: black;
            border-radius: 50%;
            left: -.5em;
        }
        &:before {
            top: -.4em;
        }
        &:after {
        bottom: -.4em;
        }
        }

        h1 {
        font-size: 1.1em;
        margin-top: 0;
        span {
            font-weight: normal;
        }
        }

        .title, .name, .seat, .time {
        text-transform: uppercase;
        font-weight: normal;
        h2 {
            font-size: .9em;
            color: #525252;
            margin: 0;
        }
        span {
            font-size: .7em;
            color: #a2aeae;
        }
        }

        .title {
        margin: 2em 0 0 0;
        border: hidden;
        }

        .name, .seat {
        margin: .7em 0 0 0;
        border: hidden;
        }

        .time {
        margin: .7em 0 0 1em;
        border: hidden;
        }

        .seat, .time {
        float: left;
        border: hidden;
        }


        .number {
        text-align: center;
        text-transform: uppercase;
        border: hidden;
            h3 {
                color: #e84c3d;
                margin: .9em 0 0 0;
                font-size: 2.5em;
            }
            span {
                display: block;
                color: #a2aeae;
            }
        }   
        
        #done {
        	text-align: center;
        	color: white;
        }
       
    </style>
</head>
<body>
	<%@ include file="/main/Top.jsp" %>
    <div class="cardWrap">
        <div class="card cardLeft">
	        <h1>DGV <span>Cinema</span></h1>
	        <div class="title">
	            <h2>모아나2</h2>
	            <span>영화</span>
	        </div>
	        <div class="name">
	            <h2>홍길동</h2>
	            <span>이름</span>
	        </div>
	        <div class="seat">
	            <h2>402</h2>
	            <span>좌석</span>
	        </div>
	        <div class="time">
	            <h2>09:00</h2>
	            <span>시간</span>
	        </div>
        </div>
        <div class="card cardRight">
        <div class="number">
            <h3>402</h3>
            <span>좌석</span>
        </div>
        </div>
    </div>
    <h2 id="done">예매가 완료되었습니다.</h2>
    <%@ include file="/main/Bottom.jsp" %>
</body>
</html>