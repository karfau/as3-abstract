package de.karfau.abstract.examples
{
	
	public class ExampleIncompleteImplementation extends AbstractExample
	{
		
		public function ExampleIncompleteImplementation () {
			super();
		}
		
		public override function get aValue ():Object {
			return super.aValue;
		}
		
		/*public override function set aValue (value:Object):void {
			 super.aValue = value;
		 }*/
		
		public function set anotherValue (value:Object):void {
		}
		
		public function doSomthingElse (test:String):String {
			return "else";
		}
	}
}