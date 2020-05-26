package com.Projektas.EventSearchPlatform;

import com.Projektas.EventSearchPlatform.AuthenticationService.NoRedirectStrategy;
import com.Projektas.EventSearchPlatform.AuthenticationService.TokenAuthenticationFilter;
import com.Projektas.EventSearchPlatform.AuthenticationService.TokenAuthenticationProvider;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpStatus;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.web.AuthenticationEntryPoint;
import org.springframework.security.web.authentication.AnonymousAuthenticationFilter;
import org.springframework.security.web.authentication.HttpStatusEntryPoint;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
import org.springframework.security.web.util.matcher.OrRequestMatcher;
import org.springframework.security.web.util.matcher.RequestMatcher;

import java.util.Objects;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    private static final RequestMatcher PUBLIC_URLS = new OrRequestMatcher(
            new AntPathRequestMatcher("/access/**", "POST"),
            new AntPathRequestMatcher("/public/**", "GET"),
            new AntPathRequestMatcher("/event/**", "GET"),
            new AntPathRequestMatcher("/place/**", "GET"),
            new AntPathRequestMatcher("/utils/**", "GET"),
            new AntPathRequestMatcher("/media/**", "GET"),
            new AntPathRequestMatcher("/user/current", "GET"),
            new AntPathRequestMatcher("/user/logout", "GET")
    );
    private static final RequestMatcher PROTECTED_URLS = new OrRequestMatcher(
            new AntPathRequestMatcher("/admin/**"),
            new AntPathRequestMatcher("/user/**"),
            new AntPathRequestMatcher("/**", "POST"),
            new AntPathRequestMatcher("/**", "PUT"),
            new AntPathRequestMatcher("/**", "DELETE"));

    private static final RequestMatcher USER_URLS = new OrRequestMatcher(
            new AntPathRequestMatcher("/**", "POST"),
            new AntPathRequestMatcher("/**", "PUT"),
            new AntPathRequestMatcher("/**", "DELETE"));

    private static final RequestMatcher ADMIN_URLS = new OrRequestMatcher(
            new AntPathRequestMatcher("/admin/**"),
            new AntPathRequestMatcher("/user/**"));

    TokenAuthenticationProvider provider;

    SecurityConfig(final TokenAuthenticationProvider provider){
        super();
        this.provider = Objects.requireNonNull(provider);
    }

//    @Autowired
//    @Qualifier("userDetailsServiceImpl")
//    UserDetailsService userDetailsService;


    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.authenticationProvider(provider);
        //auth.userDetailsService(userDetailsService);
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
                .sessionManagement()
                .sessionCreationPolicy(SessionCreationPolicy.STATELESS)
                .and()
                .exceptionHandling()
                .defaultAuthenticationEntryPointFor(forbiddenEntryPoint(), PROTECTED_URLS)
                .and()
                .authenticationProvider(provider)
                .addFilterBefore(restAuthenticationFilter(), AnonymousAuthenticationFilter.class)
                .authorizeRequests()
                .requestMatchers(ADMIN_URLS)
                .hasAuthority("ADMIN")
                .requestMatchers(USER_URLS)
                .hasAnyAuthority("USER", "ADMIN")
                .and()
                .csrf().disable()
                .formLogin().disable()
                .httpBasic().disable()
                .logout().disable();
    }

    @Override
    public void configure(WebSecurity web) throws Exception {
        web.ignoring().requestMatchers(PUBLIC_URLS);
    }
    @Bean
    TokenAuthenticationFilter restAuthenticationFilter() throws Exception {
        final TokenAuthenticationFilter filter = new TokenAuthenticationFilter(PROTECTED_URLS);
        filter.setAuthenticationManager(authenticationManager());
        filter.setAuthenticationSuccessHandler(successHandler());
        return filter;
    }

    @Bean
    SimpleUrlAuthenticationSuccessHandler successHandler() {
        final SimpleUrlAuthenticationSuccessHandler successHandler = new SimpleUrlAuthenticationSuccessHandler();
        successHandler.setRedirectStrategy(new NoRedirectStrategy());
        return successHandler;
    }

    /**
     * Disable Spring boot automatic filter registration.
     */
    @Bean
    FilterRegistrationBean disableAutoRegistration(final TokenAuthenticationFilter filter) {
        final FilterRegistrationBean registration = new FilterRegistrationBean(filter);
        registration.setEnabled(false);
        return registration;
    }

    @Bean
    AuthenticationEntryPoint forbiddenEntryPoint() {
        return new HttpStatusEntryPoint(HttpStatus.FORBIDDEN);
    }
}
