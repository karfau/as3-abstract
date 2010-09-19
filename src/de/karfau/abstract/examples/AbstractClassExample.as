package de.karfau.abstract.examples
{
	import de.karfau.abstract.AbstractDefinitionBase;
	
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
	public class AbstractClassExample extends AbstractDefinitionBase
	{
		/**
		 *
		 */
		public function AbstractClassExample () {
			super(AbstractClassExample);
		}
	}
}