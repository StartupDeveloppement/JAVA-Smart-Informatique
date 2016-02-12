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
		<f:form modelAttribute="internaute" action="ajouterPanier" method="post" 
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
							<td colspan="2">
					<%-- <input type="hidden" value="${pro.idProduit}" name="idProduit"> --%>
					<input type="text" value="1" name="quantite">
					<input type="submit" value="Ajouter au panier">
					</c:forEach>
				</tr>
				</table>
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
		<f:form modelAttribute="lignecommande" action="ajouterPanier" method="post" 
		enctype="multipart/form-data">
		<table class="table table-bordered">
		<tr>
		<!-- <th>QUANTITE</th> -->
					<th>ID</th>
					<th>PRIX</th>
					<th>CHOSEN</th>
					<!-- <th>ID COMMANDE</th> -->
					<th>ID PRODUIT</th>
		<c:forEach items="${lignecommandes}" var="lc">
			<tr>
				<td>${lc.id}
				<td>${lc.produit.prix}</td>
				<td>${lc.quantite}</td>
				<td>${lc.commande.idCommande}
				<td>${lc.produit.idProduit}
			</tr>
		</c:forEach>
		</table>
		</f:form>
		</div>
		</div>
</div> 


						
</body>
</html>