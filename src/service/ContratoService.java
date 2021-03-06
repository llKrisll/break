package service;

import interfaces.ContratoDAO;

import java.util.ArrayList;
import java.util.List;

import dao.DAOFactory;
import bean.ClienteDTO;
import bean.ContratoDTO;
import bean.FiltroClienteDTO;
import bean.SuministroDTO;

public class ContratoService{
	
	private DAOFactory factory= DAOFactory.getDAOFactory(1);
	private ContratoDAO contrato = factory.getContratoDAO();

	public List<ClienteDTO> listarClientes() {
		return contrato.listarClientes();
	}

	public List<ClienteDTO> listarClientesPorNombre(String nombre,String doc,String nomrep,String aperep) {
		return contrato.listarClientesPorNombre(nombre,doc,nomrep,aperep);
	}

	public ClienteDTO obtenerCliente(int codigo) {
		return contrato.obtenerCliente(codigo);
	}

	public List<ContratoDTO> obtenerContratosPorCliente(int codCliente) {
		return contrato.obtenerContratosPorCliente(codCliente);
	}
	
	public ContratoDTO obtenerContrato(int idContrato){
		return contrato.obtenerContrato(idContrato);
	}

	public boolean generarContrato(int idUsuario, int idSolicitud) {
		return contrato.generarContrato(idUsuario,idSolicitud);
	}

	public ArrayList<ClienteDTO> filtrarClientes(FiltroClienteDTO filtrocliente) {
		return contrato.filtrarClientes(filtrocliente);
	}

	public ClienteDTO mostrarDatosCliente(int idCliente) {
		return contrato.mostrarDatosCliente(idCliente);
	}

	public ArrayList<SuministroDTO> listarSuministrosPorCliente(int idCliente) {
		return contrato.listarSuministrosPorCliente(idCliente);
	}

	public SuministroDTO mostrarDatosSuministro(int idSuministro) {
		return contrato.mostrarDatosSuministro(idSuministro);
	}

}
