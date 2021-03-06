package service;

import java.util.List;

import bean.DetalleSolCambioCatDTO;
import bean.SolicitudCambioCatDTO;
import interfaces.CC_SolicitudDAO;
import dao.DAOFactory;

public class CC_SolicitudService {
	
	private DAOFactory factory= DAOFactory.getDAOFactory(1);
	private CC_SolicitudDAO solCCDao = factory.getCc_SolicitudDAO();
	
	
	public boolean registrarSolicitudCC(SolicitudCambioCatDTO solicitudcc) {
		return solCCDao.registrarSolicitudCC(solicitudcc);
	}
	
	public void actualizarEstadoSolicitudCC(DetalleSolCambioCatDTO detallescc) {
		solCCDao.actualizarEstadoSolicitudCC(detallescc);
	}
	
	public List<SolicitudCambioCatDTO> listarSolicitudesporEstado(int estado) {
		return solCCDao.listarSolicitudesporEstado(estado);
	}
	
	public List<DetalleSolCambioCatDTO> detallesSolicitudCC(int idSolicc) {
		return solCCDao.detallesSolicitudCC(idSolicc);
	}
	
	public DetalleSolCambioCatDTO obtenerDetalleSolCC(int idSolidd, int estado) {
		return solCCDao.obtenerDetalleSolCC(idSolidd, estado);
	}

	public int obtenerEstadoSCC(int idSuministro) {
		return solCCDao.obtenerEstadoSCC(idSuministro);
	}

	public SolicitudCambioCatDTO obtenerSolicitud(int idSolicitud) {
		return solCCDao.obtenerSolicitud(idSolicitud);
	}

}
