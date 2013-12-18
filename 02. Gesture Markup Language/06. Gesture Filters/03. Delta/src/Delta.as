package 
{
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.core.TouchSprite;
	import com.gestureworks.events.GWGestureEvent;
	import com.gestureworks.utils.ExampleTemplate;
	import flash.display.Loader;
	import flash.net.URLRequest;
	
	[SWF(width="1280",height="720",backgroundColor="0x000000",frameRate="60")]
	
	public class Delta extends GestureWorks
	{
		public function Delta():void
		{
			gml = "delta-filter.gml";
		}
		
		override protected function gestureworksInit():void
		{
			trace("gestureWorksInit()");
			
			// create a touchable sprite 
			var touchSprite1:TouchSprite = new TouchSprite();	
			touchSprite1.scale = .75;
			
			// add a bitmap image to the touch sprite
			var loader1:Loader = new Loader();
			loader1.load(new URLRequest("../../../../assets/gwLogo.png"));
			touchSprite1.addChild(loader1);
			
			//position touch sprite
			touchSprite1.x = 100;
			touchSprite1.y = 50
			addChild(touchSprite1);			
			
			//enable native transform
			touchSprite1.nativeTransform = true;
			
			//assign horizontal drag
			touchSprite1.gestureList = { "x-drag": true };
			
			
			//create second touchable sprite
			var touchSprite2:TouchSprite = new TouchSprite();	
			touchSprite2.scale = .75;
			
			// add a bitmap image to the touch sprite			
			var loader2:Loader = new Loader();
			loader2.load(new URLRequest("../../../../assets/gwLogo1.png"));
			touchSprite2.addChild(loader2);
		
			//position touch sprite
			touchSprite2.x = 100;
			touchSprite2.y = 375;			
			addChild(touchSprite2);
	
			//enable native transform
			touchSprite2.nativeTransform = true;	
			
			//assign horiztontal drag with delta filter
			touchSprite2.gestureList = { "x-drag-delta": true };			
		}
	
	}

}