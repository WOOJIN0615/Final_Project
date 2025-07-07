<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>게시글 삭제</title>
    <!-- 공통 헤더 -->
    <c:import url="/WEB-INF/views/templates/header.jsp"/>
    <style>
        body.sb-nav-fixed {
            padding-top: 60px;    /* 탑바 높이 */
            padding-left: 240px;  /* 사이드바 너비 */
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f7f7fb;
            margin: 0;
        }
        .container {
            max-width: 400px;
            margin: 100px auto;
            background: #fff;
            border-radius: 12px;
            box-shadow: 0 2px 14px rgba(0,0,0,.09);
            padding: 38px 30px 32px 30px;
            text-align: center;
        }
        h2 {
            color: #c62828;
            margin-bottom: 18px;
        }
        p {
            margin-bottom: 36px;
            color: #222;
            font-size: 16px;
        }
        .button-row {
            text-align: center;
        }
        button, .cancel-btn {
            background: #d32f2f;
            color: #fff;
            border: none;
            border-radius: 5px;
            padding: 10px 38px;
            font-size: 15px;
            margin: 0 8px;
            cursor: pointer;
            font-weight: 500;
            box-shadow: 0 1px 3px rgba(211,47,47,0.10);
            transition: background 0.16s;
            text-decoration: none;
        }
        button:hover {
            background: #9b2020;
        }
        .cancel-btn {
            background: #aeb3c1;
        }
        .cancel-btn:hover {
            background: #7b7f8a;
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
                    <h2>게시글 삭제</h2>
                    <p>정말 이 게시글을<br><b style="color:#c62828;">삭제</b> 하시겠습니까?</p>
                    <form action="${pageContext.request.contextPath}/board/delete" method="post" style="display:inline;">
                        <input type="hidden" name="boardNum" value="${param.boardNum}" />
                        <div class="button-row">
                            <button type="submit">삭제</button>
                            <a href="${pageContext.request.contextPath}/board/detail?boardNum=${param.boardNum}" class="cancel-btn">취소</a>
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
