package com.starshop.controllers.common;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cloudinary.Cloudinary;
import com.starshop.entities.Category;
import com.starshop.entities.Product;
import com.starshop.services.CategoryService;
import com.starshop.services.ProductService;

@Controller
@RequestMapping("/common/products")
public class ProductController {

    @Autowired
    private ProductService productService;

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private Cloudinary cloudinary;

    private String message;

    // Lấy tất cả sản phẩm với phân trang
    @RequestMapping("")
    public String allProducts(ModelMap model, Pageable pageable) {
        Page<Product> productPage = productService.findAll(PageRequest.of(pageable.getPageNumber(), pageable.getPageSize()));
        addPaginationAttributes(model, pageable, productPage);
        setProductImageUrls(productPage);
        model.addAttribute("productPage", productPage);
        return "common/product-list";  // Trang hiển thị danh sách sản phẩm
    }

 
  

   
    // Thông báo
    private String getMessage(Page<Product> resultPage, String name) {
        if (StringUtils.hasText(name)) {
            if (resultPage.hasContent()) {
                return "Tìm thấy " + resultPage.getTotalElements() + " sản phẩm";
            } else {
                return "Không tìm thấy sản phẩm";
            }
        }
        return null;
    }
    // phân trang
    private void addPaginationAttributes(ModelMap model, Pageable pageable, Page<Product> productPage) {
        int currentPage = pageable.getPageNumber();
        int totalPages = productPage.getTotalPages();
        if (totalPages > 0) {
            int start = Math.max(1, currentPage - 2);
            int end = Math.min(currentPage + 2, totalPages);
            List<Integer> pageNumbers = IntStream.rangeClosed(start, end)
                    .boxed()
                    .collect(Collectors.toList());
            model.addAttribute("pageNumbers", pageNumbers);
        }
    }
    // Lấy URL tạo ra từ Cloudinary
    private void setProductImageUrls(Page<Product> productPage) {
        productPage.forEach(product -> {
            String imageUrl = cloudinary.url().publicId(product.getImageUrl()).generate();
            product.setImageUrl(imageUrl);
        });
    }

   
}