package
{
	import flash.globalization.DateTimeFormatter;
	import flash.globalization.DateTimeStyle;

	public class Utilities
	{
		public function Utilities()
		{
		}

		static public function stringToDate(dateAsString: String): Date {
			var yearInUTC: Number    = Number(dateAsString.slice(0, 4));
			var monthInUTC: Number   = Number(dateAsString.slice(5, 7));
			var dateInUTC: Number    = Number(dateAsString.slice(8, 10));
			var hoursInUTC: Number   = Number(dateAsString.slice(11,13));
			var minutesInUTC: Number = Number(dateAsString.slice(14, 16));
			var secondsInUTC: Number = Number(dateAsString.slice(17, 19));
			var date: Date = new Date();
			date.fullYearUTC = yearInUTC;
			date.monthUTC = monthInUTC;
			date.dateUTC = dateInUTC;
			date.hoursUTC = hoursInUTC;
			date.minutesUTC = minutesInUTC;
			date.secondsUTC = secondsInUTC;
			return date;
		}

		static public function dateToString(dateObj: Date): String {
			var yearInUTC: Number    = dateObj.fullYearUTC;
			var monthInUTC: Number   = dateObj.monthUTC - 1; // Another Flex bug, this returns the next month (nov. returns dec., etc.)
			var dateInUTC: Number    = dateObj.dateUTC;
			var hoursInUTC: Number   = dateObj.hoursUTC;
			var minutesInUTC: Number = dateObj.minutesUTC;
			var secondsInUTC: Number = dateObj.secondsUTC;
			// Convert the selecte date and time to UTC for storing
			var dateAsUTC: Date = new Date(yearInUTC, monthInUTC, dateInUTC, hoursInUTC, minutesInUTC, secondsInUTC);
			// Create a new date/time formatter object based on English to store in the DB.
			var dateTimeFormatter:DateTimeFormatter = new DateTimeFormatter("en_US");
			dateTimeFormatter.setDateTimePattern("yyyy-MM-dd HH:mm:ss");
			return dateTimeFormatter.format(dateAsUTC).toString();
		}
		
		static public function vectorToArray(v: Object): Array {
			var ret: Array = new Array();
			for each(var str: String in v) {
				ret.push(str);
			}
			return ret;
		}

}
}