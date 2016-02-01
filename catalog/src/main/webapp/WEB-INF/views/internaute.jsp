<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f"%>

<!DocType html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/bootstrap-theme.min.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/main.css">
</head>
<body>

<div class="container table-responsive">
		<div class="row">
		<div class="col-xs-12 forminternaute text-center bg-info">
			<h3> List Categorie </h3> <br>
			<f:form modelAttribute="internaute" action="produitParCategorie"  method="post"
			enctype="multipart/form-data">
			<table class="table table-bordered">
			<c:forEach items="${categories}" var="cat">
			<tr>
			<td><a href="#" >${cat.nomCategorie}</a></td>
			</tr>
			</c:forEach>
			</table>
	</f:form>
		</div>
			
		</div>
	</div>
<br>
<br>

<div class="container table-responsive">
		<div class="row">
		<div class="col-xs-12 forminternaute text-center bg-info">
			<f:form modelAttribute="internaute" action="produitParCategorie"  method="post"
			enctype="multipart/form-data">
			<table class="table table-bordered">
<tr>
				<td>Produit par mot clé :</td>
				<td><form:select path="produit" items="${produits}"
					multiple="true" /></td>
				<td><form:errors path="produit" cssClass="error" /></td>
			</tr>
</table>
	</f:form>
		</div>
			
		</div>
	</div>
<div class="container table-responsive">
		<div class="row">
		<div class="col-xs-12 formproduit text-center bg-info">
		<div id="">
		<h3> List Produit </h3> <br>
		<f:form modelAttribute="internaute" action="produitParCategorie" method="post"
			enctype="multipart/form-data">
			<table class="table table-bordered">
				<tr>
					<th>ID</th>
					<th>DESIGNATION</th>
					<th>DESCRIPTION</th>
					<th>CATEGORIE</th>
					<th>PRIX</th>
					<th>QUANTITE</th>
					<th>SELECTED</th>
					<th>PHOTO</th>
					<c:forEach items="${produits}" var="pro">
						<tr>
							<td>${pro.idProduit}</td>
							<td>${pro.designation}</td>
							<td>${pro.description}</td>
							<td>${pro.categorie.nomCategorie}</td>
							<td>${pro.prix}</td>
							<td>${pro.quantite}</td>
							<td>${pro.selected}</td>
							<td><img src="photoPro?idP=${pro.idProduit}"></td>
						</tr>
					</c:forEach>
					<!--<tr>
					<td>
					<a href="produitsParCat?idCat=${cat.idCategorie }"> Chercher Produit par categorie</a>
					</td>
					</tr>  -->
			</table>
			</f:form>
		</div>
		</div>
		</div>
</div>

						
</body>
</html>