package 
{
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.core.TouchSprite;
	import com.gestureworks.events.GWGestureEvent;
	import com.gestureworks.utils.ExampleTemplate;
	import flash.display.Loader;
	import flash.net.URLRequest;
	
	[SWF(width="1280",height="720",backgroundColor="0x000000",frameRate="60")]
	
	public class Orient extends GestureWorks
	{
		public function Orient():void
		{
			gml = "orient.gml";
		}
		
		override protected function gestureworksInit():void
		{
			trace("gestureWorksInit()");
					
			// create a touchable sprite 
			var touchSprite:TouchSprite = new TouchSprite();
			touchSprite.scale = 1.5;
			touchSprite.debugDisplay = true;
			
			// add a bitmap image to the touch sprite
			var loader:Loader = new Loader();
			loader.load(new URLRequest("../../../assets/gwLogo.png"));
			touchSprite.addChild(loader);
			
			// center graphic in the middle of the stage
			touchSprite.x = stage.stageWidth / 2 - (200 * touchSprite.scale);
			touchSprite.y = stage.stageHeight / 2 - (200 * touchSprite.scale);
			addChild(touchSprite);
			
			// add events 
			touchSprite.gestureList = { "orient": true };	
			
			//add orient handler
			touchSprite.addEventListener(GWGestureEvent.ORIENT, orientHandler);			
			function orientHandler(e:GWGestureEvent):void{
				trace(e.value.orient_thumbID, e.value.orient_dx, e.value.orient_dy);
			}
		}
	
	}

}