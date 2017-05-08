package models
{
	import flash.globalization.CurrencyFormatter;
	import flash.globalization.DateTimeFormatter;
	
	import mx.collections.ArrayCollection;
	import mx.controls.DateField;
	import mx.core.FlexGlobals;

	[Bindable]
	public class Wishlist
	{
		public var id: Number;
		public var locale: String;
		public var currencySymbol: String;
		public var name: String;
		public var description: String;
		public var total: Number;
		public var totalAsString: String;
		public var saving: Number;
		public var savingAsString: String;
		public var buyDate: Date;
		public var buyDateAsLongString: String;
		public var buyDateAsShortString: String;
		public var wishitems: ArrayCollection;
		
		public function Wishlist(json: Object)
		{
			this.id          = json["id"];
			this.locale      = json["locale"];
			this.name        = json["name"];
			this.description = json["description"];

			// Create c currency formatter object based on the stored locale.
			var cf: CurrencyFormatter = new CurrencyFormatter(locale);
			this.currencySymbol = cf.currencySymbol;
			
			this.total          = json["total"];
			this.totalAsString  = cf.format(this.total, true);
			this.saving         = json["saving"];
			this.savingAsString = cf.format(this.saving, true);
			this.buyDate        = Utilities.stringToDate(json["buyDate"]);
			this.buyDateAsLongString = FlexGlobals.topLevelApplication.dtLongFormatter.format(this.buyDate);
			this.buyDateAsShortString = FlexGlobals.topLevelApplication.dtShortFormatter.format(this.buyDate);
			
			this.wishitems = new ArrayCollection();
			for each (var wishlist:Object in json["wishitems"]) {
				var wishitem: Wishitem = new Wishitem(wishlist);
				wishitem.costAsString = cf.format(wishitem.cost, false);
				wishitems.addItem(wishitem);
			}
		}
	}
}