package de.karfau.abstract
{
	import asunit.asserts.assertTrue;
	
	import flash.utils.describeType;
	
	import org.hamcrest.assertThat;
	import org.hamcrest.core.both;
	import org.hamcrest.object.equalTo;
	import org.hamcrest.object.notNullValue;
	import org.hamcrest.object.nullValue;
	import org.hamcrest.text.containsString;
	
	public class DescribeTypeHelperTest extends BaseTest
	{
		
		public var helper:DescribeTypeHelper;
		
		[Before]
		public override function setUp ():void {
			super.setUp();
			assertThat(helper, nullValue());
			instance = new TestObject();
			helper = new DescribeTypeHelper(instance);
		}
		
		[Test]
		public function typeXML_matches_input ():void {
			assertThat(helper, notNullValue());
			assertThat(helper.typeXML.toXMLString(), containsString(describeType(instance).toXMLString()));
		}
		
		[Test]
		public function can_tell_about_existance_of_metadata ():void {
			//assertTrue();
			assertThat("true for existing metadata", helper.hasMetadata("Abstract"), equalTo(true));
			assertThat("false for unused metadata", helper.hasMetadata("Bindable"), equalTo(false));
		}
		
		[After]
		public override function tearDown ():void {
			super.tearDown();
			helper = null;
		}
	
	}
}

internal class TestObject
{
	public function TestObject (attributePure:int=0) {
		this.attributePure = attributePure;
	}
	
	[Abstract]
	public function methodOne (param:String):Boolean {
		return false;
	}
	
	public var attributePure:int;
	private var _attributeSetGet:Number;
	
	[Abstract]
	public function get attributeSetGet ():Number {
		return _attributeSetGet;
	}
	
	public function set attributeSetGet (value:Number):void {
		_attributeSetGet = value;
	}
}