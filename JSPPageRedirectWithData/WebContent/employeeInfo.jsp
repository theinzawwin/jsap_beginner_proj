<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import = "java.io.*,java.util.*,java.sql.*"%>
    <%@ page import="org.json.*" %>
<%@ page import="com.best.model.*" %>
<%
try{
	
	String name= request.getParameter("name");
	String address= request.getParameter("address");
	Class.forName("com.mysql.jdbc.Driver");  
Connection con=DriverManager.getConnection(  
	"jdbc:mysql://localhost:3306/training_db","root","root");  

String sql="insert into employee(name,address) values(?,?)";
try {
	
	Statement stmt=con.createStatement();  
	ResultSet rs=stmt.executeQuery("select * from employee");  
	List<Employee> empList=new ArrayList<>();
	while(rs.next()) {
		Employee emp=new Employee();
		emp.setId(rs.getInt(1));
		emp.setName(rs.getString(2));
		emp.setAddress(rs.getString(3));
		empList.add(emp);
	}
	
	con.close();  
	//request.setAttribute("employeeList", empList);
	JSONObject json  = new JSONObject();
	json.put("empList", empList);
	response.getWriter().print(json.toString());
} catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}
	/*Statement stmt=con.createStatement();  
	ResultSet rs=stmt.executeQuery("select * from employee");  
	while(rs.next())  
	System.out.println(rs.getInt(1)+"  "+rs.getString(2)+"  "+rs.getString(3));  
	con.close();  
	*/
	}catch(Exception e){ System.out.println(e);}  


%>