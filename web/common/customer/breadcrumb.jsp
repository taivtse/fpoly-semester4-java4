<div class="bstore-breadcrumb">
    <a href="/">Trang chủ</a>
    <c:forEach var="item" items="${requestScope.breadcrumb}">
    <span><i class="fa fa-caret-right"></i></span>
    <span>${item}</span>
    </c:forEach>
</div>