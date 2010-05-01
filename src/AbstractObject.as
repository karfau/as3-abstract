package
{
	
	/**
	 * A default implementation to make the use of <code>global#verifyAbstraction()</code> less complex/redundant.
	 *
	 * @see global#verifyAbstraction()
	 * @see IAbstract
	 * @see abstract
	 *
	 * @author Karfau
	 */
	public class AbstractObject implements IAbstract
	{
		protected namespace abstract;
		
		abstract var verified:Boolean = false;
		
		/**
		 * Uses <code>#verifyImplementation()</code> to verify <code>abstractType</code> and <code>forcedInterface</code>.
		 *
		 * @param abstractType
		 * @param forcedInterface
		 *
		 * @see #verifyImplementation()
		 * @see global#verifyAbstraction()
		 */
		public function AbstractObject (abstractType:Class, forcedInterface:Class=null) {
			abstract::verifyImplementation(abstractType, forcedInterface);
		}
		
		/**
		 * Calls <code>global#verifyAbstraction()</code> if <code>#verifyImplementation()</code> has not been called for this instance.
		 * Used by the constructor of AbstractObject (or abstract subclasses).
		 *
		 * @param abstractType
		 * @param forcedInterface
		 *
		 * @see global#verifyAbstraction()
		 * @see #AbstractObject()
		 */
		abstract function verifyImplementation (abstractType:Class, forcedInterface:Class=null):void {
			use namespace abstract;
			if (!verified)
				verifyAbstraction(this, abstractType, forcedInterface);
			verified = true;
		}
		
		/**
		 * Using 1. implementation.<br/>
		 * @inheritDoc
		 */
		public function get clazz ():Class {
			return Object(this).constructor;
		}
	}
}