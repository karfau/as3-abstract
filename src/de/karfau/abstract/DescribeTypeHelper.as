package de.karfau.abstract
{
	import flash.utils.describeType;
	
	public class DescribeTypeHelper
	{
		
		private var _typeXML:XML = null;
		
		public function get typeXML ():XML {
			return _typeXML;
		}
		
		public function DescribeTypeHelper (objectOrType:Object) {
			_typeXML = describeType(objectOrType);
		}
		
		public function hasMetadata (searchName:String):Boolean {
			var result:XMLList = typeXML..metadata.(@name == searchName);
			return result.length() > 0;
		}
	
	}
}