package de.karfau.abstract.examples
{
	
	public class AbstractFoo extends AbstractObject //implements IFoo
	{
		public function AbstractFoo (bar:String) {
			super(AbstractFoo, IFoo);
			this.bar = bar;
			trace("created IFoo", abstract::thisFoo, "with bar", abstract::thisFoo.bar);
		}
		
		private var _bar:String;
		
		public function get bar ():String {
			return _bar;
		}
		
		public function set bar (value:String):void {
			_bar = value;
		}
		
		abstract function get thisFoo ():IFoo {
			var result:IFoo = IFoo(this);
			var test:String = IFoo(this).bar;
			return result;
		
		}
	
	}
}