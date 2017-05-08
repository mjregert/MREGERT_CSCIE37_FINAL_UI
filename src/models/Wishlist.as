package models
{
	import flash.globalization.CurrencyFormatter;
	import flash.globalization.DateTimeFormatter;
	import flash.globalization.DateTimeStyle;
	
	import mx.controls.DateField;

	[Bindable]
	public class Wishlist
	{
		public var ll: String;
		public var cc: String;
		public var name: String;
		public var description: String;
		public var total: String;
		public var saving: String;
		public var buyDate: String;
		
		public function Wishlist(json: Object)
		{
			this.ll = json["ll"];
			this.cc = json["cc"];
			var locale: String = ll + "_" + cc;

			this.name = json["name"];
			this.description = json["description"];

			// Create a currency formatter object based on the preferred locale.
			var currencyFormatter: CurrencyFormatter = new CurrencyFormatter(locale);
			// Format, passing true which tells it to show the currency suymbol ($, Yen, Euro, etc.)
			this.total = currencyFormatter.format(json["total"], true);
			this.saving = currencyFormatter.format(json["saving"], true);
			
			// Create a new date/time formatter object based on the preferred locale.
			var dateTimeFormatter:DateTimeFormatter = new DateTimeFormatter(locale, DateTimeStyle.LONG, DateTimeStyle.NONE);
			var buyDate: Date = Utilities.stringToDate(json["buyDate"]);
			this.buyDate = dateTimeFormatter.format(buyDate);
			// FIX, this date is off
		}
	}
}