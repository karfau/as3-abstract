package de.karfau.abstract.examples
{
	
	public class CleverFoo extends AbstractFoo implements IFoo
	{
		public function CleverFoo (bar:String=null) {
			super(bar == null ? "Clever Bar" : bar);
		}
		
		public function doFoo (thing:String):void {
			trace(clazz + ": I use AbstractFoo to be IFoo (verified at instantiation): Doing " + thing + " @ " + bar + ".");
		}
	}
}