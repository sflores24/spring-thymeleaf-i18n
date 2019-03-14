package mx.com.personal.springboot.app;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.User.UserBuilder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;

import mx.com.personal.springboot.app.auth.handler.LoginSuccessHandler;
import mx.com.personal.springboot.app.models.service.impl.JPAUserDetailsService;
@EnableGlobalMethodSecurity(securedEnabled=true, prePostEnabled=true) //Para habilitar las anotaciones de seguridad y se puede usar solo el securedEnabled
@Configuration
public class SpringSecurityConfig extends WebSecurityConfigurerAdapter {
	private static final String USER_QRY = "SELECT username, password, enabled FROM users WHERE username = ?";
	private static final String AUTHORITY_QRY = "SELECT u.username, a.authority FROM authorities a INNER JOIN users u ON (a.user_id = u.id) WHERE u.username = ?";

	@Autowired
	private LoginSuccessHandler successHandler;
	
	@Autowired 
	private DataSource dataSource;
	
	@Autowired
	private JPAUserDetailsService userDetailsService;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	

	// Creación de usuarios
	@Autowired
	public void configureGlobal(AuthenticationManagerBuilder build) throws Exception {
		build.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder);
		/*Configuración con jdbc
		build.jdbcAuthentication()
			.dataSource(dataSource).passwordEncoder(passwordEncoder)
			.usersByUsernameQuery(USER_QRY)
			.authoritiesByUsernameQuery(AUTHORITY_QRY);
			*/
		/*//Configuración en memoria
		PasswordEncoder encoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
		UserBuilder users = User.builder().passwordEncoder(encoder::encode);
		
		//Usuarios en memoria
		build.inMemoryAuthentication()
			.withUser(users.username("admin").password("12345").roles(ROLE_ADMIN, ROLE_USER))
			.withUser(users.username("chava").password("12345").roles(ROLE_USER));
		*/
	}
	
	//Autorizaciones
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		//Las rutas publicas hasta donde esta el permitAll
		http.authorizeRequests()
			.antMatchers("/", "/css/**", "/js/**", "/imgs/**", "/client/listar", "/client/list", "/locale").permitAll()
//			.antMatchers("/client/ver/**", "/client/uploads/**").hasAnyRole(ROLE_USER)
//			.antMatchers("/client/form/**", "/client/eliminar/**", "/factura/**").hasAnyRole(ROLE_ADMIN)
			.anyRequest().authenticated()
			.and()
				.formLogin()
					.successHandler(successHandler)
					.loginPage("/login").permitAll()
			.and()
				.logout().permitAll()
			.and()
				.exceptionHandling().accessDeniedPage(Constants.ERROR_403);
	}
}
