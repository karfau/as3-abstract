package de.karfau.abstract
{
	import asunit.asserts.fail;
	
	import org.hamcrest.*;
	import org.hamcrest.core.*;
	import org.hamcrest.object.*;
	import org.hamcrest.text.*;
	
	public class BaseTest
	{
		
		public var instance:Object;
		public var error:Error;
		
		[Before]
		public function setUp ():void {
			assertThat(instance, nullValue());
			assertThat(error, nullValue());
		}
		
		/*		[Test]
			 public function fails ():void {
			 fail("test");
		 }*/
		
		[After]
		public function tearDown ():void {
			instance = null;
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