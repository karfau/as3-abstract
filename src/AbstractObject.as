package
{
	
	public class AbstractObject
	{
		public function AbstractObject (abstractClass:Class=null) {
			if (Object(this).constructor == (abstractClass || AbstractObject))
				throw new Error();
		}
	}
}