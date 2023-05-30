package laptrinhjavaweb.common;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Component;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
@Component
public class GoogleUtils {
  
  public static String GOOGLE_CLIENT_ID = "675097819608-da01rljvknqvu5otqqb1co7lfc75r3v6.apps.googleusercontent.com";
  public static String GOOGLE_CLIENT_SECRET = "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";
  public static String GOOGLE_REDIRECT_URI = "http://localhost:8080/DemoSpringMVC/login-google";
  public static String GOOGLE_LINK_GET_TOKEN = "https://accounts.google.com/o/oauth2/token";
  public static String GOOGLE_LINK_GET_USER_INFO = "https://www.googleapis.com/oauth2/v1/userinfo?access_token=";
  public static String GOOGLE_GRANT_TYPE = "authorization_code";
  public String getToken(final String code) throws ClientProtocolException, IOException {
    String response = Request.Post(GOOGLE_LINK_GET_TOKEN)
        .bodyForm(Form.form().add("client_id", GOOGLE_CLIENT_ID)
            .add("client_secret", GOOGLE_CLIENT_SECRET)
            .add("redirect_uri", GOOGLE_REDIRECT_URI).add("code", code)
            .add("grant_type", GOOGLE_GRANT_TYPE).build())
        .execute().returnContent().asString();
    ObjectMapper mapper = new ObjectMapper();
    JsonNode node = mapper.readTree(response).get("access_token");
    return node.textValue();
  }
  public GooglePojo getUserInfo(final String accessToken) throws ClientProtocolException, IOException {
    String link = GOOGLE_LINK_GET_USER_INFO + accessToken;
    String response = Request.Get(link).execute().returnContent().asString();
    ObjectMapper mapper = new ObjectMapper();
    GooglePojo googlePojo = mapper.readValue(response, GooglePojo.class);
    System.out.println(googlePojo);
    return googlePojo;
  }
  public UserDetails buildUser(GooglePojo googlePojo) {
    boolean enabled = true;
    boolean accountNonExpired = true;
    boolean credentialsNonExpired = true;
    boolean accountNonLocked = true;
    List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
    authorities.add(new SimpleGrantedAuthority("ROLE_USER"));
    UserDetails userDetail = new User(googlePojo.getEmail(),
        "", enabled, accountNonExpired, credentialsNonExpired, accountNonLocked, authorities);
    return userDetail;
  }
}

