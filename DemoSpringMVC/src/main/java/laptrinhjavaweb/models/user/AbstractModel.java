package laptrinhjavaweb.models.user;

import java.sql.Timestamp;

import org.springframework.beans.factory.annotation.Autowired;

public class AbstractModel<T> {
	
	@Autowired
	private int id;
	private Timestamp create_at;
	private Timestamp update_at;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Timestamp getCreate_at() {
		return create_at;
	}

	public void setCreate_at(Timestamp created_at) {
		this.create_at = created_at;
	}

	public Timestamp getUpdate_at() {
		return update_at;
	}

	public void setUpdate_at(Timestamp update_at) {
		this.update_at = update_at;
	}


}
