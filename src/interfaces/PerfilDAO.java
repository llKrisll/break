package interfaces;

import java.util.List;
import bean.PerfilDTO;

public interface PerfilDAO {
	
	public void registrarPerfil(PerfilDTO perfil);
	
	public void modificarPerfil(PerfilDTO perfil);
	
	public List<PerfilDTO> listarPerfiles();
	
	public void eliminarPerfil(int idPerfil);
	
	public PerfilDTO buscarPorId(int idPerfil);
	
	
	
}