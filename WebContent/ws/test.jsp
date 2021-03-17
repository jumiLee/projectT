<!DOCTYPE html>
<html>
<%@ include file="./common.jsp"%>

<!-- Page -->
<div id="MainPage" data-role="page" data-theme="black">
	<!-- Header -->
	<%@ include file="header.jsp"%>
	
	<!-- Content -->
	<div data-role="content" style="margin: 0; padding: 0;" id="content">
		<div id="iscroll">
		<div id="scroller">
			<table style="width:100%;leftmargin:0; topmargin:0; marginwidth:0; marginheight:0;">
			<tr>
				<td>
					<img src="<%=ImgUrl%>/images/121004_main.png">
				</td>
			</tr>
			</table>
		</div>
		</div>
	</div>
	
	<!-- footer -->
	<%@ include file="footer.jsp"%>
</div>
</html>