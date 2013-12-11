package 
{
	import com.gestureworks.cml.core.CMLParser;
	import com.gestureworks.cml.elements.Graphic;
	import com.gestureworks.cml.elements.State;
	import com.gestureworks.cml.events.StateEvent;
	import com.gestureworks.cml.managers.StateManager;
	import com.gestureworks.cml.utils.document;
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.events.GWGestureEvent;
	import flash.events.Event;

	[SWF(width = "1280", height = "720", backgroundColor = "0x000000", frameRate = "30")]

	public class Main extends GestureWorks
	{
		public function Main():void 
		{
			super();
			gml = "library/gml/gestures.gml";
			cml = "library/cml/main.cml";
			CMLParser.addEventListener(CMLParser.COMPLETE, cmlInit);
		}
		
		private function cmlInit(event:Event):void
		{
			trace("cmlInit()");
			
			document.getElementById("btns").
				addEventListener(StateEvent.CHANGE, onChange);

			function onChange(e:StateEvent):void {
				StateManager.loadState(e.value);
			}
				
		}
		
		
		
	}
}