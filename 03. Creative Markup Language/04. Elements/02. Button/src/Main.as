package 
{
	import com.gestureworks.cml.core.CMLParser;
	import com.gestureworks.cml.elements.Text;
	import com.gestureworks.cml.events.StateEvent;
	import com.gestureworks.cml.utils.document;
	import com.gestureworks.core.GestureWorks;
	import flash.events.Event;

	[SWF(width = "1280", height = "720", backgroundColor = "0x000000", frameRate = "30")]

	public class Main extends GestureWorks
	{
		private var txt:Text;
		
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
			
			// entry point
			
			 document.getElementById("graphic-btn").
				addEventListener(StateEvent.CHANGE, buttonState);
			txt = document.getElementById("graphic-btn-status");
		}
		
		private function buttonState(e:StateEvent):void
		{
			txt.text = e.value;
		}
	
	}
}