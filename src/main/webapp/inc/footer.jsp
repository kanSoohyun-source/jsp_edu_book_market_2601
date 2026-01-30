<%@ page import="java.util.UUID" %>
<footer class="container">
    <p>&copy; WebMarket</p>
</footer>
<%
    Cookie[] cookies = request.getCookies();
    boolean isGuestId = false;
    for (Cookie cookie : cookies) {
        if (cookie.getName().equals("guestId")) {
            isGuestId = true;
        }
    }

    if (!isGuestId) {
        Cookie cookie = new Cookie("guestId", UUID.randomUUID().toString());
        response.addCookie(cookie);
    }
%>