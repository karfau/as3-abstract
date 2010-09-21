package de.karfau.abstract.examples
{
	
	public class ExampleImplementation extends AbstractExample
	{
		
		private var _testing:Boolean;
		
		public function get testing ():Boolean {
			return _testing;
		}
		
		public function set testing (value:Boolean):void {
			_testing = value;
		}
		
		public function ExampleImplementation () {
			super();
		}
		
		public override function get aValue ():Object {
			return super.aValue;
		}
		
		/*public override function set aValue (value:Object):void {
			 //TODO Auto-generated method stub
			 super.aValue = value;
		 }*/
		
		public function set anotherValue (value:Object):void {
			//TODO Auto-generated method stub
			super.aValue = value;
		}
		
		public function doSomthingElse (test:String):String {
			return "else";
		}
	}
}