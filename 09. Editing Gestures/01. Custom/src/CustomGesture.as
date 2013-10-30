package 
{
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.core.TouchSprite;
	import com.gestureworks.events.GWGestureEvent;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.net.URLRequest;
	
	[SWF(width="1280",height="720",backgroundColor="0x000000",frameRate="60")]
	
	public class CustomGesture extends GestureWorks
	{
		public function CustomGesture():void
		{		
			super();			
			gml = "custom-gesture.gml";				
		}
		
		override protected function gestureworksInit():void
		{
			trace("gestureWorksInit()");
			
			// create a touchable sprite 
			var touchSprite:TouchSprite = new TouchSprite();
			
			// add a bitmap image to the touch sprite
			var loader:Loader = new Loader();
			loader.load(new URLRequest("../../../assets/gwLogo.png"));
			touchSprite.addChild(loader);
			
			// center graphic in the middle of the stage
			touchSprite.x = stage.stageWidth / 2 - 200;
			touchSprite.y = stage.stageHeight / 2 - 200;
			addChild(touchSprite);
			
			// add events 
			touchSprite.gestureList = { "my-2-finger-h-drag": true };
			
			//register custom gesture listener
			touchSprite.addEventListener(GWGestureEvent.CUSTOM.MY-2-FINGER-H-DRAG, customHandler);					
		}
		
		private function customHandler(event:GWGestureEvent):void {
			event.target.x += e.value.drag_dx;
		}
	}

}