package enums;

public enum MensajesExceptionsEnum {
	
	NO_EXISTE(1,"No se encontraron Resultados"),
	ERROR_INESPERADO(2,"Ha Ocurrido un error inesperado en el Servidor"),
	FORMATO_FECHA(3, "La fecha debe ser con el formato yyyy-mm-dd");
	
	int codigo;
	String descripcion;
	
	private MensajesExceptionsEnum(int codigo, String descripcion) {
		this.codigo = codigo;
		this.descripcion = descripcion;
	}

	public int getCodigo() {
		return codigo;
	}

	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	
	

}
