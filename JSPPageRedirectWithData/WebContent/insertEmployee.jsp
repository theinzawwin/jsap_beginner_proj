<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import="com.best.model.*" %>
<%@ page import="com.best.service.*" %>

<%
try{
	
	String name= request.getParameter("name");
	String address= request.getParameter("address");
	Student std=new Student();
	StudentService stdService=new StudentService();
	stdService.saveStudent(std);
	Class.forName("com.mysql.jdbc.Driver");  
Connection con=DriverManager.getConnection(  
	"jdbc:mysql://localhost:3306/training_db","root","root");  

String sql="insert into employee(name,address) values(?,?)";
try {
	if(name!="" && address!=""){
		java.sql.PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setString(2, address);
		int status=pstmt.executeUpdate();
		if(status>0)
			System.out.println("Insert is successful!");
	}
	
	
	String destination = "employeeList.jsp";
	RequestDispatcher requestDispatcher = request.getRequestDispatcher(destination);

	
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
	request.setAttribute("employeeList", empList);
	requestDispatcher.forward(request, response);
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
