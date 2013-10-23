package 
{
	import com.gestureworks.cml.core.CMLObjectList;
	import com.gestureworks.cml.element.Container;
	import com.gestureworks.cml.core.CMLParser;
	import com.gestureworks.core.GestureWorks;
	import flash.display.Sprite;
	import flash.events.Event;

	[SWF(width = "1280", height = "720", backgroundColor = "0x000000", frameRate = "30")]

	public class Main extends GestureWorks
	{
		public function Main():void 
		{
			super();
			cml = "library/cml/my_application.cml";
			gml = "library/gml/my_gestures.gml";
			
			CMLParser.addEventListener(CMLParser.COMPLETE, cmlInit);
		}
	
		override protected function gestureworksInit():void
 		{
			trace("gestureWorksInit()");	
			
			var myDisplay:Sprite = new MyDisplay();
			addChild(myDisplay);
		}
		
		private function cmlInit(event:Event):void
		{
			trace("cmlInit()");
			CMLParser.removeEventListener(CMLParser.COMPLETE, cmlInit);
		}
	
	}
}