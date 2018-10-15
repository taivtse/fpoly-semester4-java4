<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value = "vi-VN"/>

<c:url value="/resource/image/" var="imageRootUrl" />

<c:url value="/template/admin/" var="adminTemplateUrl" />
<c:url value="/template/customer/" var="customerTemplateUrl" />

<c:url value="/admin/login" var="adminLoginFormUrl" />
<c:url value="/admin/logout" var="adminLogoutFormUrl" />
<c:url value="/admin/product/insert" var="productInsertFormUrl" />
<c:url value="/admin/product/update" var="productUpdateFormUrl" />
<c:url value="/admin/user/insert" var="userInsertFormUrl" />
<c:url value="/admin/user/update" var="userUpdateFormUrl" />

<c:url value="/user/login" var="customerLoginFormUrl" />
<c:url value="/user/logout" var="customerLogoutFormUrl" />
<c:url value="/user/register" var="customerRegisterFormUrl" />
<c:url value="/user/update" var="customerUpdateInfoFormUrl" />
<c:url value="/user/cart" var="customerCartUrl" />