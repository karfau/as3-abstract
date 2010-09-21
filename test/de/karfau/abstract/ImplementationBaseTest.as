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
		[Given("A subclass of AbstractExample")]
		[When("the constructor is called")]
		[Should("create an instance")]
		public function creating_an_instance_of_a_implementation_is_possible ():void {
			instance = new ExampleImplementation();
			assertThat(instance, notNullValue());
		}
		
		[Test]
		[Ignore]
		[Given("A subclass of AbstractExample that implements IExample")]
		[And("methods have the metadata [Abstract]")]
		[When("the constructor is called ")]
		[Should("throw an AbstractError because those methods are not overwritten")]
		public function recognizes_abstract_methods ():void {
			try {
				instance = new ExampleImplementation();
			} catch (error:Error) {
				this.error = error;
			}
			assertThat(instance, nullValue());
			verifyErrorTypeAndMessage(AbstractError, [ExampleImplementation, "abstract", "methods"]);
		}
	
	}
}