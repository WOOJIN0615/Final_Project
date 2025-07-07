<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>새 게시글 등록</title>
  <!-- 공통 헤더 -->
  <c:import url="/WEB-INF/views/templates/header.jsp"/>
  
  <!-- 게시글 등록 폼 전용 스타일 -->
  <style>
    body.sb-nav-fixed { margin:0; padding:0; }
    /* 전체 레이아웃 */
    body.sb-nav-fixed .container.mt-4,
    body.sb-nav-fixed .container.mt-4 .header,
    body.sb-nav-fixed .container.mt-4 form { box-sizing: border-box; }
    body.sb-nav-fixed {
      padding-top: 60px;    /* 탑바 높이와 맞추세요 */
      padding-left: 240px;  /* 사이드바 너비와 맞추세요 */
      background: linear-gradient(120deg, #eef3f7 0%, #f0e9f7 100%);
      color: #272a31;
      font-family: 'Pretendard', 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      min-height: 100vh;
    }
    .container.mt-4 {
      width: 100%; max-width: 540px;
      margin: 48px auto 0;
      background: #fff;
      border-radius: 18px;
      box-shadow: 0 8px 32px rgba(68,94,221,0.10), 0 1.5px 6px rgba(0,0,0,0.07);
      overflow: hidden;
      animation: fadeInUp 0.6s cubic-bezier(.19,1,.22,1);
    }
    @keyframes fadeInUp {
      from { transform: translateY(60px); opacity: 0; }
      to   { transform: translateY(0);    opacity: 1; }
    }
    .container.mt-4 .header {
      background: linear-gradient(90deg, #5575e7 0%, #7a60ee 100%);
      color: #fff;
      padding: 30px 0 22px;
      text-align: center;
      font-size: 26px;
      font-weight: 700;
      letter-spacing: -1px;
      border-bottom: 1.5px solid #f3f3f5;
    }
    .container.mt-4 form {
      padding: 36px 36px 28px 36px;
      background: #fff;
    }
    .form-group { margin-bottom: 23px; }
    .form-group label {
      display: block;
      margin-bottom: 9px;
      font-weight: 600;
      font-size: 15.5px;
      color: #1a194d;
      letter-spacing: -0.5px;
    }
    .form-group input[type="text"],
    .form-group select,
    .form-group textarea,
    .form-group input[type="password"] {
      width: 100%;
      padding: 13px 14px;
      border: 1.5px solid #e4e7ee;
      border-radius: 8px;
      font-size: 15px;
      background: #f8fafc;
      color: #22263c;
      outline: none;
      transition: border-color .18s, box-shadow .18s;
      box-sizing: border-box;
    }
    .form-group input:focus,
    .form-group select:focus,
    .form-group textarea:focus,
    .form-group input[type="password"]:focus {
      border-color: #5575e7;
      box-shadow: 0 2px 7px rgba(68,94,221,0.07);
    }
    .form-group textarea { min-height: 120px; resize: vertical; }
    .note {
      font-size: 13.5px;
      color: #959ab5;
      margin-top: 5px;
      font-style: italic;
    }
    #secretRow {
      display: none;
      background: #f5f8ff;
      padding: 18px 14px 10px;
      border-radius: 8px;
      border: 1.5px solid #e7eaf3;
      margin-top: 4px;
      box-shadow: 0 1px 4px rgba(85,117,231,0.05);
    }
    #secretRow label {
      font-weight: 600;
      color: #485087;
    }
    #secretRow input[type="checkbox"] {
      accent-color: #6e79ea;
      margin-right: 7px;
      transform: scale(1.13);
    }
    .actions {
      display: flex;
      justify-content: flex-end;
      gap: 13px;
      margin-top: 34px;
    }
    .btn-primary {
      padding: 11px 30px;
      background: linear-gradient(90deg, #5575e7 0%, #7a60ee 100%);
      color: #fff;
      font-weight: 600;
      border-radius: 7px;
      box-shadow: 0 2px 6px rgba(85,117,231,0.04);
      transition: background .15s, box-shadow .15s;
    }
    .btn-secondary {
      padding: 11px 30px;
      background: #e3e7f3;
      color: #48649c;
      font-weight: 600;
      border-radius: 7px;
      box-shadow: 0 2px 6px rgba(85,117,231,0.04);
      transition: background .15s, box-shadow .15s;
    }
    .btn-primary:hover {
      background: linear-gradient(90deg, #4261d8 0%, #5c4acc 100%);
      box-shadow: 0 3px 15px rgba(85,117,231,0.15);
    }
    .btn-secondary:hover { background: #cfd4e7; }
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
        <div class="container mt-4">
          <!-- 게시글 등록 폼 시작 -->
          <div class="container">
            <div class="header">
              <c:choose>
                <c:when test="${empty boardVO.boardNum}">새 게시글 등록</c:when>
                <c:otherwise>게시글 수정</c:otherwise>
              </c:choose>
            </div>
            <form action="<c:url value='/board/add'/>" method="post" enctype="multipart/form-data">
              <div class="form-group">
                <label for="title">제목</label>
                <input id="title" type="text" name="boardTitle" required placeholder="제목을 입력하세요" />
              </div>
              <div class="form-group">
                <label for="category">카테고리</label>
                <select id="categorySelect" name="category">
                  <option value="1">일반게시판</option>
                  <option value="2">Q&amp;A</option>
                </select>
              </div>
              <div class="form-group">
                <label for="content">내용</label>
                <textarea id="content" name="boardContents" rows="8" required placeholder="내용을 입력하세요"></textarea>
              </div>
              <div class="form-group">
                <label>첨부파일</label>
                <input type="file" name="files" multiple />
                <p class="note">최대 5개까지 업로드 가능합니다.</p>
              </div>
              <div class="form-group" id="secretRow">
                <label>
                  <input type="checkbox" name="isSecret" value="1" /> 비밀글로 등록
                </label>
                <input type="password" name="secretPassword" placeholder="비밀번호 입력(필수)" />
              </div>
              <div class="actions">
                <a href="<c:url value='/board/list'/>" class="btn-secondary">취소</a>
                <button type="submit" class="btn-primary">등록</button>
              </div>
            </form>
          </div>
          <!-- 게시글 등록 폼 끝 -->
        </div>
      </main>
      <!-- 푸터 -->
      <c:import url="/WEB-INF/views/templates/footer.jsp"/>
    </div>
  </div>
  <script>
    document.addEventListener('DOMContentLoaded', function(){
      var sel = document.getElementById('categorySelect');
      var secretRow = document.getElementById('secretRow');
      function toggleSecret() {
        secretRow.style.display = (sel.value === '2') ? 'block' : 'none';
      }
      toggleSecret();
      sel.addEventListener('change', toggleSecret);
    });
  </script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
