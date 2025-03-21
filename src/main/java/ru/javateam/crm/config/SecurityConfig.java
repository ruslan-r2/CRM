package ru.javateam.crm.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import ru.javateam.crm.service.UserService;

@Configuration
@EnableWebSecurity
@EnableMethodSecurity
public class SecurityConfig {

    @Autowired
    UserService userService;

    @Bean
    public BCryptPasswordEncoder bCryptPasswordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http
                .authorizeHttpRequests(rmr -> rmr
                        .requestMatchers("/registration").not().fullyAuthenticated()
                        .requestMatchers("/admin").hasRole("ADMIN")
                        .requestMatchers("/news").hasRole("USER")
                        .requestMatchers("/").anonymous()
                        .anyRequest().authenticated()
                )
                .sessionManagement(smc -> smc
                .sessionCreationPolicy(SessionCreationPolicy.ALWAYS)

        ).formLogin(form ->
                        form.loginPage("/login")
                        .defaultSuccessUrl("/")
                        .permitAll()

        ).logout(out ->
                        out.logoutUrl("/logout")
                        .invalidateHttpSession(true)
                        .deleteCookies("JSESSIONID")
                        .logoutSuccessUrl("/")
                        .permitAll()
        );

        return http.build();
    }

    @Autowired
    protected void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userService).passwordEncoder(bCryptPasswordEncoder());
        //auth.userDetailsService(userService).passwordEncoder(NoOpPasswordEncoder.getInstance());
    }

}