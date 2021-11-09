<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

  <meta content="Metronic Shop UI description" name="description">
  <meta content="Metronic Shop UI keywords" name="keywords">
  <meta content="keenthemes" name="author">

  <meta property="og:site_name" content="-CUSTOMER VALUE-">
  <meta property="og:title" content="-CUSTOMER VALUE-">
  <meta property="og:description" content="-CUSTOMER VALUE-">
  <meta property="og:type" content="website">
  <meta property="og:image" content="-CUSTOMER VALUE-"><!-- link to image for socio -->
  <meta property="og:url" content="-CUSTOMER VALUE-">

  <link rel="shortcut icon" href="favicon.ico">

  <!-- Fonts START -->
  <link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700|PT+Sans+Narrow|Source+Sans+Pro:200,300,400,600,700,900&amp;subset=all" rel="stylesheet" type="text/css">
  <!-- Fonts END -->

  <!-- Global styles START -->          
  <link href="../plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet">
  <link href="../plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Global styles END --> 
   
  <!-- Page level plugin styles START -->
  <link href="../pages/css/animate.css" rel="stylesheet">
  <link href="../plugins/fancybox/source/jquery.fancybox.css" rel="stylesheet">
  <link href="../plugins/owl.carousel/assets/owl.carousel.css" rel="stylesheet">
  <!-- Page level plugin styles END -->

  <!-- Theme styles START -->
  <link href="../pages/css/components.css" rel="stylesheet">
  <link href="../pages/css/slider.css" rel="stylesheet">
  <link href="../corporate/css/style.css" rel="stylesheet">
  <link href="../corporate/css/style-responsive.css" rel="stylesheet">
  <link href="../corporate/css/themes/red.css" rel="stylesheet" id="style-color">
  <link href="../corporate/css/custom.css" rel="stylesheet">
  <style type="text/css">
  html {

    position: relative;

    min-height: 100%;

    margin: 0;

   

}
body {

    min-height: 100%;

}
.footer {

    position: absolute;

    left: 0;

    bottom: 0;

    width: 100%;

	padding: 15px 0;

	text-align: center;

	color: white;

	

}
  </style>
</head>
<body>



<jsp:include page="header.jsp"/>
<jsp:include page="${main_jsp }"/>
<jsp:include page="footer.jsp"/>




<script src="../plugins/jquery.min.js" type="text/javascript"></script>
    <script src="../plugins/jquery-migrate.min.js" type="text/javascript"></script>
    <script src="../plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>      
    <script src="../corporate/scripts/back-to-top.js" type="text/javascript"></script>
    <!-- END CORE PLUGINS -->

    <!-- BEGIN PAGE LEVEL JAVASCRIPTS (REQUIRED ONLY FOR CURRENT PAGE) -->
    <script src="../plugins/fancybox/source/jquery.fancybox.pack.js" type="text/javascript"></script><!-- pop up -->
    <script src="../plugins/owl.carousel/owl.carousel.min.js" type="text/javascript"></script><!-- slider for products -->

    <script src="../corporate/scripts/layout.js" type="text/javascript"></script>
    <script src="../pages/scripts/bs-carousel.js" type="text/javascript"></script>
    <script type="text/javascript">
        jQuery(document).ready(function() {
            Layout.init();    
            Layout.initOWL();
            Layout.initTwitter();
            Layout.initFixHeaderWithPreHeader(); /* Switch On Header Fixing (only if you have pre-header) */
            Layout.initNavScrolling();
        });
    </script>
   	<script src="<c:url value="/resources/js/basic.js" />"></script>
    <script type="text/javascript">
		const contextRoot = "${pageContext.request.contextPath}";
	
		const logout=()=>{
			if (confirm("로그아웃하시겠습니까?")) {
				location.href = contextRoot+"/member/logout.do";
			}
		}
		
		const deleteMember=()=>{
			if (confirm("정말로 탈퇴하시겠습니까?")) {
				let uri = contextRoot+"/member/delete.do";
				let form = $("<form></form>");
				form.attr("action", uri);
				form.attr("method", "post");
				form.appendTo("body");
				form.submit();
			}
		}
		
		const reservation=()=>{
			let uri = contextRoot+"/reservation/write.do";
			let form = $("<form></form>");
			form.attr("action", uri);
			form.attr("method", "post");
			form.appendTo("body");
			form.append("<input type='hidden' name='targetIdx' value='1' />");
			form.append("<input type='hidden' name='targetType' value='hospital' />");
			form.append("<input type='hidden' name='title' value='테스트' />");
			form.submit();
		}
	</script>
</body>
</html>