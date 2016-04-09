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
		<div class="col-xs-12 formproduit text-center bg-info">
			<h3> Smart Informatique </h3> <br>
			<f:form modelAttribute="produit" action="savePro" method="post"
			enctype="multipart/form-data">
			<table class="table table-bordered">
				
				
				<tr>
					<f:input type="hidden" path="idProduit" />${produit.idProduit}
					<f:errors path="idProduit" cssClass="errors"></f:errors>
					<td>Designation</td>
					<td><f:input path="designation" /></td>
					<td><f:errors path="designation" cssClass="errors"></f:errors></td>
				</tr>
				<tr>
					<td>Categorie</td>
					<td><f:select path="categorie.idCategorie" items="${categories}" itemValue="idCategorie" itemLabel="nomCategorie" /></td>
					<td><f:errors path="designation" cssClass="errors"></f:errors></td>
				</tr>
				<tr>
					<td>Description</td>
					<td><f:textarea path="description" /></td>
					<td><f:errors path="description" cssClass="errors"></f:errors></td>
				</tr>
				<tr>
					<td>Prix</td>
					<td><f:input path="prix" /></td>
					<td><f:errors path="prix" cssClass="errors"></f:errors></td>
				</tr>
				<tr>
					<td>Quantite</td>
					<td><f:input path="quantite" /></td>
					<td><f:errors path="quantite" cssClass="errors"></f:errors></td>
				</tr>
				<tr>
					<td>Selected</td>
					<td><f:checkbox path="selected" /></td>
					<td><f:errors path="selected" cssClass="errors"></f:errors></td>
				</tr>
				<tr>
					<td>Photo</td>
					<td>
					<c:if test="${produit.idProduit!=null}">
					<img src="photoPro?idPro=${produit.idProduit}"/>
					</c:if>
					</td>
					<td><input type="file" name="file" /></td>
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
		<div class="col-xs-12 formproduit text-center bg-info">
		<div id="">
		<f:form modelAttribute="produit" action="savePro" method="post"
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
							<td><a href="deletePro?idP=${pro.idProduit}">Delete</a></td>
							<td><a href="editPro?idP=${pro.idProduit}">Edit</a></td>
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
