package  
{
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.core.TouchSprite;
	import com.gestureworks.events.GWGestureEvent;
	import com.gestureworks.utils.ExampleTemplate;
	import com.greensock.TimelineLite;
	import com.greensock.TweenLite;
	import flash.display.Loader;
	import flash.geom.ColorTransform;
	import flash.net.URLRequest;
	
	[SWF(width = "1280", height = "720", backgroundColor = "0x000000", frameRate="60")]
	
	public class DispatchControl extends GestureWorks 
	{
		public function DispatchControl():void 
		{
			gml = "dispatch-control.gml";
		}
		
		override protected function gestureworksInit():void 
		{
			trace("gestureWorksInit()");						

			// create a touchable sprite 
			var touchSprite:TouchSprite = new TouchSprite();
			
			// add a bitmap image to the touch sprite
			var loader:Loader = new Loader();
			loader.load(new URLRequest("../../../assets/gwLogo.png"));
			loader.x = -200;
			loader.y = -200;
			touchSprite.addChild(loader);
			
			// center graphic in the middle of the stage
			touchSprite.x = stage.stageWidth / 2;
			touchSprite.y = stage.stageHeight / 2;
			
			// add touch sprite to display list 
			addChild(touchSprite);

			// add events 
			touchSprite.gestureList = { "n-hold":true };
			touchSprite.addEventListener(GWGestureEvent.HOLD, gestureHandler);
		}		
		
		private function gestureHandler(event:GWGestureEvent):void
		{
			var tl:TimelineLite = new TimelineLite();
			tl.append(new TweenLite(event.target, 0.1, { scale:1.5 } ));
			tl.append(new TweenLite(event.target, 0.1, { scale:1 } ));		
		}
	}
	
}