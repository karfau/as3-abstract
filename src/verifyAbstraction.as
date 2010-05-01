package
{
	
	use namespace abstract;
	
	/**
	 * Allowes to verify that the class <code><i>thisObject</i></code> is  an instance of,
	 * extends <code><i>abstractType</i></code> and implements <code><i>forcedInterface</i></code>,
	 * throwing a VerifyError with a helpfull message if it doesn't.
	 *
	 * <p>The default scenario could look like this:
	 * <ul style="font-size:12">
	 * 	<li>the <code><i>forcedInterface</i>:
	 * 			<div style="padding-left:20px;">public interface <b>IAbcXyz</b>{...}</div></code>
	 * 	</li>
	 * 	<li>the <code><i>abstractType</i>:
	 * 		<div style="padding-left:20px;">public class <b>AbstractAbcXyz</b> implements IAbstract
	 * 			<i style="color:#009900;" title="it is uncommented after code-generation ;-)">//,<b>IAbcXyz</b></i>{...}</div></code>
	 * 	</li>
	 * 	<li><code><i>thisObject</i></code> is an instance of:
	 * 		<div style="padding-left:20px;"><code>public class <b>SpecialAbcXyz</b> extends <b>AbstractAbcXyz</b>
	 * 				implements <b>IAbcXyz</b>{...}</code></div>
	 * 	</li>
	 * </ul>
	 * Where <b>SpecialAbcXyz</b> uses the default/basic-"implementation" from <b>AbstractAbcXyz</b>,
	 * and only needs to implement the functions from <b>IAbcXyz</b>,
	 * that are <b style="color:0000FF;">abstract</b>: not implemented by <b>AbstractAbcXyz</b> (or only in the abstract namespace?).
	 * </p>
	 * <p>For <b style="color:0000FF;">abstract</b> classes that only extend <code>Object</code> have a look at <code>AbtractObject</code>
	 * that provides a way to reduce redundancy when using this method.</p>
	 *
	 * @param thisObject an instance of the class to test ("<b>SpecialAbcXyz</b>")
	 * @param abstractType the abstract class ("<b>AbstractAbcXyz</b>")
	 * @param forcedInterface an interface that needs to be implemented ("<b>IAbcXyz</b>")
	 *
	 * @throws VerifyError If <code><i>thisObject</i></code><br/>
	 * 		either doesn't <u title="as a subclass: abstractType itself is not allowed">extend</u> <code><i>abstractType</i></code><br/>
	 *		or (only if specified) doesn't implement <code><i>forcedInterface</i></code><br/>
	 * 		OR if one of (*<code><i>thisObject</i></code> | *<code><i>abstractType</i></code>) is null.
	 *
	 * @see IAbstract
	 * @see AbstractObject
	 * @see abstract
	 */
	public function verifyAbstraction (thisObject:IAbstract, abstractType:Class, forcedInterface:Class=null):void {
		if (thisObject == null || abstractType == null)
			throw new VerifyError("Error verifying abstraction : " +
														"one of (*thisObject | *abstractType) was NULL: <" + [thisObject, abstractType] + ">");
		
		if (!(thisObject is abstractType) || thisObject.clazz == abstractType || (forcedInterface != null && !(thisObject is forcedInterface)))
			throw new VerifyError("Error creating instance of " + thisObject.clazz + ": " +
														abstractType + " is an abstract class, " +
														"extend it " + (forcedInterface != null ? "to implement " + forcedInterface : "to create instances") + ".");
	
	}
}