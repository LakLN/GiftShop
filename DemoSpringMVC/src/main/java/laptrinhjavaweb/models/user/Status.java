package laptrinhjavaweb.models.user;

public class Status extends AbstractModel<Status> {
	private String status_name;
	private String desc_status;

	public String getStatus_name() {
		return status_name;
	}

	public void setStatus_name(String status_name) {
		this.status_name = status_name;
	}

	public String getDesc_status() {
		return desc_status;
	}

	public void setDesc_status(String desc_status) {
		this.desc_status = desc_status;
	}
}
