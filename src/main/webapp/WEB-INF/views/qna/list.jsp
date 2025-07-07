<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="fontawesome-i2svg-active fontawesome-i2svg-complete">
<head>
<meta charset="UTF-8" />
<title>Q&A 게시판</title>
<c:import url="/WEB-INF/views/templates/header.jsp"></c:import>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
<style>
    .qna-container {
        max-width: 900px;
        margin: 40px auto;
    }
    .qna-header {
        margin-bottom: 24px;
        display: flex;
        justify-content: space-between;
        align-items: center;
    }
    .qna-header h2 {
        color: #1a202c;
        font-weight: 700;
        font-size: 2rem;
        margin: 0;
    }
    .btn-group {
        display: flex;
        gap: 10px;
    }
    .btn-home, .btn-write {
        background-color: #2b6cb0;
        color: white;
        font-weight: 600;
        padding: 8px 20px;
        border-radius: 6px;
        text-decoration: none;
        box-shadow: 0 2px 8px rgba(43,108,176,0.4);
        transition: background-color 0.3s ease;
        cursor: pointer;
        display: inline-block;
    }
    .btn-home {
        background-color: #718096;
        box-shadow: 0 2px 8px rgba(113,128,150,0.4);
    }
    .btn-home:hover {
        background-color: #4a5568;
        color: white;
        text-decoration: none;
    }
    .btn-write:hover {
        background-color: #1d4f9c;
        color: white;
        text-decoration: none;
    }
    ul.qna-list {
        list-style: none;
        padding: 0;
        margin: 0;
        background: #fff;
        border-radius: 8px;
        box-shadow: 0 4px 12px rgb(0 0 0 / 0.1);
        padding: 20px 30px;
    }
    li.qna-item {
        border-bottom: 1px solid #e2e8f0;
        padding: 16px 0;
        cursor: default;
        position: relative;
    }
    li.qna-item:last-child {
        border-bottom: none;
    }
    .qna-main {
        display: flex;
        justify-content: space-between;
        align-items: center;
        font-weight: 600;
        font-size: 1rem;
    }
    .qna-title-wrapper {
        display: flex;
        align-items: center;
    }
    .qna-title {
        color: #2b6cb0;
        text-decoration: none;
    }
    .qna-title:hover {
        text-decoration: underline;
    }
    .qna-secret {
        color: #e53e3e;
        margin-left: 8px;
    }
    .qna-info {
        font-size: 0.85rem;
        color: #718096;
        margin-top: 6px;
    }
    .btn-reply {
        font-size: 0.85rem;
        cursor: pointer;
        color: #4a5568;
        background: none;
        border: none;
        padding: 2px 6px;
        border-radius: 4px;
        transition: background-color 0.2s;
    }
    .btn-reply:hover {
        background-color: #e2e8f0;
    }
    /* 답글 표시 */
    .reply-indicator {
        color: #718096;
        margin-right: 8px;
    }
    /* 답글 폼 스타일 */
    form.reply-form {
        margin-top: 12px;
        padding: 12px 16px;
        border-radius: 6px;
        background-color: #f7fafc;
        border: 1px solid #cbd5e0;
        max-width: 600px;
        font-size: 0.9rem;
    }
    form.reply-form input[type="text"],
    form.reply-form textarea {
        width: 100%;
        border-radius: 4px;
        border: 1px solid #ccc;
        padding: 6px 8px;
        font-size: 14px;
        margin-bottom: 6px;
    }
    form.reply-form textarea {
        height: 50px;
        resize: vertical;
    }
    form.reply-form input[type="password"] {
        width: 100%;
        border-radius: 4px;
        border: 1px solid #ccc;
        padding: 6px 8px;
        font-size: 14px;
        margin-bottom: 6px;
    }
    form.reply-form label {
        font-weight: 600;
        display: block;
        margin-bottom: 4px;
    }
    form.reply-form button {
        background-color: #2b6cb0;
        color: white;
        border: none;
        padding: 6px 16px;
        font-weight: 600;
        border-radius: 4px;
        cursor: pointer;
        transition: background-color 0.2s;
        float: right;
    }
    form.reply-form button:hover {
        background-color: #1d4f9c;
    }
    .checkbox-label {
        display: flex;
        align-items: center;
        gap: 5px;
        margin-bottom: 10px;
    }
    .checkbox-label input[type="checkbox"] {
        margin: 0;
    }
</style>

