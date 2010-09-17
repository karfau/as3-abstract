package
{
	
	import asunit.core.TextCore;
	import asunit.printers.TextPrinter;
	
	import flash.display.Sprite;
	
	[SWF(widthPercent="100", heightPercent="100", frameRate="31")]
	public class AllTestRunner extends Sprite
	{
		private var core:TextCore;
		
		//private var traceSprite:Sprite;
		
		public function AllTestRunner () {
			super();
			TextPrinter.DEFAULT_HEADER += "\nTestVersion: " + TestVersion.CompileTime;
			/*traceSprite = new Sprite();
				 traceSprite.width=1000;
				 traceSprite.height=680;
				 traceSprite.y = 20;
			 this.addChild(traceSprite);*/
			core = new TextCore();
			core.start(_AllTests, null, this);
		}
	}
}