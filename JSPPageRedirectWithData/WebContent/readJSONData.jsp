<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
var xmlhttp = new XMLHttpRequest();
xmlhttp.onreadystatechange = function() {
	
	  if (this.readyState == 4 && this.status == 200) {
	    var myObj = JSON.parse(this.responseText);
	   //	alert("Name "+myObj.empList[0].name);
	    var html="";
	    var e;
	    $.each(myObject,function(key,value){
	    	$("#postList").append("<dt>"+value.title+"</dt><dd>"+value.body+"</dd>");
	    });
	    
	    document.getElementById("empList").innerHTML = html;
	  }
	};
	xmlhttp.open("GET", "https://jsonplaceholder.typicode.com/posts", true);
	xmlhttp.send();
</script>
</head>
<body>
<dl id="postList">

</dl>
</body>
</html>