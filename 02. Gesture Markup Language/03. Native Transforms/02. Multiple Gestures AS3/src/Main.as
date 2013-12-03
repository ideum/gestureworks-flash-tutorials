package 
{
	import com.gestureworks.core.GestureWorks;
	import flash.display.Sprite;

	[SWF(width = "1280", height = "720", backgroundColor = "0x000000", frameRate = "30")]

	public class Main extends GestureWorks
	{
		public function Main():void 
		{
			super();
			gml = "library/gml/my_gestures.gml";
		}
	
		override protected function gestureworksInit():void
 		{
			trace("gestureWorksInit()");	
			var myDisplay:Sprite = new MyDisplay();
			addChild(myDisplay);
		}
	
	}
}