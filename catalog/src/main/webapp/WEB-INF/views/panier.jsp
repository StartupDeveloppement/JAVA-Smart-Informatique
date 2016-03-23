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
	<script type="text/javascript" src="/resources/jquery/jquery-1.8.2.js"></script>
	<script type="text/javascript" src="/resources/js/panier.js"></script>
</head>
<body>

      <div class="container table-responsive">
		<div class="row">
		<div class="col-xs-12 forminternaute text-center bg-info">
		<form modelAttribute="internaute" action="panier"  method="post"
			enctype="multipart/form-data">
		<c:if test="${panier.size!=0}">
		<table class="table table-bordered">
			<tr>
				<th>ID</th>
				<th>D�signation</th>
				<th>Prix</th>
				<th>Quantit�</th>
				<th>Montant</th>
			</tr>
			<c:forEach items="${panier.items}" var="art">
				<tr>
					<td>${art.produit.idProduit}</td>
					<td>${art.produit.designation}</td>
					<td>${art.produit.prix}</td>
					<td>${art.quantite}</td>
					<td>${art.quantite*art.produit.prix}</td>
					<td><a href="<%=request.getContextPath()%>/deleteItem?idProduit=${art.produit.idProduit}">Delete</a></td>
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

<tr>
 	 <td colspan="7">
         <a href="<%=request.getContextPath()%>/adminInt/internaute" class="left_table_btn btn btn_reverse floatleft">continue shopping</a>
     </td>
</tr>    

		<tr>
			<td colspan="2">
			<img id="imgPanier" src="/resources/images/panier.jpg" onclick="affichePanier()"/>
			</td> 
		</tr>
<table class="table table-bordered">	
		<tr>
			<td><input type="submit" value="Enregister Commande" /></td>
		</tr>
</table>

</body>
</html>