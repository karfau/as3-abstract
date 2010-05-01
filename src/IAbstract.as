package
{
	
	/**
	 * A class implementing this can be verified by global#verifyAbstraction().
	 *
	 * @author coder@karfau.de
	 *
	 * @see global#verifyAbstraction()
	 * @see AbtractObject
	 * @see abstract
	 */
	public interface IAbstract
	{
		/**
		 * Same as in Java: returns the type of <code>this</code>.
		 *
		 * <p>Possible implementations:
		 * <ul>
		 * <li><code >return Object(this).constructor;</code></li>
		 * <li>???</li>
		 * </ul>
		 * </p>
		 * @return the type of <code>this</code>
		 *
		 * @see global#verifyAbstraction()
		 * @see Object#constructor
		 */
		function get clazz ():Class;
	}
}