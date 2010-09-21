package de.karfau.abstract
{
	import de.karfau.abstract.examples.CustomAbstractDefinition;
	
	import flash.utils.describeType;
	
	public class CustomAbstractDefinitionTest extends AbstractDefinitionBaseTest
	{
		
		public override function get AbstractDefinition ():Class {
			return CustomAbstractDefinition;
		}
	
	/*[Before]
		 public override function setUp ():void {
		 super.setUp();
		 }
	
		 [Test]
		 public override function abstract_definitions_can_not_be_instanciated_without_parameters ():void {
		 super.abstract_definitions_can_not_be_instanciated_without_parameters();
		 }
	
		 [Test]
		 public override function abstract_definitions_can_not_be_instanciated_with_null_param ():void {
		 super.abstract_definitions_can_not_be_instanciated_with_null_param();
		 }
	
		 [Test]
		 public override function abstractDefinition_verifies_it_implements_abstractClass ():void {
		 super.abstractDefinition_verifies_it_implements_abstractClass();
		 }
	
		 [Test]
		 public override function abstractDefinition_verifies_abstractClass_does_not_equal_the_definition ():void {
		 super.abstractDefinition_verifies_abstractClass_does_not_equal_the_definition();
		 }
	
		 [After]
		 public override function tearDown ():void {
		 super.tearDown();
	 }*/
	
	}
}