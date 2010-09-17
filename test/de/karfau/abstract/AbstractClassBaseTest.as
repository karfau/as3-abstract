package de.karfau.abstract
{
	import de.karfau.abstract.examples.*;
	
	public class AbstractClassBaseTest
	{
		
		public var instance:Object;
		
		[Before]
		public function setUp ():void {
		}
		
		[Given("An abstract class that is explicit about being abstract by defining itself as the abstractClass to the definition")]
		[When("the constructor is called")]
		[Test(expects="de.karfau.abstract.AbstractError")]
		[Ignore(description="testing Constructor paramters standalone")]
		public function abstract_definitions_can_not_be_instanciated ():void {
			//instance = new AbstractClassFromDefinitionExplicit();
		}
		
		[After]
		public function tearDown ():void {
			instance = null;
		}
	
	}
}