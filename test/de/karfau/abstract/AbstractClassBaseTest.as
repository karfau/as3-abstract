package de.karfau.abstract
{
	import de.karfau.abstract.examples.*;
	
	import org.hamcrest.assertThat;
	import org.hamcrest.core.*;
	import org.hamcrest.object.*;
	import org.hamcrest.text.*;
	
	public class AbstractClassBaseTest extends BaseTest
	{
		
		public function get AbstractClass ():Class {
			return AbstractExample;
		}
		
		[Before]
		override public function setUp ():void {
			super.setUp();
			assertThat(AbstractClass, notNullValue());
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
	
	}
}