package de.karfau.abstract
{
	
	import de.karfau.abstract.examples.*;
	
	import org.hamcrest.assertThat;
	import org.hamcrest.core.*;
	import org.hamcrest.object.*;
	import org.hamcrest.text.*;
	
	public class ImplementationBaseTest extends BaseTest
	{
		
		[Test]
		[Given("A subclass of AbstractExample that implements IExample")]
		[And("methods have the metadata [Abstract]")]
		[When("the constructor is called ")]
		[Should("throw an AbstractError because those methods are not overwritten")]
		public function recognizes_abstract_methods ():void {
			try {
				instance = new ExampleIncompleteImplementation();
			} catch (error:Error) {
				this.error = error;
			}
			assertThat(instance, nullValue());
			verifyErrorTypeAndMessage(AbstractError, [ExampleIncompleteImplementation, "abstract", "methods", "doSomething", "get/set aValue"]);
		}
		
		[Test]
		[Given("A subclass of AbstractExample htat overwrites all abstract methods")]
		[When("the constructor is called")]
		[Should("create an instance")]
		public function creating_an_instance_of_a_implementation_is_possible ():void {
			instance = new ExampleImplementation();
			assertThat(instance, notNullValue());
		}
	
	}
}