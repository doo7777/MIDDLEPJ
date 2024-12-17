<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>영화 요금 테이블</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <h1>영화 요금 테이블</h1>
    <table>
        <thead>
            <tr>
                <th>영화 제목</th>
                <th>상영 시간</th>
                <th>좌석 종류</th>
                <th>가격 (원)</th>
                <th>할인 정보</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>영화 A</td>
                <td>14:00</td>
                <td>일반석</td>
                <td>10,000</td>
                <td>학생 할인 20%</td>
            </tr>
            <tr>
                <td>영화 A</td>
                <td>14:00</td>
                <td>프리미엄석</td>
                <td>15,000</td>
                <td>없음</td>
            </tr>
            <tr>
                <td>영화 B</td>
                <td>16:00</td>
                <td>VIP석</td>
                <td>20,000</td>
                <td>조조 할인 30%</td>
            </tr>
            <tr>
                <td>영화 C</td>
                <td>18:00</td>
                <td>일반석</td>
                <td>10,000</td>
                <td>없음</td>
            </tr>
        </tbody>
    </table>
</body>
</html>