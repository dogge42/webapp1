<%@ page import="java.util.List, model.Product" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Danh sách sản phẩm</title>
</head>
<body>
<h2>Danh sách sản phẩm</h2>
<a href="products?action=new">Thêm sản phẩm</a>
<table border="1">
    <tr>
        <th>ID</th>
        <th>Tên</th>
        <th>Giá</th>
        <th>Số lượng</th>
        <th>Mô tả</th>
        <th>Hành động</th>
    </tr>
    <%
        // Kiểm tra nếu 'products' không phải là null trước khi sử dụng
        List<Product> products = (List<Product>) request.getAttribute("products");
        if (products != null) {
            for (Product p : products) {
    %>
    <tr>
        <td><%= p.getId() %></td>
        <td><%= p.getName() %></td>
        <td><%= p.getPrice() %></td>
        <td><%= p.getQuantity() %></td>
        <td><%= p.getDescription() %></td>
        <td>
            <a href="products?action=edit&id=<%= p.getId() %>">Sửa</a>
            <a href="products?action=delete&id=<%= p.getId() %>" onclick="return confirm('Xóa sản phẩm này?');">Xóa</a>
        </td>
    </tr>
    <%
        }
    } else {
    %>
    <tr>
        <td colspan="6">Không có sản phẩm nào.</td>
    </tr>
    <% } %>
</table>
</body>
</html>
