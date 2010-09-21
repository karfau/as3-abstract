package de.karfau.abstract.examples
{
	
	public class ExampleImplementation extends AbstractExample implements IExample
	{
		
		private var _aValue:Object;
		
		public override function get aValue ():Object {
			return _aValue;
		}
		
		public override function set aValue (value:Object):void {
			_aValue = value;
		}
		
		public override function doSomething (one:String, ... two):void {
		/*some logic without calling super.doSomething()*/
		}
	
	}
}