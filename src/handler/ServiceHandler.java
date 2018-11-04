package handler;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.thrift.TException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dao.Dao;
import server.Deporte;
import server.Filial;
import server.GenericException;
import server.NoSeEncontraronResultadosException;
import server.Service.Iface;
import server.Usuario;

public class ServiceHandler implements Iface {
	
	final static Logger logger = LoggerFactory.getLogger(ServiceHandler.class);


	String odbcDrive = "sun.jdbc.odbc.JdbcOdbcDriver";
	String db = "jdbc:odbc:db_los_amigos";
	
	@Override
	public String getNombreUsuarioFromId(int id) throws NoSeEncontraronResultadosException, TException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean crearUsuario(Usuario usuario) throws GenericException, TException {
		logger.info("Inico existeUsuario");
		Connection con = null;
		boolean exito = false;
		Dao dao = new Dao();
		
		try {
			/**
			 * Se abre coneccion aca porque dentro de un mismo servicio podrias tener
			 * multiples llamados a daos de esta forma ahorras abrir varias y cerrar
			 * conecciones por cada uno
			 */
			Class.forName(odbcDrive);
			con = DriverManager.getConnection(db);

			exito=  dao.crearUsuario(usuario, con);

		} catch (ClassNotFoundException e) {
			logger.error("Eror al cargar driver");
			e.printStackTrace();
		} catch (SQLException e) {
			logger.error("Eror al ejecutar query");
			e.printStackTrace();
		} finally {
			try {
				con.close();

			} catch (SQLException e) {
				logger.error("Eror al cerrar coneccion");
				e.printStackTrace();
			}
		}
		
		return exito;
	}

	@Override
	public List<Filial> buscarFiliales() throws NoSeEncontraronResultadosException, TException {
		logger.info("Inico buscarFiliales");

		List<Filial> filial = new ArrayList<Filial>();
		Connection con = null;
		Dao dao = new Dao();
		try {
			/**
			 * Se abre coneccion aca porque dentro de un mismo servicio podrias tener
			 * multiples llamados a daos de esta forma ahorras abrir varias y cerrar
			 * conecciones por cada uno
			 */
			Class.forName(this.odbcDrive);
			con = DriverManager.getConnection(this.db);

			filial = dao.buscarFiliales(con);
			
			

		} catch (ClassNotFoundException e) {
			logger.error("Eror al cargar driver");
			e.printStackTrace();
		} catch (SQLException e) {
			logger.error("Eror al ejecutar query");
			e.printStackTrace();
		} finally {
			try {
				con.close();

			} catch (SQLException e) {
				logger.error("Eror al cerrar coneccion");
				e.printStackTrace();
			}
		}
		
		if(filial.isEmpty()) {
			NoSeEncontraronResultadosException e = new NoSeEncontraronResultadosException();
			e.setCodigo(1);
			e.setDescripcion("Buescar Filiales: No Se encontraron Resultados");
			
			throw e;
		}
		return filial;
	}

	@Override
	public List<Deporte> buscarDeporteByFilialId(int filialId) throws NoSeEncontraronResultadosException, TException {
		
		logger.info("Inico busqueda deportes filaiid: " + filialId);
		List<Deporte> deporte = new ArrayList<Deporte>();
		Connection con = null;
		Dao dao = new Dao();

		try {
			Class.forName(odbcDrive);
			con = DriverManager.getConnection(db);

			deporte =  dao.buscarDeporteByFilialId(filialId, con);

		} catch (ClassNotFoundException e) {
			logger.error("Eror al cargar driver");
			e.printStackTrace();
		} catch (SQLException e) {
			logger.error("Eror al ejecutar query");
			e.printStackTrace();
		} finally {
			try {
				con.close();

			} catch (SQLException e) {
				logger.error("Eror al cerrar coneccion");
				e.printStackTrace();
			}
		}
		
		if(deporte.isEmpty()) {
			NoSeEncontraronResultadosException e = new NoSeEncontraronResultadosException();
			e.setCodigo(1);
			e.setDescripcion("Buscar DeportesFiliakId: No Se encontraron Resultados");
			
			throw e;
		}
		
		return deporte;
	}

	@Override
	public Filial getFilialById(int id) throws NoSeEncontraronResultadosException, TException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Deporte getDeporteById(int id) throws NoSeEncontraronResultadosException, TException {
		// TODO Auto-generated method stub
		return null;
	}



}
