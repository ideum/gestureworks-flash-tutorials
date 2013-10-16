package  
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.URLRequest;
	

	import com.gestureworks.core.TouchSprite;
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.events.GWGestureEvent;
	
	public class MyDisplay extends Sprite 
	{
		
		public function MyDisplay() 
		{
			super();
			
			init();
		}
		
		private function init ():void {
			
			 var ts0:TouchSprite = new TouchSprite()
					var Loader0:Loader = new Loader();
					Loader0.load(new URLRequest("library/assets/crystal1.jpg"));
				ts0.addChild(Loader0);
				
				ts0.x = 200;
				ts0.y = 100;
				ts0.rotation = 45;
				ts0.scaleX = 0.5;
				ts0.scaleY = 0.5;
				addChild(ts0);
				
				ts0.disableAffineTransform = false;
				ts0.disableNativeTransform = false;
				ts0.gestureList = { "n-drag":true, "n-scale":true, "n-rotate":true};				
			
			 var ts1:TouchSprite = new TouchSprite()
					var Loader1:Loader = new Loader();
					Loader1.load(new URLRequest("library/assets/crystal2.jpg"));
				ts1.addChild(Loader1);
				
				ts1.x = 100;
				ts1.y = 200;
				ts1.rotation = -20;
				ts1.scaleX = 0.8;
				ts1.scaleY = 0.8;
				addChild(ts1);
				
				ts1.disableAffineTransform = false;
				ts1.disableNativeTransform = false;
				
				var gList:Object = new Object();
					gList["n-drag"] = true;
					gList["n-rotate"] = true;
					gList["n-scale"] = true;
				ts1.gestureList = gList;				
		}
		
	}
}