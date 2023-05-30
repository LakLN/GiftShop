package laptrinhjavaweb.models.user;

import org.springframework.beans.factory.annotation.Autowired;

public class Category  extends AbstractModel<Category> {
	@Autowired
	public AbstractModel<Category> abs;
	
	private String cate_name;
	private String cate_desc;
	private int id_category;

	public String getCate_name() {
		return cate_name;
	}

	public void setCate_name(String cate_name) {
		this.cate_name = cate_name;
	}

	public String getCate_desc() {
		return cate_desc;
	}

	public void setCate_desc(String cate_desc) {
		this.cate_desc = cate_desc;
	}

	public int getId_category() {
		return id_category;

	}

	public void setId_category(int id_category) {
		this.id_category = id_category;
	}
}