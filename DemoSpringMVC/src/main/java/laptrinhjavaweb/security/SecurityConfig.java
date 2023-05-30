//package laptrinhjavaweb.security;
//
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.security.config.annotation.web.builders.HttpSecurity;
//
//@Configuration
//public class SecurityConfig{
//    @Bean
//    protected void configure(HttpSecurity http) throws Exception {
//        http
//            .csrf().and()
//            .cors()
//                .disable() // Tắt CSRF (chỉ nên thực hiện trong môi trường đáng tin cậy)
//                .authorizeRequests()
//                    .anyRequest()
//                    .authenticated()
//                .and()
//                .formLogin();
//    }
//}