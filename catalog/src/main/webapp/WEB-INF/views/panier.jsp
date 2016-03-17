<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class="container table-responsive">
		<div class="row">
		<div class="col-xs-12 forminternaute text-center bg-info">
		<f:form modelAttribute="internaute" action="ajouter" method="get" 
		enctype="multipart/form-data">
					<table class="table table-bordered">
				
		<tr>
			<th>DESIGNATION</th>
			<th>DESCRIPTION</th>
			<th>CATEGORIE</th>
			<th>PRIX</th>
			<th>PHOTO</th>
				</tr>
		<c:forEach items="${produits}" var="pro">
			<tr>
				<td>${pro.designation}</td>
				<td>${pro.description}</td>
				<td>${pro.categorie.nomCategorie}</td>
				<td>${pro.prix}</td>
				<td><img src="photoPro?idP=${pro.idProduit}"></td>
			</tr>
		</c:forEach>
				</table>
		</f:form>
		</div>	
		</div>
		${panier}
		</div> 
</body>
</html>