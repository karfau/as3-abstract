package de.karfau.abstract
{
	import de.karfau.abstract.examples.*;
	
	import org.hamcrest.assertThat;
	import org.hamcrest.core.*;
	import org.hamcrest.object.*;
	import org.hamcrest.text.*;
	
	public class ImplementationBaseTest
	{
		public var instance:Object;
		
		[Before]
		public function setUp ():void {
			assertThat(instance, nullValue());
		}
		
		[Test]
		[Given("A subclass of AbstractClassExample")]
		[When("the constructor is called")]
		[Should("create an instance")]
		public function subclasses_of_an_abstract_definition_are_concrete_by_default ():void {
			instance = new AbstractClassExampleImplementation();
			assertThat(instance, notNullValue());
		}
		
		[After]
		public function tearDown ():void {
			instance = null;
		}
	
	}
}