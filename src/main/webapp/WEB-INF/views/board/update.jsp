<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>게시글 수정</title>
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
            max-width: 600px;
            margin: 60px auto;
            background: #fff;
            border-radius: 12px;
            box-shadow: 0 2px 14px rgba(0,0,0,.09);
            padding: 40px 32px 32px 32px;
        }
        h2 {
            margin-bottom: 22px;
            color: #20307a;
        }
        label {
            display: block;
            margin-top: 22px;
            margin-bottom: 8px;
            font-weight: 500;
        }
        input[type="text"], textarea {
            width: 100%;
            padding: 12px;
            border: 1px solid #d4d4e0;
            border-radius: 6px;
            font-size: 15px;
            background: #fafbfe;
            transition: border 0.2s;
            box-sizing: border-box;
        }
        input[type="text"]:focus, textarea:focus {
            border: 1.2px solid #2663eb;
            outline: none;
        }
        textarea {
            height: 160px;
            resize: vertical;
        }
        label.checkbox-label {
            display: flex;
            align-items: center;
            gap: 8px;
            font-weight: 600;
            margin-top: 18px;
            margin-bottom: 8px;
        }
        .info {
            color: #888;
            font-size: 13px;
            margin-top: 4px;
        }
        .button-row {
            margin-top: 32px;
            text-align: right;
        }
        button, a.cancel-btn {
            background: #2663eb;
            color: #fff;
            border: none;
            border-radius: 5px;
            padding: 10px 30px;
            font-size: 15px;
            margin-left: 8px;
            cursor: pointer;
            font-weight: 500;
            box-shadow: 0 1px 3px rgba(38,99,235,0.07);
            transition: background 0.18s;
            text-decoration: none;
            display: inline-block;
        }
        button:hover, a.cancel-btn:hover {
            background: #1d51bc;
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
                    <h2>게시글 수정</h2>
                    <form action="${pageContext.request.contextPath}/board/update" method="post" enctype="multipart/form-data">
                        <input type="hidden" name="boardNum" value="${board.boardNum}" />
                        <label for="boardTitle">제목</label>
                        <input type="text" id="boardTitle" name="boardTitle" value="${board.boardTitle}" required />

                        <label for="boardContents">내용</label>
                        <textarea id="boardContents" name="boardContents" required>${board.boardContents}</textarea>

                        <label for="category">카테고리</label>
                        <select id="category" name="category" required>
                            <option value="" disabled>-- 선택하세요 --</option>
                            <option value="1" <c:if test="${board.category == 1}">selected</c:if>>자유게시판</option>
                            <option value="2" <c:if test="${board.category == 2}">selected</c:if>>QnA</option>
                        </select>
                        <div class="info">선택 필수</div>

                        <label for="files">첨부파일 (선택, 여러 개 가능)</label>
                        <input type="file" name="files" id="files" multiple />
                        <div class="info">기존 파일은 유지됩니다.</div>

                        <label class="checkbox-label">
                            <input type="checkbox" name="isSecret" value="true" <c:if test="${board.isSecret}">checked</c:if> /> 비밀글 설정
                        </label>
                        <div class="info">비밀글일 경우 비밀번호 입력</div>
                        <input type="password" name="secretPassword" placeholder="비밀번호" value="${board.secretPassword}" />

                        <div class="button-row">
                            <button type="submit">수정</button>
                            <a href="${pageContext.request.contextPath}/board/detail?boardNum=${board.boardNum}" class="cancel-btn">취소</a>
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
