package
{
	import flash.errors.IllegalOperationError;
	
	import org.hamcrest.*;
	import org.hamcrest.object.*;
	
	public class BasicAbstractTest
	{
		
		private var instance:AbstractObject;
		
		[Given("the class AbstractObject")]
		[When("creating an instanciate")]
		[Test(expects="Error")]
		public function not_possible_to_instanciate_AbstractObject ():void {
			instance = new AbstractObject();
		}
		
		[Test]
		[Given("a class implementing AbstractObject")]
		[And("it is not abstract (implicit with not using 'super(abstractClass)' in constructor)")]
		[When("creating an instanciate")]
		[And("it should not be null (implies no Errors where thrown)")]
		public function possible_to_create_instance_of_non_abstract_implementation ():void {
			instance = new ConcreteObjectImplementation();
			assertThat(instance, notNullValue());
		}
		
		[Given("a class implementing AbstractObject")]
		[And("it is abstract (explicit by using 'super(abstractClass)')")]
		[When("trying to instanciate")]
		[Test(expects="Error")]
		public function not_possible_to_instanciate_abstract_implementation_of_AbstractObject ():void {
			instance = new AbstractObjectImplementation();
		}
	
		//TODO: allow forcing interface implementation (inheriting their abstract methods)
		//TODO: what about checking abstract methods (would introduce desribeType-Reflection?)...
	/*one way could be a check where the method that would get called is implemented.
		 - if the abstract class really implements the interface, it needs to implement all the mehtods
		 - [Abstract] would enable us to check if methods are implemnted
		 !evaluate possibilities with gains/flaws, maybe make this an extra version
	 */
		 //TODO: allow the same mechanism for extensions of existing classes that are not objects
		 //TODO: what about a "multiple Abstract-heirarchy", ...
	/* a) is it enough to only check the last abstractClass?
		 b) if not, it would require all earlier abstract classes to allow access to the
		 abstractClass-constructor-parameter (this way implementiing classes could avoid the test
		 by setting a wrong class.)
	 */
	}
}

internal class ConcreteObjectImplementation extends AbstractObject
{
}

internal class AbstractObjectImplementation extends AbstractObject
{
	public function AbstractObjectImplementation () {
		super(AbstractObjectImplementation);
	}

}

