package mx.com.personal.springboot.app.models.dao;

import org.springframework.data.repository.CrudRepository;

import mx.com.personal.springboot.app.models.entity.Usuario;

public interface IUserDAO extends CrudRepository<Usuario, Long> {
	Usuario findByUsername(String username);//Implementa la consulta por nombre del metodo
}
