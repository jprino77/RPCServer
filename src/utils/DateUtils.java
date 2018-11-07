package utils;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import enums.MensajesExceptionsEnum;
import server.NoSeEncontraronResultadosException;

public class DateUtils {

	public static String formatDate(String fecha) throws NoSeEncontraronResultadosException {
		String format = "";
		try {
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

			LocalDateTime formatDateTime = LocalDateTime.parse(fecha, formatter);
			
			format =  formatDateTime.format(formatter);
		} catch (Exception e) {
			
			NoSeEncontraronResultadosException ns = new NoSeEncontraronResultadosException();
			ns.setCodigo(MensajesExceptionsEnum.FORMATO_FECHA.getCodigo());
			ns.setDescripcion(MensajesExceptionsEnum.FORMATO_FECHA.getDescripcion());
			
			throw ns;
		}

		
		return format;
	}

}
