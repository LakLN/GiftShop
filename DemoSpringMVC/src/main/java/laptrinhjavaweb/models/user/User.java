package laptrinhjavaweb.models.user;

import java.sql.Date;

public class User extends AbstractModel<User> {
	private String login_name;
	private String salt;
	private String hashed_passwd;
	private String full_name;
	private String image;
	private int id_gender;
	private Date birthdate;
	private String phone;
	private int id_address;
	private String email;
	private int id_permission;
	private Date last_login_at;
	private boolean is_delete;

	private static final long OTP_VALID_DURATION = 5 * 60 * 1000;
    private String one_time_password; // băm
    private Date otp_requested_time; // thời gian yêu cầu otp
    public boolean isOTPRequired() {
        if (this.getOne_time_password() == null) {
            return false;
        }
         
        long currentTimeInMillis = System.currentTimeMillis();
        long otpRequestedTimeInMillis = this.otp_requested_time.getTime();
         
        if (otpRequestedTimeInMillis + OTP_VALID_DURATION < currentTimeInMillis) {
            // OTP expires
            return false;
        }
         
        return true;
    }
    
    
    
    
    
	public String getLogin_name() {
		return login_name;
	}

	public void setLogin_name(String login_name) {
		this.login_name = login_name;
	}

	public String getFull_name() {
		return full_name;
	}

	public void setFull_name(String full_name) {
		this.full_name = full_name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getSalt() {
		return salt;
	}

	public void setSalt(String salt) {
		this.salt = salt;
	}

	public String getHashed_passwd() {
		return hashed_passwd;
	}

	public void setHashed_passwd(String hashed_passwd) {
		this.hashed_passwd = hashed_passwd;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public int getId_gender() {
		return id_gender;
	}

	public void setId_gender(int id_gender) {
		this.id_gender = id_gender;
	}

	public Date getBirthdate() {
		return birthdate;
	}

	public void setBirthdate(Date birthdate) {
		this.birthdate = birthdate;
	}

	public int getId_address() {
		return id_address;
	}

	public void setId_address(int id_address) {
		this.id_address = id_address;
	}

	public int getId_permission() {
		return id_permission;
	}

	public void setId_permission(int id_permission) {
		this.id_permission = id_permission;
	}

	public Date getLast_login_at() {
		return last_login_at;
	}

	public void setLast_login_at(Date last_login_at) {
		this.last_login_at = last_login_at;
	}

	public boolean isIs_delete() {
		return is_delete;
	}

	public void setIs_delete(boolean is_delete) {
		this.is_delete = is_delete;
	}





	public String getOne_time_password() {
		return one_time_password;
	}





	public void setOne_time_password(String one_time_password) {
		this.one_time_password = one_time_password;
	}





	public Date getOtp_requested_time() {
		return otp_requested_time;
	}





	public void setOtp_requested_time(Date otp_requested_time) {
		this.otp_requested_time = otp_requested_time;
	}

}
