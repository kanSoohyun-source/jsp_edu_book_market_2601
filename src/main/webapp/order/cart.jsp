<%@ page import="java.util.ArrayList" %>
<%@ page import="org.example.jsp_edu_book_market_2601.DTO.Cart" %>
<%@ page import="java.util.List" %>
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
                  <%@include file="../inc/dbconn.jsp"%>
                  <%
                      String memberId = (String) session.getAttribute("sessionMemberId");
                      String guestId = session.getId();
                      String sql = null;


                      PreparedStatement preparedStatement = null;
                      ResultSet resultSet = null;
                      List<Cart> carts = new ArrayList<>();

                      if (memberId != null) {
                          sql = "SELECT * FROM cart WHERE member_id = ?";
                      } else {
                          sql = "SELECT * FROM cart WHERE guest_id = ?";
                      }

                      try {
                          preparedStatement = connection.prepareStatement(sql);
                          preparedStatement.setString(1, (memberId != null ? memberId : guestId));
                          resultSet = preparedStatement.executeQuery();
                          while (resultSet.next()) {
                              Cart cart = Cart.builder()
                                      .productId(resultSet.getString("product_id"))
                                      .cartCnt(resultSet.getInt("cart_cnt")).build();
                              carts.add(cart);
                          }
                      } catch (SQLException e) {
                          throw new RuntimeException();
                      }

                      int sum = 0;
                      Product product = null;
                      for (Cart cart : carts) {
                          sql = "SELECT * FROM product WHERE product_id = ?";
                          try {
                              preparedStatement = connection.prepareStatement(sql);
                              preparedStatement.setString(1, cart.getProductId());
                              resultSet = preparedStatement.executeQuery();
                              while (resultSet.next()) {
                                  product = Product.builder().
                                          productId(resultSet.getString("product_id")).
                                          productName(resultSet.getString("product_name")).
                                          description(resultSet.getString("description")).
                                          unitPrice(Integer.parseInt(resultSet.getString("unit_price"))).
                                          manufacturer(resultSet.getString("manufacturer")).
                                          category(resultSet.getString("category")).
                                          unitsInStock(Integer.parseInt(resultSet.getString("unitsIn_stock"))).
                                          condition(resultSet.getString("condition"))
                                          .build();
                              }
                          } catch (SQLException e) {
                              throw new RuntimeException();
                          }
                          int total = product.getUnitPrice() * cart.getCartCnt();
                          sum += total;
                  %>

                  <tr>
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
    <%@include file="/inc/footer.jsp"%>
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
