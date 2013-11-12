package 
{
	import com.gestureworks.cml.core.CMLParser;
	import com.gestureworks.core.GestureWorks;
	import flash.events.Event;
	
	import UselessElement; UselessElement;
	import UselessViewer; UselessViewer;
	
	[SWF(width = "1280", height = "720", backgroundColor = "0x000000", frameRate = "30")]
	
	public class Main extends GestureWorks 
	{
		
		public function Main():void 
		{
			super();
			CMLParser.addEventListener(CMLParser.COMPLETE, cmlInit);
			gml = "gestures.gml"; // gml now required
			cml = "myProject.cml";
		}
		
		private function cmlInit(e:Event = null):void 
		{
			removeEventListener(CMLParser.COMPLETE, cmlInit);
			// entry point
		}
		
	}
	
}