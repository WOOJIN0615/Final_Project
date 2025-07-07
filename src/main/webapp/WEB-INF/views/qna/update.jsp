<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Q&A 글 수정</title>
    <!-- 공통 헤더 -->
    <c:import url="/WEB-INF/views/templates/header.jsp"/>
    <style>
        body.sb-nav-fixed {
            padding-top: 60px;    /* 탑바 높이 */
            padding-left: 240px;  /* 사이드바 너비 */
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f5f7fa;
            color: #333;
        }
        .container {
            max-width: 800px;
            margin: 40px auto;
            padding: 20px;
        }
        h2 {
            font-weight: 700;
            color: #2c3e50;
            margin-bottom: 20px;
        }
        form {
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }
        label {
            display: block;
            margin-bottom: 15px;
            font-weight: 600;
        }
        input[type="text"], input[type="password"], textarea {
            width: 100%;
            padding: 10px 12px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 15px;
            resize: vertical;
            transition: border-color 0.2s;
            box-sizing: border-box;
        }
        input:focus, textarea:focus {
            outline: none;
            border-color: #2663eb;
        }
        .checkbox-label {
            display: flex;
            align-items: center;
            font-weight: 600;
            gap: 8px;
            margin-bottom: 15px;
        }
        input[type="checkbox"] {
            width: 18px;
            height: 18px;
            cursor: pointer;
        }
        .buttons {
            margin-top: 25px;
            display: flex;
            gap: 12px;
            justify-content: flex-end;
        }
        button, a.button-link {
            background-color: #2663eb;
            color: white;
            padding: 10px 25px;
            border: none;
            border-radius: 6px;
            font-weight: 600;
            font-size: 14px;
            cursor: pointer;
            text-decoration: none;
            text-align: center;
            transition: background-color 0.2s;
        }
        button:hover, a.button-link:hover {
            background-color: #1d51bc;
        }
    </style>
</head>
<body class="sb-nav-fixed d-flex flex-column min-vh-100">
    <!-- 탑바 -->
    <c:import url="/WEB-INF/views/templates/topbar.jsp"/>
    <div id="layoutSidenav" class="d-flex flex-grow-1">
        <!-- 사이드바 -->
        <c:import url="/WEB-INF/views/templates/sidebar.jsp"/>
        <div id="layoutSidenav_content" class="d-flex flex-column flex-grow-1">
            <main class="flex-grow-1">
                <div class="container">
                    <h2>글 수정</h2>
                    <form action="${pageContext.request.contextPath}/qna/update" method="post">
                        <input type="hidden" name="boardNum" value="${qna.boardNum}" />

                        <label for="boardTitle">제목:</label>
                        <input type="text" id="boardTitle" name="boardTitle" value="${qna.boardTitle}" required />

                        <label for="boardContents">내용:</label>
                        <textarea id="boardContents" name="boardContents" rows="10" required>${qna.boardContents}</textarea>

                        <label class="checkbox-label">
                            <input type="checkbox" name="isSecret" value="true" <c:if test="${qna.isSecret}">checked</c:if> />
                            비밀글 설정
                        </label>

                        <label for="secretPassword">비밀번호 (비밀글일 경우 필수):</label>
                        <input type="password" id="secretPassword" name="secretPassword" value="${qna.secretPassword}" />

                        <div class="buttons">
                            <button type="submit">수정</button>
                            <a href="${pageContext.request.contextPath}/qna/detail/${qna.boardNum}" class="button-link">취소</a>
                        </div>
                    </form>
                </div>
            </main>
            <!-- 푸터 -->
            <c:import url="/WEB-INF/views/templates/footer.jsp"/>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
