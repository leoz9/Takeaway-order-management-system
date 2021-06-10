<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../common/header.jsp"%>
<body> 
<div id="submitView" class="viewer clearfix" style="">
    <section class="submit_title">
        <div class="container" id="">
           
            <div class="col-md-12 clearfix">
                <div class="now_submit clearfix" style="margin-left:0px;">
                    <form id="login-form">
        
                       
                        <div class="form-group" id="form_info">
                            <label for="phone">
                                用户名
                            </label>
                            <span class="twitter-typeahead">
                                <input type="text" name="name" class="form-control tt-query" autocomplete="off"
                                spellcheck="false" dir="auto">
                            </span>
                            <label for="name" class="mgt10">
                                密码
                            </label>
                            <span class="twitter-typeahead">
                                <input type="password" name="password" class="form-control tt-query" autocomplete="off"
                                spellcheck="false" dir="auto">
                            </span>
                           
                        </div>
                        <div class="form-group">
                            <div class="btn_control fr">
                                <a class="btn btn-default bottommargin" id="registerSubmit">
                                    注册
                                </a>
                                <a class="btn btn-info bottommargin" id="loginSubmit">
                                    登录
                                </a>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
</div>
<!-- Le javascript
    ================================================== --> 
  <!-- Placed at the end of the document so the pages load faster --> 
  <script>
$("#registerSubmit").click(function(){
	window.location.href = 'registe';
});		
$("#loginSubmit").click(function(){
	$.ajax({
		url:'login',
		data:$("#login-form").serialize(),
		type:'post',
		dataType:'json',
		success:function(data){
			if(data.type == 'success'){
				alert('登录成功');
				window.location.href = '../index/index';
			}else{
				alert(data.msg);
			}
		}
	});
});      
</script>  
 </body>
</html>