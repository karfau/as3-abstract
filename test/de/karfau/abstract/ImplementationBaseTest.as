package de.karfau.abstract
{
	import de.karfau.abstract.examples.*;
	
	import org.hamcrest.assertThat;
	import org.hamcrest.object.notNullValue;
	
	public class ImplementationBaseTest
	{
		public var instance:Object;
		
		[After]
		public function tearDown ():void {
			instance = null;
		}
		
		[Test]
		[Ignore(description="this assumption is wrong by now")]
		[Given("A subclass of an abstract definition")]
		[And("it uses super() or default constructor")]
		[When("the constructor is called")]
		[Should("create an instance")]
		public function subclasses_of_an_abstract_definition_are_concrete_by_default ():void {
			//instance = new ImplicitConcreteImplementationOfDefinition();
			//assertThat(instance, notNullValue());
		}
	
	}
}