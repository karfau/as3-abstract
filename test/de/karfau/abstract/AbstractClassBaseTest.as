package de.karfau.abstract
{
	import de.karfau.abstract.examples.*;
	
	import org.hamcrest.assertThat;
	import org.hamcrest.core.*;
	import org.hamcrest.object.*;
	import org.hamcrest.text.*;
	
	public class AbstractClassBaseTest
	{
		
		public var instance:Object;
		
		public function get AbstractClass ():Class {
			return AbstractClassExample;
		}
		
		public var error:Error;
		
		[Before]
		public function setUp ():void {
			assertThat(instance, nullValue());
			assertThat(AbstractClass, notNullValue());
			assertThat(error, nullValue());
		}
		
		[Given("An abstract class")]
		[When("the constructor is called without parameters")]
		[Should("throws AbstractError because the class is abstract")]
		[Test]
		public function abstract_definitions_can_not_be_instanciated ():void {
			try {
				instance = new AbstractClass();
			} catch (error:Error) {
				this.error = error;
			}
			verifyErrorTypeAndMessage(AbstractError, [AbstractClass, "abstract"]);
		}
		
		[After]
		public function tearDown ():void {
			instance = null;
			error = null;
		}
		
		protected function verifyErrorTypeAndMessage (expectedType:Class, expectedInMessage:Array):void {
			//assertTrue(error != null && error is expectedType);
			assertThat(error, both(notNullValue(), isA(expectedType)));
			for each (var expected:String in expectedInMessage) {
				//trace(expected);
				assertThat(error.message, containsString(expected));
					//assertTrue(String(error.message).indexOf(expected) > -1);
			}
		}
	
	}
}