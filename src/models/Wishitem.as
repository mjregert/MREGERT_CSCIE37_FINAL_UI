package models
{
	public class Wishitem
	{
		public var id: Number;
		public var name: String;
		public var cost: Number;
		public var costAsString: String;
		
		public function Wishitem(json: Object)
		{
			this.id   = json["id"];
			this.name = json["name"];
			this.cost = json["cost"];
		}
	}
}