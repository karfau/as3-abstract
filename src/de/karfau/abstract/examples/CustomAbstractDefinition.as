package de.karfau.abstract.examples
{
	import de.karfau.abstract.AbstractDefinitionBase;
	
	/**
	 * Currently I am not sure why this should be usefull,
	 * but it is possible by providing the constructor-parameter(s).
	 *
	 * So I used this class for testing purposes.
	 *
	 * PS: maybe this could be used to build various versions of function-implementation-verification (at construction-time).
	 *
	 * @author karfau
	 */
	public class CustomAbstractDefinition extends AbstractDefinitionBase
	{
		public function CustomAbstractDefinition (abstractClass:Class) {
			super(abstractClass);
		}
	}
}