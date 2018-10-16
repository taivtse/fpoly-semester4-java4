<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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

<c:url value="/customer/login" var="customerLoginFormUrl" />
<c:url value="/customer/logout" var="customerLogoutFormUrl" />
<c:url value="/customer/register" var="customerRegisterFormUrl" />
<c:url value="/customer/update" var="customerUpdateInfoFormUrl" />
<c:url value="/customer/cart" var="customerCartUrl" />
<c:url value="/customer/cart/insert" var="customerCartInsertFormUrl" />
