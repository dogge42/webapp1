<%@ page import="model.Product" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Sửa sản phẩm</title>
</head>
<body>
<h2>Sửa sản phẩm</h2>
<form action="products" method="post">
  <input type="hidden" name="id" value="<%= (request.getAttribute("product") == null) ? "" : ((Product)request.getAttribute("product")).getId() %>"/>

  <label for="name">Tên sản phẩm:</label>
  <input type="text" id="name" name="name" value="<%= (request.getAttribute("product") == null) ? "" : ((Product)request.getAttribute("product")).getName() %>" required/><br/>

  <label for="price">Giá:</label>
  <input type="text" id="price" name="price" value="<%= (request.getAttribute("product") == null) ? "" : ((Product)request.getAttribute("product")).getPrice() %>" required/><br/>

  <label for="quantity">Số lượng:</label>
  <input type="number" id="quantity" name="quantity" value="<%= (request.getAttribute("product") == null) ? "" : ((Product)request.getAttribute("product")).getQuantity() %>" required/><br/>

  <label for="description">Mô tả:</label>
  <textarea id="description" name="description"><%= (request.getAttribute("product") == null) ? "" : ((Product)request.getAttribute("product")).getDescription() %></textarea><br/>

  <input type="submit" value="Cập nhật"/>
</form>
</body>
</html>
