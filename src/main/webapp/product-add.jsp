<%@ page import="model.Product" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Thêm sản phẩm</title>
</head>
<body>
<h2>Thêm sản phẩm mới</h2>
<form action="products" method="post">
    <input type="hidden" name="id" value=""/>
    <label for="name">Tên sản phẩm:</label>
    <input type="text" id="name" name="name" required/><br/>

    <label for="price">Giá:</label>
    <input type="text" id="price" name="price" required/><br/>

    <label for="quantity">Số lượng:</label>
    <input type="number" id="quantity" name="quantity" required/><br/>

    <label for="description">Mô tả:</label>
    <textarea id="description" name="description"></textarea><br/>

    <input type="submit" value="Lưu"/>
</form>
</body>
</html>
