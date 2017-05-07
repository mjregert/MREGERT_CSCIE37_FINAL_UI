package models
{
	public class Wishlist
	{
		public var name: String;
		public var description: String;
		public var total: String;
		public var saving: String;
		public var buyDate: String;
		
		public function Wishlist(json: Object)
		{
			this.name = json["name"];
			this.description = json["description"];
			this.total = json["total"];
			this.saving = json["saving"];
			this.buyDate = json["buyDate"];
		}
	}
}