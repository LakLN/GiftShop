package laptrinhjavaweb.service.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import laptrinhjavaweb.dao.admin.CategoryDaoAdmin;
import laptrinhjavaweb.models.user.Category;

@Service
public class CategoryServiceAdmin {
	@Autowired
	private CategoryDaoAdmin categoryDaoAdmin;
	
	public List<Category> GetDataCategory() {
		return categoryDaoAdmin.GetDataCategory();
	}
	
	public Category GetDataCategoryId(int id) {
		return categoryDaoAdmin.GetDataCategoryId(id);	
	}
	
	public void DeleteCategory(int id) {
		categoryDaoAdmin.DeleteCotegory(id);;
	}
	
	public void UpdateCategory(Category category) {
		categoryDaoAdmin.UpdateCategory(category);
	}
	
	public void InsertCategory(Category category) {
		categoryDaoAdmin.InsertCategory(category);
	}
}
