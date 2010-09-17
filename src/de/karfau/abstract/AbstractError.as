package de.karfau.abstract
{
	
	public class AbstractError extends Error
	{
		
		public static const CALLED_ABSTRACT_CONSTRUCTOR:int = 666666;
		public static const CALLED_ABSTRACT_METHOD:int = 666;
		
		public function AbstractError (message:*=null, id:*=0) {
			super(message, id);
		}
	
	}
}