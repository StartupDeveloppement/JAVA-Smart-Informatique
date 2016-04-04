<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Enregistrement Command</title>
</head>
<body>
Votre Commande est bien Enregister
<!-- <div class="container table-responsive">
		<div class="row">
		<div class="col-xs-12 formcategory text-center bg-info">
			<h3> Smart Informatique </h3> <br>
			<f:form modelAttribute="client" action="enregistrerCommande" method="post"
			enctype="multipart/form-data">
			<table class="table table-bordered">
				<tr>
					<td>ID Client</td>
					<td><f:input path="idClient" /></td>
					<td><f:errors path="idClient" cssClass="errors"></f:errors></td>
				</tr>
				<tr>
					<td>Nom</td>
					<td><f:input path="nomClient" /></td>
					<td><f:errors path="nomClient" cssClass="errors"></f:errors></td>
				</tr>
				<tr>
					<td>Adresse</td>
					<td><f:textarea path="adresse" /></td>
					<td><f:errors path="adresse" cssClass="errors"></f:errors></td>
				</tr>
				<tr>
					<td>Telephone Portable</td>
					<td><f:textarea path="adresse" /></td>
					<td><f:errors path="adresse" cssClass="errors"></f:errors></td>
				</tr>
				
			</table>
	</f:form>
		</div>
			
		</div>
	</div>
 -->

<%-- <div class="container table-responsive">
		<div class="row">
		<div class="col-xs-12 formcategory text-center bg-info">
		<div id="">
		<f:form modelAttribute="client" action="enregistrerCommande" method="post"
			enctype="multipart/form-data">
			<table class="table table-bordered">
				<tr>
					<th>ID</th>
					<th>NOM</th>
					<th>ADRESSE</th>
					<th>TELEPHONE PORTABLE</th>
					<c:forEach items="${enregistrerCommande}" var="cli">
						<tr>
							<td>${cli.idClient}</td>
							<td>${cli.nomClient}</td>
							<td>${cli.adresse}</td>
							<td>${cli.tel}</td>
						</tr>
					</c:forEach>
				</tr>
			</table>
			</f:form>
		</div>
		</div>
		</div>
</div> --%>

</body>
</html>