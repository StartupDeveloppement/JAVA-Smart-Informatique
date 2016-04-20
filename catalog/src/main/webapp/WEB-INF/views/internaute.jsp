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
		<div class="col-xs-12 forminter text-right bg-info">
<table class="table table-bordered">
<tr>
<td><a href="<%=request.getContextPath()%>/panier">Panier</a>
<td colspan="4">Total</td>
<td>${panier.total}</td>
<td colspan="4">Size</td>
<td>${panier.size}</td>
</tr>
</table>
		</div>	
		</div>
	</div>

<div class="container table-responsive">
		<div class="row">
		<div class="col-xs-12 forminter text-center bg-info">
			<f:form modelAttribute="internaute" action="chercher"  method="post"
			enctype="multipart/form-data">
			Mot Clé:<input type="text" name="motCle" value="${mc}">
			<input type="submit" value="OK">
			</f:form> 				
	</div>
			
		</div>
	</div>
	
	
<br>
<br>
<br>

	<div class="container table-responsive">
		<div class="row">
		<div class="col-xs-12 forminter text-center bg-info">
			<f:form modelAttribute="internaute" action="produitParCat"  method="get"
			enctype="multipart/form-data">
			Categories:<select name="nomCat" path="categorie.idCategorie" items="${categories}" itemValue="idCategorie" itemLabel="nomCategorie">
			<c:forEach items="${categories}" var="cat">
			<option value="${cat.idCategorie}"
				<c:if test="${cat.idCategorie==nomCat}">selected</c:if>
			> 
			${cat.nomCategorie}</option>
			</c:forEach>
			</select>
			<input type="submit" value="OK">
			</f:form>
			
		</div>	
		</div>
		</div>  
	
<br>
<br>
<br>
	
	<div class="container table-responsive">
		<div class="row">
		<div class="col-xs-12 forminternaute text-center bg-info">
		<table class="table table-bordered">
		
		<tr>
			<th>DESIGNATION</th>
			<th>DESCRIPTION</th>
			<th>STOCK</th>
			<th>CATEGORIE</th>
			<th>PRIX</th>
			<th>PHOTO</th>
				</tr>
		<c:forEach items="${produits}" var="pro">
			<tr>
				<td>${pro.designation}</td>
				<td>${pro.description}</td>
				<td>${pro.quantite}</td>
				<td>${pro.categorie.nomCategorie}</td>
				<td>${pro.prix}</td>
				<td><img src="photoPro?idP=${pro.idProduit}"></td>
				<td colspan="2">
						<form action="ajouterArticle"  method="post"
			enctype="multipart/form-data">
							<input type="hidden" value="${pro.idProduit}" name="idProduit">
							<input type="text" value="1" name="quantite"}> 
							<input type="submit" value="Ajouter au panier">
							</form>
			</tr>
		</c:forEach>
		</table>
		</div>	
		</div>
		</div>
<br>
<br>
<br>	
</body>
</html>