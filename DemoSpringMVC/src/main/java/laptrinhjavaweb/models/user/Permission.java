package laptrinhjavaweb.models.user;

public class Permission extends AbstractModel<Permission> {
	private String permission_name;
	private String desc_permission;

	public String getPermission_name() {
		return permission_name;
	}

	public void setPermission_name(String permission_name) {
		this.permission_name = permission_name;
	}

	public String getDesc_permission() {
		return desc_permission;
	}

	public void setDesc_permission(String desc_permission) {
		this.desc_permission = desc_permission;
	}
}
