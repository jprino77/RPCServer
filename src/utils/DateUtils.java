package utils;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Locale;

import enums.MensajesExceptionsEnum;
import server.GenericException;

public class DateUtils {
	/**
	 * Metodoo que transforma un string que viene en un formato yyyy-MM-dd a
	 * LocalDate
	 * 
	 * Tambien se utiliza para validar que el formato del string venga en el formato
	 * esperado desde el cliente de no venir en el formato esperado lanzara una
	 * excepcion
	 * 
	 * @param fecha
	 * @return
	 * @throws GenericException
	 */
	public static LocalDate formatDate(String fecha) throws GenericException {
		LocalDate formatDate = null;
		try {
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd", Locale.ENGLISH);

			formatDate = LocalDate.parse(fecha, formatter);

		} catch (Exception e) {

			GenericException ns = new GenericException();
			ns.setCodigo(MensajesExceptionsEnum.FORMATO_FECHA.getCodigo());
			ns.setDescripcion(MensajesExceptionsEnum.FORMATO_FECHA.getDescripcion());

			throw ns;
		}

		return formatDate;
	}

}
