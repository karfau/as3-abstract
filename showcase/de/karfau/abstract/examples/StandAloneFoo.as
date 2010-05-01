package de.karfau.abstract.examples
{
	
	public class StandAloneFoo implements IFoo
	{
		
		public function get bar ():String {
			return "My own bar";
		}
		
		public function doFoo (thing:String):void {
			trace(StandAloneFoo + ": I am IFoo all by myself: Doing " + thing + " @ " + bar + ".");
		}
	}
}