package laptrinhjavaweb.service.user;

import org.springframework.stereotype.Service;

import laptrinhjavaweb.models.user.ProductPage;

@Service
public class ProductPageService {
	public ProductPage GetInfoProductPage(int totalProduct, int limit, int currentPage) {
		ProductPage productPage = new ProductPage();

		productPage.setTotalPage(SetInfoTotalPage(totalProduct, limit));
		productPage.setLimit(limit);
		productPage.setCurrentPage(CheckCurrentPage(currentPage, productPage.getTotalPage()));
		
		int start = Start(productPage.getCurrentPage(), limit);
		productPage.setStart(start);
		
		int end = End(productPage.getStart(), limit, totalProduct);
		productPage.setEnd(end);
		return productPage;
	}

	private int End(int start, int limit, int totalProduct) {
		return start + limit > totalProduct ? totalProduct : (start + limit) -1;
	}

	private int Start(int currentPage, int limit) {
		return ((currentPage -1) * limit);
	}

	private int SetInfoTotalPage(int totalProduct, int limit) {
		int totalPage = 0;
		totalPage =  totalProduct / limit;
		totalPage =  totalPage * limit < totalProduct ? totalPage + 1 : totalPage;
		return totalPage;
	}
	
	private int CheckCurrentPage(int currentPage, int totalPage) {
		if (currentPage < 1) {
			return 1;
		}
		if (currentPage > totalPage) {
			return totalPage;
		}
		return currentPage;
	}
}
