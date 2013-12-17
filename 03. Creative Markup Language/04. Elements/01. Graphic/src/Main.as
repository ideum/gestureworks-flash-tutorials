package 
{
	import com.gestureworks.cml.core.CMLParser;
	import com.gestureworks.core.GestureWorks;
	import flash.events.Event;

	[SWF(width = "1280", height = "720", backgroundColor = "0x000000", frameRate = "30")]

	public class Main extends GestureWorks
	{
		public function Main():void 
		{
			super();
			gml = "library/gml/gestures.gml";
			cml = "library/cml/main.cml";
			CMLParser.addEventListener(CMLParser.COMPLETE, cmlComplete);
		}
		
		private function cmlComplete(event:Event):void
		{
			trace("cmlComplete()");
			CMLParser.removeEventListener(CMLParser.COMPLETE, cmlComplete);
		}
	
	}
}