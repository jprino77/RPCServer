package dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import server.Deporte;
import server.Filial;
import server.Usuario;

public class Dao {
	
	private static final String crearUsuario = "call CREAR_USUARIO(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, '00')";
	
	private static final String getFiliales = "select id, nombre from filial;";
	
	private static final String getDeportesByFilialId = "select distinct de.id, de.descripcion from cancha ca "
			+ " inner join deporte de on de.id = ca.deporte_id" + " where ca.filial_id =  ?";
	
	private static final String getNombreUsuarioFromId = " select nombre from usuario where numero_afiliado_legajo = ? ";
	
	public boolean crearUsuario(Usuario usuario, Connection con) throws SQLException {

		CallableStatement statement = con.prepareCall(crearUsuario);
		statement.setString(1, usuario.getNombre());
		statement.setString(2, usuario.getApellido());
		statement.setString(3, usuario.getCalle());
		statement.setInt(4, usuario.getAltura());
		statement.setInt(5, usuario.getLocalidad());
		statement.setString(6, usuario.getTelefono());
		statement.setString(7, usuario.getEmail());
		statement.setDate(8, Date.valueOf(usuario.getFechaNAcimiento()));
		statement.setString(9, usuario.getUsuario());
		statement.setString(10, usuario.getClave());

		
		return statement.execute();

	}
	
	public List<Filial> buscarFiliales(Connection con) throws SQLException {
		List<Filial> filialList = new ArrayList<Filial>();

		PreparedStatement statement = con.prepareStatement(getFiliales);

		ResultSet rs = statement.executeQuery();

		while (rs.next()) {
			Filial filial = new Filial();

			filial.setId(rs.getInt("id"));
			filial.setNombre(rs.getString("nombre"));

			filialList.add(filial);
		}
		return filialList;
	}
	
	public List<Deporte> buscarDeporteByFilialId(int filialId, Connection con) throws SQLException {
		List<Deporte> deporteList = new ArrayList<Deporte>();

		PreparedStatement statement = con.prepareStatement(getDeportesByFilialId);
		statement.setInt(1, filialId);
		ResultSet rs = statement.executeQuery();

		while (rs.next()) {
			Deporte deporte = new Deporte();

			deporte.setId(rs.getInt("id"));
			deporte.setDescripcion(rs.getString("descripcion"));

			deporteList.add(deporte);
		}
		return deporteList;
	}
	
	public String getNombreUsuarioFromId(int id, Connection con) throws SQLException {
		String respuesta = "";
		
		PreparedStatement statement = con.prepareStatement(getNombreUsuarioFromId);
		statement.setInt(1, id);
		
		ResultSet rs = statement.executeQuery();

		while (rs.next()) {

			respuesta = rs.getString("nombre");

		}
		
		return respuesta;
		
	}

}
