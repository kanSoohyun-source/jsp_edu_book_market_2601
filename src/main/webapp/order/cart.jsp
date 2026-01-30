<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="org.example.jsp_edu_book_market_2601.DTO.Cart" %>
<%@ page import="java.util.List" %>
<%@ page import="org.example.jsp_edu_book_market_2601.DAO.ProductRepository" %>
<%@ page import="org.example.jsp_edu_book_market_2601.DTO.Product" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>장바구니</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
    <jsp:include page="../inc/menu.jsp"/>

    <div class="jumbotron">
        <div class="container">
            <h1 class="display-3">
                장바구니
            </h1>
        </div>
    </div>
    <div class="container">
        <div class="p-5">
            <div>
                <a href="./remove_cart_all_process.jsp" class="btn btn-danger"
                   id="btnRemoveAll">장바구니 비우기</a>
                <a href="#" class="btn btn-success">주문하기</a>
            </div>
            <div>
                <table class="table table-hover">
                  <tr>
                      <th>상품</th>
                      <th>가격</th>
                      <th>수량</th>
                      <th>소계</th>
                      <th>비고</th>
                  </tr>
                  <%
                      // 세션에 있는 carts에서 목록을 불러와서 반복문을 사용해서 출력
                      List<Cart> carts = (ArrayList<Cart>) session.getAttribute("carts");
                      if (carts == null) { // 생성된 목록이 없는 경우, 목록 생성 후 세션에 저장
                          carts = new ArrayList<>();
                          session.setAttribute("carts",carts);
                      }

                      int sum = 0;
                      ProductRepository productRepository = ProductRepository.getInstance();
                      for (Cart cart : carts) {
                          Product product = productRepository.getProductByID(cart.getProductId());
                          int total = product.getUnitPrice() * cart.getCartCnt();
                          sum += total;
                  %>

                  <tr>
                      <td>
                          <input type="checkbox" name="checkProduct" value="<%=cart.getProductId()%>">
                      </td>
                      <td>
                          <a href="../Product/product.jsp?productId=<%=product.getProductId()%>"
                             style="text-decoration: none; color: black;">
                              <%=product.getProductName()%>
                          </a>
                      </td>
                      <td><%=String.format("%,d", product.getUnitPrice())%></td>
                      <td><%=cart.getCartCnt()%></td>
                      <td><%=String.format("%,d", total)%></td>
                      <td><a href="./remove_cart_process.jsp?productId=<%=cart.getProductId()%>"
                             class="badge badge-danger">삭제</a></td>
                  </tr>

                <%
                    }
                %>
                    <th></th>
                    <th></th>
                    <th>총액</th>
                    <th><%=String.format("%, d", sum)%></th>
                    <th></th>
                </table>
            </div>
        </div>
        <hr>
    </div>
    <jsp:include page="../inc/footer.jsp"/>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        const btnRemoveAll = document.querySelector('#btnRemoveAll')

        btnRemoveAll.addEventListener('click', function (e) {
            e.preventDefault()
            if (confirm('정말 삭제하시겠습니까?')) {
                location.href = './remove_cart_all_process.jsp'
            }
        })
    })

    const frm = document.querySelector('form[name=frmCart]')
    frm.querySelector('input[name=chkAll]').addEventListener('click', function (e) {
        const tags = frm.querySelectorAll("input[name=checkProduct]")
        console.log(tags)
        tags.forEach(function (item) {
            item.ckecked = e.targrt.ckecked
        })
    })
</script>

</body>
</html>
