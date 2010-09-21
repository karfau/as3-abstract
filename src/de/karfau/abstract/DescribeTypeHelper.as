package de.karfau.abstract
{
	import flash.utils.describeType;
	
	public class DescribeTypeHelper
	{
		private static const describeAccessors:Object = {readwrite: "get/set ", readonly: "get ", writeonly: "set "};
		
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
		
		public function getMethodsWithMetadata (searchName:String):Array {
			var result:Array = [];
			var filtered:XMLList = typeXML.method;
			for each (var method:XML in filtered)
				if (XMLList(method.metadata.(@name == searchName)).length() > 0)
					result[result.length] = method.@name[0].toString();
			return result;
		}
		
		public function getAccessorsWithMetadata (searchName:String):Array {
			var result:Array = [];
			var filtered:XMLList = typeXML.accessor;
			for each (var method:XML in filtered)
				if (XMLList(method.metadata.(@name == searchName)).length() > 0)
					result[result.length] = describeAccessors[method.@access[0].toString()] + method.@name[0].toString();
			return result;
		}
	
	}
}