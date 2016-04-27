<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Enregistrement Command</title>
	<style>
body {
  padding-top: 40px;
  padding-bottom: 40px;
  background-color: #E6E6FA; 
}
</style>
</head>
<body>
<div class="container table-responsive">
		<div class="row">
		<div class="col-xs-12 forminternaute text-center bg-info">
		<table class="table table-bordered">	
			<td>${panier.articles}</td>
		</table>
</div>
</div>
</div>
<div class="container table-responsive">
		<div class="row">
		<div class="col-xs-12 forminternaute text-center bg-info">
		<table class="table table-bordered">
		<tr>
<p> votre commande a bien enregistrer Click <a href="<%=request.getContextPath()%>/shop">Here</a> to continue shopping</p>
	</tr>
		</table>
</div>
</div>
</div>
				
<div class="container table-responsive">
		<div class="row">
		<div class="col-xs-12 forminternaute text-center bg-info">
			<f:form action="saveCli" method="post"
			enctype="multipart/form-data">
			<table class="table table-bordered">
			
				<tr>
					${client.idClient}<f:input type="hidden" path="idClient"/>
					<f:errors path="idClient"></f:errors>
					<td>Nom Client</td>
					<td><f:input path="nomClient" /></td>
					<td><f:errors path="nomClient" cssClass="errors"></f:errors></td>
				</tr>
				<tr>
					<td>Adresse</td>
					<td><f:textarea path="adresse" /></td>
					<td><f:errors path="adresse" cssClass="errors"></f:errors></td>
				</tr>
				<tr>
					<td>Email</td>
					<td><f:textarea path="email" /></td>
					<td><f:errors path="email" cssClass="errors"></f:errors></td>
				</tr>
				<tr>
					<td>Téléphone</td>
					<td><f:textarea path="tel" /></td>
					<td><f:errors path="tel" cssClass="errors"></f:errors></td>
				</tr>
				<tr>
					<td>Commande</td>
					<td><f:select path="commande.idCommande" items="${panier.articles}" itemValue="idCommande itemLabel="dateCommande" /></td>
					<td><f:errors path="commande" cssClass="errors"></f:errors></td>
				</tr>
				<tr>
					<td><input type="submit" value="Save" /></td>
				</tr>
			</table>
	</f:form>
		</div>
			
		</div>
	</div>
<br>
<br>

<div class="container table-responsive">
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
</div>

</body>
</html> --%>