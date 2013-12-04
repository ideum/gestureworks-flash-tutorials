package 
{
	import com.gestureworks.cml.elements.Graphic;
	import com.gestureworks.cml.elements.State;
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.events.GWGestureEvent;

	[SWF(width = "1280", height = "720", backgroundColor = "0x000000", frameRate = "60")]

	public class Main extends GestureWorks
	{
		public function Main():void 
		{
			super();
			gml = "library/gml/gestures.gml";
		}
		
		override protected function gestureworksInit():void
		{
			trace("gestureworksInit()");
			
			// create graphic
			var g:Graphic = new Graphic;
			g.shape = "circle";
			g.radius = 250;
			g.y = 100;
			addChild(g);

			g.state["left"] = new State;
			g.state["left"].x = 100;
			g.state["left"].scale = 1;
			
			g.state["right"] = new State;
			g.state["right"].x = 750;
			g.state["right"].scale = .5;
			
			g.loadState("left");
			
			g.gestureList = { "n-tap":true };
			g.addEventListener(GWGestureEvent.TAP, onTap);
						
			
			function onTap(e:GWGestureEvent):void {	
				
				trace("tap", g.stateId );
				
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