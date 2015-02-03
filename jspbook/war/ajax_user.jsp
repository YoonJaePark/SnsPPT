<%@ page language="java" contentType="text/html;charset=euc-kr" %>
<%@ page import="java.util.*" %>


<jsp:useBean id="example_access_user" class="java.util.ArrayList" scope="application" />

<%
int k=1;

String user_ip = request.getRemoteAddr();
String user_id = (session.getAttribute("loginid")==null)?"":session.getAttribute("loginid")+"";

HashMap user_info = new HashMap();
user_info.put("session_id",session.getId());
user_info.put("user_id",user_id);
user_info.put("user_ip",user_ip);

user_info.put("access_time",System.currentTimeMillis());

int update_no = -1;
ArrayList remove_list = new ArrayList();
for(int i=0;i<example_access_user.size();i++){
	Map map = (Map)example_access_user.get(i);
	String session_id = map.get("session_id")+"";
	if(session_id.equals(session.getId())) update_no = i;

	long access_time = Long.parseLong(map.get("access_time")+"");
	if((System.currentTimeMillis()-access_time) > 5000) remove_list.add(i+"");
}

//��������� ����
if(update_no>-1) {
	example_access_user.remove(update_no);//������ �߰�
	example_access_user.add(update_no,user_info);
}else{
	example_access_user.add(user_info);
}


//5�� ���� ������ ������ ����
for(int i=0;i<remove_list.size();i++){
	int remove_no = Integer.parseInt(remove_list.get(i)+"");
	example_access_user.remove(remove_no);
}

%>

<!-- ���������� start-->
<table border="0" cellspacing=2 cellpadding=0 width="100%">
	<tr>
		<td>
		���������� : <%=example_access_user.size()%>��
		</td>
	</tr>
	<tr>
		<td height=1 bgcolor=#aaaaaa>
		</td>
	</tr>
	<tr>
		<td height=2>
		</td>
	</tr>
<%
if(true){
	for(int i=0;i<example_access_user.size();i++){
		Map map = (Map)example_access_user.get(i);
		String session_id = map.get("session_id")+"";
		String id = map.get("user_id")+"";
		String ip = map.get("user_ip")+"";
	
		String my="";
		if(session.getId().equals(session_id)) {
			my = "[��]";
		}
		if(id.equals("")){
		%>
			<tr>
				<td>
				<%=ip%><%=my%>
				</td>
			</tr>
		<%
		}else{
		%>
			<tr>
				<td>
				<%="("+id+")"%><%=my%>
				</td>
			</tr>
		<%
		}
	}
}
%>
<%=k++%>
</table>

<!-- ���������� end-->
