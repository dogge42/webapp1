package controller;

import dao.ProductDAO;
import model.Product;
import util.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/products")
public class ProductServlet extends HttpServlet {
    private ProductDAO productDAO;

    @Override
    public void init() {
        // Khởi tạo đối tượng ProductDAO khi servlet được khởi tạo
        Connection connection = DBConnection.getConnection();
        productDAO = new ProductDAO(connection);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) action = "list";

        try {
            switch (action) {
                case "new":
                    // Chuyển đến trang thêm sản phẩm
                    request.getRequestDispatcher("/product-add.jsp").forward(request, response);
                    break;
                case "edit":
                    // Lấy id từ request và truy vấn sản phẩm cần chỉnh sửa
                    int id = Integer.parseInt(request.getParameter("id"));
                    Product existingProduct = productDAO.getProductById(id);
                    request.setAttribute("product", existingProduct);
                    request.getRequestDispatcher("/product-edit.jsp").forward(request, response);
                    break;
                case "delete":
                    // Lấy id từ request và xóa sản phẩm
                    int deleteId = Integer.parseInt(request.getParameter("id"));
                    productDAO.deleteProduct(deleteId);
                    response.sendRedirect("products");
                    break;
                default:
                    // Lấy danh sách sản phẩm và hiển thị
                    List<Product> productList = productDAO.getAllProducts();
                    request.setAttribute("products", productList);
                    request.getRequestDispatcher("/product-list.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy các tham số từ form
        String idStr = request.getParameter("id");
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String description = request.getParameter("description");

        try {
            if (idStr == null || idStr.isEmpty()) {
                // Thêm mới sản phẩm
                productDAO.insertProduct(new Product(0, name, price, quantity, description));
            } else {
                // Cập nhật sản phẩm
                int id = Integer.parseInt(idStr);
                productDAO.updateProduct(new Product(id, name, price, quantity, description));
            }
            response.sendRedirect("products");
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
}
