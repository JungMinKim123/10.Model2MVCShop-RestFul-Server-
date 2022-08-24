<%-- 
<%@page import="java.util.List"%>
<%@page import="com.model2.mvc.common.Search"%>
<%@page import="com.model2.mvc.service.domain.*"%>
<%@page import="com.model2.mvc.common.Page"%>
--%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%-- 
<%
	List<Purchase> list = (List<Purchase>)request.getAttribute("list");
	Search searchVO=(Search)request.getAttribute("searchVO");
	Page resultPage = (Page)request.getAttribute("resultPage");
%>
--%>
<html>
<head>
<title>���� �����ȸ</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
	function fncGetUserList(currentPage) {
		$("#currentPage").val(currentPage)
		$("form").attr("method", "POST").attr("action", "/purchase/listPurchase").submit();
	}
	
	$(function() {
		$(".ct_list_pop td:nth-child(1)").bind("click", function() {
			console.log($(this).text().trim());
			self.location = "/purchase/getPurchase?tranNo="+$(this).text().trim();
		});
		
		$(".ct_list_pop td:nth-child(3)").bind("click", function() {
			console.log($(this).text().trim());
			self.location = "/user/getUser?userId="+$(this).text().trim();
		});
		
		$("input[name='arrival']").bind("click", function() {
			console.log("asdfe");
			self.location = "/purchase/updateTranCode?prodNo="+$(this).parent().parent().attr("id")+"&tranCode=3";
		});
		
	});

</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width: 98%; margin-left: 10px;">

<form name="detailForm">

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"width="15" height="37"></td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">���� �����ȸ</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"	width="12" height="37"></td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 10px;">
	<tr>
		<td colspan="11">��ü ${ resultPage.totalCount } �Ǽ�, ���� ${ resultPage.currentPage } ������</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">ȸ��ID</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">ȸ����</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">��ȭ��ȣ</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">�����Ȳ</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">��������</td>
	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>
	<%-- 
	<%
	int no = list.size();
			for(int i=0; i<list.size(); i++){
		Purchase vo = (Purchase)list.get(i);
	%>
	--%>
	<c:forEach var="vo" items="${list}">
	
	<tr class="ct_list_pop" id="${ vo.purchaseProd.prodNo }">
		<td align="center">
		<!-- 
			<a href="/purchase/getPurchase?tranNo=${ vo.tranNo }">${ vo.tranNo }</a>
		 -->
		 ${ vo.tranNo }
		</td>
		<td></td>
		<td align="left">
		<!-- 
			<a href="/user/getUser?userId=${ vo.buyer.userId }">${ vo.buyer.userId }</a>
		 -->
		 ${ vo.buyer.userId }
		</td>
		<td></td>
		<td align="left">${ vo.receiverName }</td>
		<td></td>
		<td align="left">${ vo.receiverPhone }</td>
		<td></td>
		<td align="left"><c:if test="${ ! empty vo.tranCode }"> 
						 <c:if test="${ fn:trim(vo.tranCode) == 1 }">
						 	���籸�ſϷ���� �Դϴ�.
						 </c:if>
						 <c:if test="${ fn:trim(vo.tranCode) == 2 }" >
						 	�������߻��� �Դϴ�.
						 </c:if>
						 <c:if test="${ fn:trim(vo.tranCode) == 3 }" >
						 	�����ۿϷ���� �Դϴ�.
						 </c:if>
						 </c:if>
		</td>
		<td></td>
		<td align="left">
			<c:if test="${ !empty vo.tranCode }" >
			<c:if test="${ fn:trim(vo.tranCode) == 2 }" >
		<!-- 
			<a href="/purchase/updateTranCode?prodNo=${ vo.purchaseProd.prodNo }&tranCode=3">���ǵ���</a>
		 -->
		 	<input type="button" name="arrival" value="���ǵ���"></button>
			</c:if>
			</c:if>
		</td>
	</tr>
	<tr>
		<td colspan="11" bgcolor="D6D7D6" height="1"></td>
	</tr>
	</c:forEach>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;">
	<tr>
		<td align="center">
		<input type="hidden" id="currentPage" name="currentPage" value="" />
		<jsp:include page="../common/pageNavigator.jsp"/>
		<%-- 
		<% if( resultPage.getCurrentPage() <= resultPage.getPageUnit()) {%>
			�� ����
		<% }else{ %>
			<a href="javascript:fncGetPurchaseList('<%=resultPage.getCurrentPage()-1%>')">�� ����</a>
		<% } %>
		<% for(int i =resultPage.getBeginUnitPage(); i<= resultPage.getEndUnitPage(); i++) {%>
			<a href="javascript:fncGetPurchaseList('<%= i %>');"><%= i %></a> 
		<% } %>
		<% if( resultPage.getEndUnitPage() >= resultPage.getMaxPage()) {%>
			���� ��
		<% }else{ %>
			<a href="javascript:fncGetPurchaseList('<%=resultPage.getEndUnitPage()+1%>')">���� ��</a>
		<% } %>
		--%>
		</td>
	</tr>
</table>

<!--  ������ Navigator �� -->
</form>

</div>

</body>
</html>