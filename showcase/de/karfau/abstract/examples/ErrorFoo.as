package de.karfau.abstract.examples
{
	
	public class ErrorFoo extends AbstractFoo
	{
		public function ErrorFoo (bar:String) {
			super(bar);
		}
		
		public function doFoo (thing:String):void {
			trace(ErrorFoo + ": There is no instance of AbstractFoo that isn't IFoo: Pretending to do " + thing + " @ " + bar + ".");
		}
	}
}