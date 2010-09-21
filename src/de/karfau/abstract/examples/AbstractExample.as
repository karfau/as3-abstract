package de.karfau.abstract.examples
{
	import de.karfau.abstract.AbstractDefinitionBase;
	import de.karfau.abstract.AbstractError;
	
	import flash.errors.IllegalOperationError;
	
	/**
	 * Abstract classes are hiding the constructor parameter(s) of an abstract definition from its subclasses
	 * and tell its own type for the abstractClass-parameter to super().
	 *
	 * They can not be instanciated but can be used as in other languages:<br/>
	 * <ul>
	 * 	<li>predefine common behavoiur for interface implementation</li>
	 * 	<li>provide a constructor with basic parameters (maybe these should be optional?)</li>
	 * 	<li>...</li>
	 * </ul>
	 *
	 * @author karfau
	 */
	public class AbstractExample extends AbstractDefinitionBase implements IExample
	{
		
		/**
		 *
		 */
		public function AbstractExample () {
			super(AbstractExample);
		}
		
		public function get aValue ():Object {
			throw new IllegalOperationError("'get aValue' is abstract", AbstractError.CALLED_ABSTRACT_METHOD);
		}
		
		[Abstract]
		public function set aValue (value:Object):void {
			throw new IllegalOperationError("'set aValue' is abstract", AbstractError.CALLED_ABSTRACT_METHOD);
		}
		
		[Abstract]
		public function doSomething (one:String, ... two):void {
			throw new IllegalOperationError("'doSomething' is abstract", AbstractError.CALLED_ABSTRACT_METHOD);
		}
	
	}
}