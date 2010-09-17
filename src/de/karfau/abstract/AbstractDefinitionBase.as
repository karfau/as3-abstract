package de.karfau.abstract
{
	
	public class AbstractDefinitionBase extends Object
	{
		public function AbstractDefinitionBase (abstractClass:Class) {
			var type:Class = Object(this).constructor;
			if (abstractClass == null)
				throw new ArgumentError("abstractClass was " + abstractClass);
			if (!(this is abstractClass))
				throw new ArgumentError(abstractClass + " is not implemented by " + type);
			if (type == abstractClass)
				throw new AbstractError(type + " is abstract", AbstractError.CALLED_ABSTRACT_CONSTRUCTOR);
		}
	}
}