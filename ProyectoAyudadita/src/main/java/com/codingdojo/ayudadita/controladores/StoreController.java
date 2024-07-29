package com.codingdojo.ayudadita.controladores;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.codingdojo.ayudadita.modelos.Product;
import com.codingdojo.ayudadita.modelos.Usuario;
import com.codingdojo.ayudadita.servicios.ProductService;
import com.codingdojo.ayudadita.servicios.ServUsuario;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
@RequestMapping("/store")
public class StoreController {

	@Autowired
	private ProductService ps;

	@Autowired
	private ServUsuario serv;

	@GetMapping("/")
	public String store(HttpSession session,
			Model model,
			@RequestParam(required = false) String order) {

		Usuario userTemp = (Usuario) session.getAttribute("userInSession");
		if (userTemp == null) {
			return "redirect:/";
		}
		List<Product> store = ps.getAllProducts();

		model.addAttribute("store", store);

		return "store.jsp";
	}

	@GetMapping("/product/{id}")
	public String product(@PathVariable("id") Long id,
			HttpSession session,
			Model model) {

		Usuario userTemp = (Usuario) session.getAttribute("userInSession");
		if (userTemp == null) {
			return "redirect:/";
		}
		Product product = ps.findProduct(id);
		model.addAttribute("product", product);
		
		return "product.jsp";
	}

	@GetMapping("/product/new")
	public String productNew(HttpSession session,
			@ModelAttribute("product") Product product,
			Model model) {

		Usuario userTemp = (Usuario) session.getAttribute("userInSession");
		if (userTemp == null) {
			return "redirect:/";
		}
		// model.addAttribute("locations", Location.Locations); //UTIL CUANDO HAYARCHIVO
		// QUE HACERLE FOR EACH

		return "new-product.jsp";

	}

	@PostMapping("/product/create")
	public String productCreate(@Valid @ModelAttribute("product") Product product,
			@RequestParam(value = "file", required = false) MultipartFile file,		
			BindingResult result,
			HttpSession session) {

		Usuario userTemp = (Usuario) session.getAttribute("userInSession");
		if (userTemp == null) {
			return "redirect:/";
		}

		if (result.hasErrors()) {
			return "new-product.jsp";
		} else {
			if (!file.isEmpty()) {
				ps.saveProduct(product);
				String imagenNombre = ps.saveImg(file, product.getId());
				product.setImg(imagenNombre);
			}

			ps.saveProduct(product);

			Usuario myUser = serv.findUser(userTemp.getId());
			myUser.getMyProducts().add(product);
			serv.save(myUser);

			return "redirect:/store/";
		}
	}


	@GetMapping("/product/{id}/edit")
	public String productEdit(@PathVariable("id") Long id,
								HttpSession session,
								@ModelAttribute("product") Product product, 
								Model model) {
		
		Usuario userTemp = (Usuario) session.getAttribute("userInSession"); 
		if(userTemp == null) {
			return "redirect:/";
		}
		
		
		
		Product productToEdit = ps.findProduct(id);
		
		
		if(userTemp.getId() != productToEdit.getCreator().getId()) {
			return "redirect:/store/";
		}
		
		model.addAttribute("product", productToEdit);
		
		
		
		return "edit-product.jsp";
		
	}
	
	@PutMapping("/product/update")
	public String productUpdate(HttpSession session,
								@RequestParam(value = "file", required = false) MultipartFile file,
								@Valid @ModelAttribute("product") Product product, 
								BindingResult result) {
	
		Usuario userTemp = (Usuario) session.getAttribute("userInSession"); 
		if(userTemp == null) {
			return "redirect:/";
		}

		if (result.hasErrors()) {
			return "edit-product.jsp";
		} else {
			if (!file.isEmpty()) {
				// Guardar la imagen y actualizar el producto
				String imagenNombre = ps.saveImg(file, product.getId());
				product.setImg(imagenNombre);
			}

			ps.saveProduct(product);
			return "redirect:/store/";
		}
		
	}

	@GetMapping("/product/{id}/delete")
	public String deleteProduct(HttpSession session, @PathVariable("id") Long id) {
		Usuario userTemp = (Usuario) session.getAttribute("userInSession"); 
		if(userTemp == null) {
			return "redirect:/";
		}
		ps.deleteProduct(id);
		return "redirect:/store/";
	}
}