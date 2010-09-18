package de.karfau.abstract
{
	import asunit.asserts.assertThrows;
	import asunit.asserts.assertTrue;
	
	import flash.text.engine.EastAsianJustifier;
	import flash.utils.getQualifiedClassName;
	
	import org.hamcrest.assertThat;
	import org.hamcrest.core.allOf;
	import org.hamcrest.core.both;
	import org.hamcrest.core.isA;
	import org.hamcrest.object.hasPropertyWithValue;
	import org.hamcrest.object.notNullValue;
	import org.hamcrest.object.nullValue;
	import org.hamcrest.text.containsString;
	
	public class AbstractDefinitionBaseTest
	{
		
		public var instance:Object;
		
		public function get AbstractDefinition ():Class {
			return AbstractDefinitionBase;
		}
		
		public var error:Error;
		
		[Before]
		public function setUp ():void {
			assertThat(instance, nullValue());
			assertThat(AbstractDefinition, notNullValue());
			assertThat(error, nullValue());
		}
		
		[Test]
		[Given("An abstract definition")]
		[When("the constructor is called without parameters")] /*abstracClass is null*/
		[Should("throw ArgumentError")]
		public function abstract_definitions_can_not_be_instanciated_without_parameters ():void {
			try {
				instance = new AbstractDefinition();
			} catch (error:Error) {
				this.error = error;
			}
			verifyErrorTypeAndMessage(ArgumentError, ["Error #1063:", getQualifiedClassName(AbstractDefinition)]);
		}
		
		[Test]
		[Given("An abstract definition")]
		[When("the constructor is called with abstracClass is null")] /*abstracClass is null*/
		[Should("throw ArgumentError")]
		public function abstract_definitions_can_not_be_instanciated_with_null_param ():void {
			try {
				instance = new AbstractDefinition(null);
			} catch (error:Error) {
				this.error = error;
			}
			verifyErrorTypeAndMessage(ArgumentError, ["abstractClass", "" + null]);
		}
		
		[Test]
		[Given("An abstract definition")]
		[When("the constructor is called with abstracClass is a class not implemented by instance")]
		[Should("throw ArgumentError because abstracClass has to be implemented by instance")]
		public function abstractDefinition_verifies_it_implements_abstractClass ():void {
			try {
				instance = new AbstractDefinition(TypeNotInherited);
			} catch (error:Error) {
				this.error = error;
			}
			verifyErrorTypeAndMessage(ArgumentError, [TypeNotInherited, AbstractDefinition]);
		}
		
		[Test]
		[Given("An abstract definition")]
		[When("the constructor is called with the abstract definition as abstractClass")]
		[Should("throw AbstractError because abstract definitions can not be instancieted")]
		public function abstractDefinition_verifies_abstractClass_does_not_equal_the_definition ():void {
			try {
				instance = new AbstractDefinition(AbstractDefinition);
			} catch (error:Error) {
				this.error = error;
			}
			verifyErrorTypeAndMessage(AbstractError, [AbstractDefinition, "abstract"]);
		}
		
		[After]
		public function tearDown ():void {
			instance = null;
			//abstractClassParameter = null;
			error = null;
		}
		
		//TODO: create custom matcher?
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

internal class TypeNotInherited
{
}