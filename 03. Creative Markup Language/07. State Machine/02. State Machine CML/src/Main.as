package 
{
	import com.gestureworks.cml.core.CMLParser;
	import com.gestureworks.cml.elements.Graphic;
	import com.gestureworks.cml.elements.State;
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
			
			// get graphic object from cml document
			var g:Graphic = document.getElementById("circle-graphic");			
			
			g.loadState("left");
			g.addEventListener(GWGestureEvent.TAP, onTap);

			function onTap(e:GWGestureEvent):void {	
								
				var fingerCount:int = e.value.n;
				
				if (fingerCount == 1) {
					if (g.stateId == "left") {
						g.loadState("right");
					}
					else {
						g.loadState("left");
					}
				}
				else if (fingerCount == 2) {
					if (g.stateId == "left") {
						g.tweenState("right", .5);
					}
					else {
						g.tweenState("left", 1);
					}
				}
				
			}
				
		}
	}
}