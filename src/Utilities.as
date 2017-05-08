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
			var year: String = dateAsString.slice(0, 4);
			var month: String = dateAsString.slice(5, 7); // Fix, month is 1 month off
			var date: String = dateAsString.slice(8, 10);
			var hours: String = dateAsString.slice(11,13);
			var minutes: String = dateAsString.slice(14, 16);
			var seconds: String = dateAsString.slice(17, 19);
			var dateAsUTC: Date = new Date(year, month, date, hours, minutes, seconds);
			return dateAsUTC;
			//FIX var localDate: Date
		}

		static public function dateToString(dateObj: Date): String {
			// Create a new date/time formatter object based on English to store in the DB.
			var dateTimeFormatter:DateTimeFormatter = new DateTimeFormatter("en_US");
			dateTimeFormatter.setDateTimePattern("yyyy-MM-dd HH:mm:ss");
			
			var newSting : String = dateTimeFormatter.format(dateObj).toString();
			
			
			
			var year: Number = dateObj.fullYear;
			var month: Number = dateObj.month;
			var date: Number = dateObj.date;
			var hours: Number = dateObj.hours;
			var minutes: Number = dateObj.minutes;
			var seconds: Number = dateObj.seconds;
			return new String(year + "-" + month + "-" + date);
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