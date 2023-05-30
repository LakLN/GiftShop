package laptrinhjavaweb.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SameSiteCookieInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie != null) {
                    cookie.setSecure(true);
                    cookie.setHttpOnly(true);
                    // Thêm SameSite attribute vào Cookie
                    cookie.setPath("/*");
                    //cookie.setValue(cookie.getValue() + "; SameSite=Strict"); 
                    response.addCookie(cookie);
//                    response.setHeader("Set-Cookie", cookie.getName() + "=" + cookie.getValue() + "; SameSite=Strict; HttpOnly");
                }
            }
        }
        return true;
    }
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
            ModelAndView modelAndView) throws Exception {
        // Xử lý logic SameSite Cookie tại đây
    	Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie != null) {
                    cookie.setSecure(true);
                    cookie.setHttpOnly(true); 
                    // Thêm SameSite attribute vào Cookie
                    cookie.setPath("/*");
                    //cookie.setValue(cookie.getValue() + "; SameSite=None");
                    response.addCookie(cookie);
//                    response.setHeader("Set-Cookie", cookie.getName() + "=" + cookie.getValue() + "; SameSite=Strict; HttpOnly");
                }
            }
        }
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler,
            Exception ex) throws Exception {
        // Xử lý logic SameSite Cookie tại đây
    	Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie != null) {
                    cookie.setSecure(true);
                    cookie.setHttpOnly(true);
                    // Thêm SameSite attribute vào Cookie
                    cookie.setPath("/*");
                    response.addCookie(cookie);
//                    response.setHeader("Set-Cookie", cookie.getName() + "=" + cookie.getValue() + "; SameSite=Strict; HttpOnly");
                }
            }
        }
    }
}

