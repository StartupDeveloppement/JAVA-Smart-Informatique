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
		<div class="col-xs-12 forminter text-center bg-info">
 <ul>
    <li><a href="<%=request.getContextPath()%>/adminCat/index"> Categories</a></li>
    <li><a href="<%=request.getContextPath()%>/adminPro/produit">Produits</a></li>
    <li><a href="<%=request.getContextPath()%>/boutique">Site E-Commerce</a></li>
 </ul>
 </div>
 </div>
 </div>
	<div class="container table-responsive">
		<div class="row">
		<div class="col-xs-12 formcategory text-center bg-info">
			<h4> CATEGORIES </h4> <br>
			<f:form modelAttribute="categorie" action="saveCat" method="post"
			enctype="multipart/form-data">
			<table class="table table-bordered">
			
				<tr>
					${categorie.idCategorie}<f:input type="hidden" path="idCategorie"/>
					<f:errors path="idCategorie"></f:errors>
					<td>Nom Catégorie</td>
					<td><f:input path="nomCategorie" /></td>
					<td><f:errors path="nomCategorie" cssClass="errors"></f:errors></td>
				</tr>
				<tr>
					<td>Description</td>
					<td><f:textarea path="description" /></td>
					<td><f:errors path="description" cssClass="errors"></f:errors></td>
				</tr>
				<tr>
					<td>Photo</td>
					<td>
					<c:if test="${categorie.idCategorie!=null}">
					<img src="photoCat?idCat=${categorie.idCategorie}"/>
					</c:if>
					</td>
					<td><input type="file" name="file" /></td>
				</tr>
				<tr>
					<td><input type="submit" value="Enregistrer" /></td>
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
		<f:form modelAttribute="categorie" action="saveCat" method="post"
			enctype="multipart/form-data">
			<table class="table table-bordered">
				<tr>
					<th>ID</th>
					<th>NOM CAT</th>
					<th>DESCRIPTION</th>
					<th>PHOTO</th>
					<c:forEach items="${categories}" var="cat">
						<tr>
							<td>${cat.idCategorie}</td>
							<td>${cat.nomCategorie}</td>
							<td>${cat.description}</td>
							<td><img src="photoCat?idCat=${cat.idCategorie}"></td>
							<td><a href="deleteCat?idCat=${cat.idCategorie}">Supprimer</a></td>
							<td><a href="editCat?idCat=${cat.idCategorie}">Modifier</a></td>
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
</html>

