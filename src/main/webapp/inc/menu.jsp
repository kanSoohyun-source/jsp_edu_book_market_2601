<%@ page import="java.util.UUID" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav class="navbar navbar-expand badge-dark bg-dark">
  <div class="container">
    <div class="navbar-header">
      <a class="navbar-brand" href="../main/welcome.jsp">Home</a>
    </div>

    <div>
      <ul class="navbar-nav mr-auto">
        <%
          if (session.getAttribute("isAuth") != null) { // 로그인한 경우
            %>
            <li class="nav-item"><a class="nav-link" href="/member/logout">로그아웃</a></li>
            <li class="nav-item"><a class="nav-link" href="../member/modify_member.jsp">정보 수정</a></li>
            <%
          } else {
            %>
            <li class="nav-item"><a class="nav-link" href="../member/login.jsp">로그인</a></li>
            <li class="nav-item"><a class="nav-link" href="../member/add_member.jsp">회원 가입</a></li>
        <%
          }
        %>
        <li class="nav-item"><a class="nav-link" href="../Product/product_list.jsp">상품 목록</a></li>
        <li class="nav-item"><a class="nav-link" href="../admin/add_product.jsp">상품 등록</a></li>
        <li class="nav-item"><a class="nav-link" href="../admin/product_list.jsp">상품 수정</a></li>
        <li class="nav-item"><a class="nav-link" href="../order/cart.jsp">장바구니</a></li>
        <li class="nav-item"><a class="nav-link" href="../board/boardList.do">게시판</a></li>
      </ul>
    </div>
  </div>
</nav>