package de.karfau.abstract.examples
{
	
	public interface IExample
	{
		function doSomething (one:String, ... two):void;
		
		function get aValue ():Object;
		function set aValue (value:Object):void;
	}
}