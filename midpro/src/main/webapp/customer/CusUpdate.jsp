

<%@page import="Vo.CustomerVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"> <!-- 문자 인코딩을 UTF-8로 설정 -->
    <title>DGV</title> <!-- 문서 제목 -->
    <style>
        /* 전체 화면 사이즈 */
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

        div {
            border: 2px solid black; /* 모든 div 요소에 검은색 테두리 추가 */
        }

        /* 회사소개 */
        #company {
            height: 150px; /* 회사 정보 영역의 높이 설정 */
            color: white;
            margin: 0; /* 기본 여백 제거 */
            margin-top: 50px; /* 위쪽 여백 */
            text-align: center;
            overflow: hidden; /* 내용이 잘리도록 설정 */
            position: absolute; /* 절대 위치 설정 */
            transform: translateX(100%);
		}

        /* 개인정보수정 */
		.container {
		    max-width: 800px;
		    margin: 0 auto;
		    background-color: black;
		    padding: 20px;
		    border-radius: 8px;
		    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            border: 1px dashed white;
		}
		
		.page-title {
		    font-size: 1.8rem;
		    color: white;
		    display: flex;
            justify-content: center; /* 중앙 정렬 */
            align-items: center; /* 세로 중앙 정렬 */
            gap: 10px;
            margin-top: 40px;
		}
		
		.page-description {
		    font-size: 1rem;
		    color: white;
		    margin-bottom: 20px;
		}
		
		.profile-section {
		    margin-bottom: 20px;
		    border-bottom: 1px solid #ccc;
		    padding-bottom: 20px;
		}
		
		.profile-table {
		    width: 100%;
		    border-collapse: collapse;
            color: white;
		}
		
		.profile-table th {
		    text-align: left;
		    width: 150px;
		    font-weight: bold;
		    color: white;
		    padding: 10px 0;
		}
		
		.profile-table td {
		    padding: 10px 0;
		    vertical-align: middle;
		}
		
		.profile-photo {
		    display: flex;
		    align-items: center;
		    gap: 10px;
		}
		
		.profile-img {
		    width: 80px;
		    height: 80px;
		    border-radius: 50%;
		    border: 1px solid #ccc;
		}
		
		.profile-btn {
		    padding: 8px 12px;
		    background-color: #007bff;
		    color: #fff;
		    border: none;
		    border-radius: 4px;
		    cursor: pointer;
		}
		
		.photo-note {
		    font-size: 0.9rem;
		    color: #c7c3c3;
		}
		
		.section-title {
		    font-size: 1.5rem;
		    color: white;
		    margin: 20px 0;
		}
		
		.info-table {
		    width: 100%;
		    border-collapse: collapse;
		    margin-top: 10px;
		}
		
		.info-table th {
		    text-align: left;
		    font-weight: bold;
		    color: white;
		    width: 150px;
		    padding: 10px 0;
		}
		
		.info-table td {
		    padding: 10px 0;
		}
		
		.input-field {
		    width: calc(100% - 160px);
		    padding: 8px;
		    border: 1px solid #ccc;
		    border-radius: 4px;
		    font-size: 1rem;
		}
		
		.change-btn {
		    padding: 6px 10px;
		    background-color: #007bff;
		    color: #fff;
		    border: none;
		    border-radius: 4px;
		    cursor: pointer;
		    margin-left: 10px;
		}
		
		.note {
		    font-size: 0.9rem;
		    color: #c7c3c3;
		    margin-left: 10px;
		}
		
		.button-container {
            display: flex;
            justify-content: center; /* 중앙 정렬 */
            align-items: center; /* 세로 중앙 정렬 */
            gap: 10px;
            margin-top: 20px;
        }

        .secondary-btn {
            padding: 10px 20px;
            background-color: transparent;
            border: 2px solid white;
            color: white;
            border-radius: 4px;
            cursor: pointer;
            font-size: 1rem;
        }

        .primary-btn {
            padding: 10px 20px;
            background-color: white;
            border: none;
            color: black;
            border-radius: 4px;
            cursor: pointer;
            font-size: 1rem;
        }
    </style>
</head>

<body>
    <div>
        <%@ include file="/main/Top.jsp" %>
    </div>
    <h1 class="page-title">개인정보 수정</h1>
    <div class="container">
        <p class="page-description">회원님의 정보를 정확히 입력해주세요.</p>

        <!-- Profile Section -->
        <div class="profile-section">
            <table class="profile-table">
                <tr>
                    <th>프로필 사진</th>
                    <td>
                        <div class="profile-photo">
                            <img src="default-profile.png" alt="프로필 사진" class="profile-img">
                            <button class="profile-btn">이미지 등록</button>
                            <span class="photo-note">※ 개인정보가 포함된 이미지는 등록을 자제하여 주시기 바랍니다.</span>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th>아이디</th>
                    <td><%=result.getCustomer_id() %></td>
                </tr>
            </table>
        </div>

        <!-- Basic Information Section -->
        <h2 class="section-title">기본정보</h2>
        <table class="info-table">
            <tr>
                <th>이름 *</th>
                <td>
                    <input type="text" id="name" name="name" value="<%=result.getCust_name() %>" required><button>변경하기</button>
                    <br>
                    <span class="note">※ 개명으로 이름이 변경된 경우, 회원정보의 이름을 변경하실 수 있습니다.</span>
                </td>
            </tr>
            <tr>
                <th>아이디 *</th>
                <td>
                    <input type="text" id="customer_id" name="customer_id" value="<%=result.getCustomer_id() %>" required><button>변경하기</button>
                </td>
            </tr>
            <tr>
                <th>생년월일 *</th>
                <td>
                <input type="text" id="birthdate" name="birthdate" value="<%=result.getCust_add() %>" required><button>변경하기</button>
                </td>
            </tr>
            <tr>
                <th>휴대폰 *</th>
                <td>
                    <input type="tel" id="phone" name="phone" required><button>변경하기</button>
                </td>
            </tr>
            <tr>
                <th>이메일 *</th>
                <td>
                    <input type="email" id="email" name="email" value="<%=result.getCust_email() %>" required><button>변경하기</button>
                </td>
            </tr>
            <tr>
                <th>비밀번호 *</th>
                <td>
                    <input type="password" id="password" name="password" required><button>변경하기</button>
                </td>
            </tr>
        </table>
        
    </div>
    <!-- Buttons Section -->
    <div class="button-container">
        <button class="secondary-btn">취소</button>
        <button class="primary-btn">등록</button>
    </div>
</body>
</html>

    <!-- 회사 정보 영역 -->
    <%@ include file="/main/Bottom.jsp" %>
</body>
<script>
</script>
</html>