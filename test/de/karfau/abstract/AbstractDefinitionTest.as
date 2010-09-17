package de.karfau.abstract
{
	import de.karfau.abstract.examples.CustomAbstractDefinition;
	
	public class AbstractDefinitionTest extends AbstractDefinitionBaseTest
	{
		
		public override function get abstractClassParameter ():Class {
			return instanceType;
		}
		
		public override function get instanceType ():Class {
			return CustomAbstractDefinition;
		}
		
		[Before]
		public override function setUp ():void {
			super.setUp();
		}
		
		[Test]
		public override function abstract_definitions_can_not_be_instanciated_without_parameters ():void {
			super.abstract_definitions_can_not_be_instanciated_without_parameters();
		}
		
		[Test]
		public override function abstractDefinition_verifies_it_is_a_subClass_of_abstractClass ():void {
			super.abstractDefinition_verifies_it_is_a_subClass_of_abstractClass();
		
		}
		
		[After]
		public override function tearDown ():void {
			super.tearDown();
		}
	
	}
}