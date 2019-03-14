package mx.com.personal.springboot.app.models.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import mx.com.personal.springboot.app.models.dao.IUserDAO;
import mx.com.personal.springboot.app.models.entity.Role;
import mx.com.personal.springboot.app.models.entity.Usuario;

/**
 * Esta clase se utiliza para implementar el JPA en el spring security
 * @author chava
 *
 */
@Service("jpaUserDetailsService")
public class JPAUserDetailsService implements UserDetailsService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private IUserDAO userDAO;
	
	@Override
	@Transactional(readOnly=true)
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		Usuario usuario = userDAO.findByUsername(username);
		
		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
		
		if(usuario != null) {
			for(Role role : usuario.getRoles()) {
				authorities.add(new SimpleGrantedAuthority(role.getAuthority()));
			}
		} else {
			logger.error("Usuario no existe " + username);
			throw new UsernameNotFoundException("Usuario no existe"); 
		}
		
		if(authorities.isEmpty()) {
			logger.error("No tiene roles asociados el usuario " + username);
			throw new UsernameNotFoundException("Sin Roles");
		}
		
		return new User(usuario.getUsername(), usuario.getPassword(), usuario.getEnabled(), 
				true, true, true, authorities);
	}

}
