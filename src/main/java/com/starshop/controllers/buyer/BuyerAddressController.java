package com.starshop.controllers.buyer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.starshop.entities.Address;
import com.starshop.entities.Buyer;
import com.starshop.services.AddressService;
import com.starshop.services.BuyerService;

@Controller
@RequestMapping("/buyer/address")
public class BuyerAddressController {
	 @Autowired
	    private AddressService addressService;
	 @Autowired
	    private BuyerService buyerService;

	    @GetMapping("/edit-address/{id}")
	    public String editAddressForm(@PathVariable Long id, Model model) {
	        // Lấy thông tin địa chỉ theo ID
	        Address address = addressService.findById(id).orElseThrow(()-> new RuntimeException("address not Found"));
	        model.addAttribute("address", address);
	        return "buyer/address-edit";  // Trả về trang JSP edit-address.jsp
	    }
	    @GetMapping("/add-address/{buyerID}")
	    public String addAddressForm( Model model, @PathVariable int buyerID) {
	    	model.addAttribute("buyerID",buyerID);
	        return "buyer/address-add";  
	    }
	    
	    @PostMapping("/create-address")
	    public String createAddresss(
                @RequestParam String fullName,
                @RequestParam int streetNumber,
                @RequestParam String streetName,
                @RequestParam String commune,
                @RequestParam String district,
                @RequestParam String province,
                RedirectAttributes redirectAttributes,@RequestParam int currentBuyerID) {
	    	Buyer curBuyer = buyerService.findById(currentBuyerID).orElseThrow(()->new RuntimeException("Buyer Not found"));
	    	
	    	
	    	 Address address = new Address();
	    	 	curBuyer.getAddresses().add(address);
	    	 	address.setBuyer(curBuyer);
		        address.setStreetNumber(streetNumber);
		        address.setStreetName(streetName);
		        address.setCommune(commune);
		        address.setDistrict(district);
		        address.setProvince(province);

		        curBuyer.getAddresses().add(address);
		        addressService.save(address);
	    	 return "redirect:/buyer/account";
	    }
	    @PostMapping("/update-address")
	    public String updateAddress(@RequestParam Long addressId,
	                                @RequestParam String fullName,
	                                @RequestParam int streetNumber,
	                                @RequestParam String streetName,
	                                @RequestParam String commune,
	                                @RequestParam String district,
	                                @RequestParam String province,
	                                RedirectAttributes redirectAttributes) {
	        // Cập nhật thông tin địa chỉ
	        Address address = addressService.findById(addressId).orElseThrow(()->new RuntimeException("Adress not found "));
	        address.setStreetNumber(streetNumber);
	        address.setStreetName(streetName);
	        address.setCommune(commune);
	        address.setDistrict(district);
	        address.setProvince(province);

	        addressService.save(address);  // Lưu thay đổi vào cơ sở dữ liệu

	        // Chuyển hướng trở lại trang người dùng sau khi cập nhật
	        redirectAttributes.addFlashAttribute("message", "Address updated successfully!");
	        return "redirect:/buyer/account";  // Chuyển hướng về trang tài khoản hoặc trang cần thiết
	    }
	    
	    @GetMapping("/delete-address/{addressId}")
	    public String deleteAddress(@PathVariable Long addressId, RedirectAttributes redirectAttributes) {
	        addressService.deleteById(addressId);  // Xóa địa chỉ theo ID

	        redirectAttributes.addFlashAttribute("message", "Address deleted successfully!");
	        return "redirect:/buyer/account";  // Chuyển hướng về trang tài khoản hoặc trang cần thiết
	    }
}
