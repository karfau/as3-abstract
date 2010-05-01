package
{
	import de.karfau.abstract.examples.*;
	
	import flash.display.Sprite;
	
	public class Main extends Sprite
	{
		public const NORMAL_BAR:String = "Normal bar";
		
		public function Main () {
			
			var tests:Array = [
				function ():AbstractObject {
					trace("Creating an instance of", AbstractObject, "by passing null as abstractType and no forcedInterface :");
					return new AbstractObject(null);
				},
				function ():AbstractObject {
					//abstractType should be defined in the abstract class, else the following will be possible:
					trace("Creating an instance of", AbstractObject, "by passing IAbstract as abstractType and no forcedInterface :");
					return new AbstractObject(IAbstract);
				},
				function ():AbstractFoo {
					return new AbstractFoo(null);
				},
				function ():AbstractFoo {
					return new AbstractFoo("Abstract bar");
				},
				function ():ErrorFoo {
					return new ErrorFoo(NORMAL_BAR);
				},
				function ():CleverFoo {
					return new CleverFoo(NORMAL_BAR);
				},
				function ():CleverFoo {
					return new CleverFoo();
				},
				function ():StandAloneFoo {
					return new StandAloneFoo();
				}
				];
			
			//trace("Creating an instance of", AbstractObject, "(giving it IAbstract as abstractType)");
			var experiment:Object;
			var i:uint = 1;
			var len:uint = tests.length;
			for each (var func:Function in tests) {
				try {
					trace("Starting test #" + i++ + "/" + len);
					experiment = func();
					if (experiment is AbstractFoo)
						experiment.doFoo("relax");
					else
						trace("The class of the created object is", experiment.constructor, "and the instance is", experiment);
				} catch (error:Error) {
					trace(error.message);
						//trace(error.getStackTrace());
				}
				trace();
			}
		
		/*
			 Starting test #1/8
			 Creating an instance of [class AbstractObject] by passing null as abstractType and no forcedInterface :
			 Error verifying abstraction : one of (*thisObject | *abstractType) was NULL: <[object AbstractObject],>
		
			 Starting test #2/8
			 Creating an instance of [class AbstractObject] by passing IAbstract as abstractType and no forcedInterface :
			 The class of the created object is [class AbstractObject] and the instance is [object AbstractObject]
		
			 Starting test #3/8
			 Error creating instance of [class AbstractFoo]: [class AbstractFoo] is an abstract class, extend it to implement [class IFoo].
		
			 Starting test #4/8
			 Error creating instance of [class AbstractFoo]: [class AbstractFoo] is an abstract class, extend it to implement [class IFoo].
		
			 Starting test #5/8
			 Error creating instance of [class ErrorFoo]: [class AbstractFoo] is an abstract class, extend it to implement [class IFoo].
		
			 Starting test #6/8
			 created IFoo [object CleverFoo] with bar Normal bar
			 [class CleverFoo]: I use AbstractFoo to be IFoo (verified at instantiation): Doing relax @ Normal bar.
		
			 Starting test #7/8
			 created IFoo [object CleverFoo] with bar Clever Bar
			 [class CleverFoo]: I use AbstractFoo to be IFoo (verified at instantiation): Doing relax @ Clever Bar.
		
			 Starting test #8/8
			 The class of the created object is [class StandAloneFoo] and the instance is [object StandAloneFoo]
		
		
		 */
		
		}
	
	}
}