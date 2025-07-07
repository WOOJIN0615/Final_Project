<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Q&A 글쓰기</title>
    <!-- 공통 헤더 -->
    <c:import url="/WEB-INF/views/templates/header.jsp"/>
    <style>
        body.sb-nav-fixed {
            padding-top: 60px;    /* 탑바 높이 */
            padding-left: 240px;  /* 사이드바 너비 */
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f9fafc;
            color: #333;
        }
        .container {
            max-width: 700px;
            margin: 40px auto;
            background: #fff;
            padding: 30px 40px;
            border-radius: 8px;
            box-shadow: 0 4px 14px rgb(0 0 0 / 0.1);
        }
        h2 {
            font-weight: 700;
            color: #1a202c;
            margin-bottom: 24px;
            font-size: 2rem;
            text-align: center;
        }
        form label {
            display: block;
            margin-bottom: 12px;
            font-weight: 600;
            color: #2d3748;
        }
        input[type="text"],
        input[type="password"],
        textarea {
            width: 100%;
            padding: 12px 14px;
            border: 1px solid #cbd5e0;
            border-radius: 6px;
            font-size: 1rem;
            background: #f7fafc;
            transition: border-color 0.2s ease;
            box-sizing: border-box;
        }
        input:focus,
        textarea:focus {
            outline: none;
            border-color: #3182ce;
            background: #fff;
        }
        textarea {
            resize: vertical;
            min-height: 140px;
        }
        .checkbox-label {
            display: flex;
            align-items: center;
            gap: 10px;
            font-weight: 600;
            margin-top: 16px;
            margin-bottom: 24px;
            color: #2d3748;
        }
        .btn-row {
            display: flex;
            justify-content: flex-end;
            gap: 16px;
        }
        .btn,
        .cancel-btn {
            padding: 12px 30px;
            border-radius: 6px;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            border: none;
            box-shadow: 0 2px 8px rgb(50 100 230 / 0.4);
            transition: background-color 0.3s ease;
            text-decoration: none;
        }
        .btn {
            background-color: #2b6cb0;
            color: #fff;
        }
        .btn:hover {
            background-color: #2c5282;
        }
        .cancel-btn {
            background-color: #718096;
            color: #fff;
            display: inline-flex;
            align-items: center;
            justify-content: center;
        }
        .cancel-btn:hover {
            background-color: #4a5568;
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
                    <h2>글쓰기</h2>
                    <form action="${pageContext.request.contextPath}/qna/add" method="post">
                        <label for="boardTitle">제목</label>
                        <input type="text" id="boardTitle" name="boardTitle" required />

                        <label for="boardContents">내용</label>
                        <textarea id="boardContents" name="boardContents" required></textarea>

                        <label class="checkbox-label">
                            <input type="checkbox" name="isSecret" value="true" />
                            비밀글 설정
                        </label>

                        <label for="secretPassword">비밀번호 (비밀글일 경우 필수)</label>
                        <input type="password" id="secretPassword" name="secretPassword" />

                        <div class="btn-row">
                            <button type="submit" class="btn">등록</button>
                            <a href="${pageContext.request.contextPath}/qna/list" class="cancel-btn">취소</a>
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
