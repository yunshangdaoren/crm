package crm;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.sun.jmx.snmp.Timestamp;
import com.sun.org.apache.bcel.internal.generic.NEW;

public class Test {

	public static void main(String[] args) throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date date = null;
		try {
			date = sdf.parse("2019-09-21");
		} catch (ParseException e) {
			e.printStackTrace();
		}
		Date scBirth = new Date(date.getTime());
		System.out.println(scBirth.toString());
		
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		System.out.println(timestamp.getDateTime());
	}

}
