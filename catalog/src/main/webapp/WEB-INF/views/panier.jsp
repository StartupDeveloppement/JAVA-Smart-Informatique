<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f"%>

<!DocType html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/bootstrap-theme.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/main.css">
</head>
<body>

      <div class="container table-responsive">
		<div class="row">
		<div class="col-xs-12 forminternaute text-center bg-info">
		<form action="ajouterArticle"  method="post"
			enctype="multipart/form-data">
		<c:if test="${panier.size!=0}">
		<table class="table table-bordered">
			<tr>
				<th>ID</th>
				<th>Désignation</th>
				<th>Quantité</th>
				<th>Prix</th>
				<th>Montant</th>
			</tr>
			<c:forEach items="${panier.articles}" var="art">
				<tr>
					<td>${art.produit.idProduit}</td>
					<td>${art.produit.designation}</td>
					<td>${art.quantite}</td>
					<td>${art.produit.prix}</td>
					<td>${art.quantite*art.produit.prix}</td>
					<td><a href="<%=request.getContextPath()%>/deleteItem?idProduit=${art.produit.idProduit}">Delete</a></td>
					<td><a href="<%=request.getContextPath()%>/editItem?idProduit=${art.produit.idProduit}">Edit</a></td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="4">Total</td>
				<td>${panier.total}</td>
			</tr>
		</table>
	</c:if>
	</form>
</div>
</div>
</div>

<div class="container table-responsive">
		<div class="row">
		<div class="col-xs-12 forminternaute text-center bg-info">
<table class="table table-bordered">
<tr>
 	 <td colspan="7">
         <a href="<%=request.getContextPath()%>/shop">continue shopping</a>
         <a href="<%=request.getContextPath()%>/internaute">update panier</a>
     </td>
</tr>    

</table>
</div>
</div>
</div>

<br>
<br>
</br>

<div class="container table-responsive">
		<div class="row">
		<div class="col-xs-12 forminternaute text-center bg-info">
			<f:form action="enregistrerCommande" method="post"
			enctype="multipart/form-data">
			<table class="table table-bordered">
			
				<tr>
					<td>Nom Client</td>
					<td><input type="text" path="nomClient" /></td>
				</tr>
				<tr>
					<td>Adresse</td>
					<td><input type="text" path="adresse" /></td>
				</tr>
				<tr>
					<td>Email</td>
					<td><input type="text" path="email" /></td>
				</tr>
				<tr>
					<td>Téléphone</td>
					<td><input type="text" path="tel" /></td>
				</tr>
				<tr>
					<td><input type="Submit" value="Enregistrement Commande" /></td>
				</tr>
			</table>
	</f:form>
		</div>
			
		</div>
	</div>
<br>
<br>


</body>
</html>