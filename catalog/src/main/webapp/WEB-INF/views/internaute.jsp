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
	<link rel="shortcut icon"
	href="<%=request.getContextPath()%>/resources/images/panier.jpg">
</head>
<body>

	<div class="container table-responsive">
		<div class="row">
		<div class="col-xs-12 forminter text-center bg-info">
			<f:form modelAttribute="internaute" action="chercher"  method="get"
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
		<f:form modelAttribute="produit" action="ajouter" method="get" 
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
				<td>
				<input type="submit" value="Add to Cart">
				</td>
			</tr>
		</c:forEach>
				</table>
		</f:form>
		</div>	
		</div>
		${panier}
		</div> 
		
		
<br>
<br>
<br>
						
</body>
</html>