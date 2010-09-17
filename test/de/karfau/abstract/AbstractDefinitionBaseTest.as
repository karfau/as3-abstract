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
		
		public function get instanceType ():Class {
			return AbstractDefinitionBase;
		}
		
		public function get abstractClassParameter ():Class {
			return TypeNotInherited;
		}
		public var error:Error;
		
		[Before]
		public function setUp ():void {
			assertThat(instance, nullValue());
			assertThat(instanceType, notNullValue());
			assertThat(abstractClassParameter, notNullValue());
			assertThat(error, nullValue());
		}
		
		[Test]
		[Given("An abstract definition")]
		[When("the constructor is called without parameters")] /*abstracClass is null*/
		[Should("throw ArgumentError")]
		public function abstract_definitions_can_not_be_instanciated_without_parameters ():void {
			try {
				instance = new instanceType();
			} catch (error:Error) {
				this.error = error;
			}
			verifyErrorTypeAndMessage(ArgumentError, ["Error #1063:", getQualifiedClassName(instanceType)]);
		}
		
		[Test]
		[Given("An abstract definition")]
		[When("the constructor is called with abstracClass is a class")]
		[Should("throw ArgumentError if instance doesn't implemented abstractClass")]
		[Should("throw AbstractError if instance is not a _SUB_Class of abstractClass")]
		public function abstractDefinition_verifies_it_is_a_subClass_of_abstractClass ():void {
			try {
				instance = new instanceType(abstractClassParameter);
			} catch (error:Error) {
				this.error = error;
			}
			if (abstractClassParameter != instanceType)
				verifyErrorTypeAndMessage(ArgumentError, [abstractClassParameter, instanceType]);
			else
				verifyErrorTypeAndMessage(AbstractError, [instanceType, "abstract"]);
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

internal class TypeNotInherited
{
}