package de.karfau.abstract
{
	
	/**
	 * An AbstractDefinition is a class wich "replaces the missing language-feature":
	 * it exists to verify the abstractness of a class as early as possible:
	 * each time a constructor (of an abstract or implementing class) is called.
	 *
	 * This class is there to be extended to create an abstract class, that always gets its abstractness verified the same way.
	 * (It could also be used to create custom abstract definitions, but I can not imagine a use case yet)
	 *
	 * @author karfau
	 **/
	public class AbstractDefinitionBase extends Object
	{
		/**
		 * This Constructor verifies the abstractness of each extending (aka implementing) class because super() is called in each constructor.
		 *
		 * @param abstractClass The abstract class that can not be instanciated and the created instance has to be a subclass of.
		 *
		 * @throws ArgumentError abstractClass is null
		 * @throws ArgumentError if the created instance would not be an implementation of abstractClass
		 * @throws AbstractError if the type of the created instance would be equal to abstractClass
		 */
		public function AbstractDefinitionBase (abstractClass:Class) {
			var type:Class = Object(this).constructor;
			if (abstractClass == null)
				throw new ArgumentError("abstractClass was " + null);
			if (!(this is abstractClass))
				throw new ArgumentError(abstractClass + " is not implemented by " + type);
			if (type == abstractClass)
				throw new AbstractError(type + " is abstract", AbstractError.CALLED_ABSTRACT_CONSTRUCTOR);
		}
	}
}