<script>
function toggleReplyForm(id) {
    var form = document.getElementById('reply-form-' + id);
    if (form.style.display === 'block') {
        form.style.display = 'none';
    } else {
        // 모든 답글폼 닫기
        document.querySelectorAll('form.reply-form').forEach(f => f.style.display = 'none');
        form.style.display = 'block';
    }
}
</script>

</head>
<body class="sb-nav-fixed d-flex flex-column min-vh-100">
<c:import url="/WEB-INF/views/templates/topbar.jsp"></c:import>
<div id="layoutSidenav" class="d-flex flex-grow-1">
    <c:import url="/WEB-INF/views/templates/sidebar.jsp"></c:import>
    <div id="layoutSidenav_content" class="d-flex flex-column flex-grow-1">
        <main class="flex-grow-1">
            <div class="container-fluid">
                <div class="qna-container">
                    <div class="qna-header">
                        <h2>Q&A 게시판</h2>
                        <div class="btn-group">
                            <a href="${pageContext.request.contextPath}/" class="btn-home">
                                <i class="fas fa-home"></i> 홈
                            </a>
                            <a href="${pageContext.request.contextPath}/qna/add" class="btn-write">
                                <i class="fas fa-pen"></i> 글쓰기
                            </a>
                        </div>
                    </div>

                    <ul class="qna-list">
                        <c:forEach var="qna" items="${list}">
                            <li class="qna-item" style="margin-left: ${qna.boardDepth * 30}px;">
                                <div class="qna-main">
                                    <div class="qna-title-wrapper">
                                        <c:if test="${qna.boardDepth > 0}">
                                            <span class="reply-indicator">└ RE:</span>
                                        </c:if>
                                        <a href="${pageContext.request.contextPath}/qna/detail?boardNum=${qna.boardNum}" class="qna-title">
                                            <c:out value="${qna.boardTitle}" />
                                        </a>
                                        <c:if test="${qna.isSecret}">
                                            <span class="qna-secret">🔒</span>
                                        </c:if>
                                    </div>

                                    <button class="btn-reply" type="button" onclick="toggleReplyForm(${qna.boardNum})">
                                        <i class="fas fa-reply"></i> 답글쓰기
                                    </button>
                                </div>
                                <div class="qna-info">
                                    작성자: ${qna.userName} | 작성일: ${qna.boardDate}
                                </div>

                                <!-- 답글 폼 (숨김 상태로 초기화) -->
                                <form class="reply-form" id="reply-form-${qna.boardNum}" method="post" action="${pageContext.request.contextPath}/qna/reply" style="display:none;">
                                    <!-- boardRef 설정 -->
                                    <c:choose>
                                        <c:when test="${qna.boardRef == 0 || qna.boardRef == null || qna.boardRef == qna.boardNum}">
                                            <input type="hidden" name="boardRef" value="${qna.boardNum}" />
                                        </c:when>
                                        <c:otherwise>
                                            <input type="hidden" name="boardRef" value="${qna.boardRef}" />
                                        </c:otherwise>
                                    </c:choose>
                                    
                                    <input type="hidden" name="boardStep" value="${qna.boardStep}" />
                                    <input type="hidden" name="boardDepth" value="${qna.boardDepth}" />

                                    <label for="reply-title-${qna.boardNum}">제목</label>
                                    <input type="text" id="reply-title-${qna.boardNum}" name="boardTitle" 
                                           value="RE: ${qna.boardTitle}" required />

                                    <label for="reply-content-${qna.boardNum}">답글 내용</label>
                                    <textarea id="reply-content-${qna.boardNum}" name="boardContents" 
                                              placeholder="답글 내용을 입력하세요" required></textarea>

                                    <label class="checkbox-label">
                                        <input type="checkbox" name="isSecret" value="1" />
                                        비밀글 설정
                                    </label>

                                    <label for="reply-password-${qna.boardNum}">비밀번호 (비밀글일 경우 필수)</label>
                                    <input type="password" id="reply-password-${qna.boardNum}" name="secretPassword" />

                                    <button type="submit">등록</button>
                                    <div style="clear: both;"></div>
                                </form>
                            </li>
                        </c:forEach>
                        
                        <c:if test="${empty list}">
                            <li class="qna-item" style="text-align: center; padding: 50px 0; color: #999;">
                                <i class="fas fa-info-circle"></i> 등록된 Q&A가 없습니다.
                            </li>
                        </c:if>
                    </ul>
                </div>
            </div>
        </main>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>