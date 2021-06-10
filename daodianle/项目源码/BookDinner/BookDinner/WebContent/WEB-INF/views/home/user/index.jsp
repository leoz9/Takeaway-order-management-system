<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../common/header.jsp"%>
<body> 
<div id="wrapper2" class="viewer wrapper countpage clearfix show" style="display:none"> 
   <div id="submitView" class="viewer clearfix">
    <section class="submit_title">
        <div class="container" id="">
           
           <div class="col-md-12 clearfix">
                <div class="now_submit clearfix" style="margin-left: 0px;">
                    <div class="line-body clearfix" >
                            <span class="fl lh43">
                               
                            </span>
                            <ul class="nav nav-pills tabdrop fr">
                                <li class="dropdown pull-right tabdrop">
                                    <a class="dropdown-toggle" href="../index/index">
                                        <i class="fa fa-th-list">返回主页
                                        </i>
                                    </a>
                                </li>
                            </ul>
                        </div>
                </div>
            </div>
            <div class="col-md-12 clearfix">
                <div class="now_submit clearfix" style="margin-left: 0px;">
                    <div class="line-body clearfix info-form_more" >
                            <span class="fl lh43">
                               基础信息
                            </span>
                            <ul class="nav nav-pills tabdrop fr">
                                <li class="dropdown pull-right tabdrop">
                                    <a class="dropdown-toggle" id="J_btn_reg">
                                        <i class="fa fa-th-list">
                                        </i>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    <form class="slide-form">
        
                        
                        <div class="form-group" >
                         <label for="phone">
                                密码
                            </label>
                            <span class="twitter-typeahead">
                                <input value="${account.password }" type="password" id="edit-password" name="password" class="form-control tt-query" autocomplete="off"
                                spellcheck="false" dir="auto">
                            </span>
                            <label for="phone">
                                手机号码
                            </label>
                            <span class="twitter-typeahead">
                                <input value="${account.phone }" type="text" id="edit-phone" name="phone" class="form-control tt-query" autocomplete="off"
                                spellcheck="false" dir="auto">
                            </span>
                            <label for="name" class="mgt10">
                                姓名
                            </label>
                            <span class="twitter-typeahead">
                                <input value="${account.realName }" type="text" id="edit-recieveName" name="realName" class="form-control tt-query" autocomplete="off"
                                spellcheck="false" dir="auto">
                            </span>
                            <label for="adress" class="mgt10">
                                地址
                            </label>
                            <span class="twitter-typeahead">
                                <input value="${account.address }" type="text" id="edit-address" name="address" class="form-control tt-query" autocomplete="off"
                                spellcheck="false" dir="auto">
                            </span>
                        </div>
                        <div class="form-group">
                            <div class="btn_control fr">
                                <a class="btn btn-info bottommargin" id="submit-info-action">
                                    确认
                                </a>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            
            <c:forEach items="${orderList}" var="order">
            <div class="col-md-12 clearfix">
                <div class="now_submit clearfix" style="margin-left: 0px;">
                    <div class="line-body clearfix info-form_more">
                            <span class="fl lh43">
                               <fmt:formatDate value="${order.createTime }" pattern="yyyy-MM-dd hh:mm:ss" />
                               <c:if test="${order.status == 0 }">待发货</c:if>
                               <c:if test="${order.status == 1 }">已发货</c:if>
                               <c:if test="${order.status == 2 }">已完成</c:if>
                            </span>
                            <ul class="nav nav-pills tabdrop fr">
                                <li class="dropdown pull-right tabdrop">
                                    <a class="dropdown-toggle" id="J_btn_reg">
                                        <i class="fa fa-th-list">
                                        </i>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    <form class="slide-form">
        
                        
                        <div class="form-group" style="padding-bottom:0px;">
                            <c:forEach items="${order.orderItems }" var="orderItem">
                            <label >
                             	${orderItem.foodName }          <span style="float:right;color:red;">${orderItem.price } ✕${orderItem.foodNum } ￥：${orderItem.money }元</span>
                            </label>
                            </c:forEach>
                            <label >
                             	 <span style="float:right;color:red;">总计￥：${order.money}元</span>
                            </label>
                        </div>
                    </form>
                </div>
            </div>
            </c:forEach>
        </div>
    </section>
</div> 
  </div>   
 </body>
<script>
	$(document).ready(function(){
		$(".slide-form").slideUp();
	});
	$(".info-form_more").click(function(){
		$(this).next("form").slideToggle();
	});
	$("#submit-info-action").click(function(){
		var password = $("#edit-password").val();
		var phone = $("#edit-phone").val();
		var recieveName = $("#edit-recieveName").val();
		var address = $("#edit-address").val();
		if(password == '' || phone == '' || recieveName == '' || address == ''){
			alert('请填写信息！');
			return;
		}
		var $this = $(this);
		$.ajax({
			url:'update_info',
			data:{password:password,phone:phone,realName:recieveName,address:address},
			type:'post',
			dataType:'json',
			success:function(data){
				alert(data.msg);
				$this.closest("form").slideUp();
			}
		});
	});
</script>
</html>