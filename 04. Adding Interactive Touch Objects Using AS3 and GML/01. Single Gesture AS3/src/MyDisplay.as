package  
{
	import com.gestureworks.core.TouchSprite;
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.net.URLRequest;
	
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
					Loader0.load(new URLRequest("library/assets/crystal0.jpg"));
				ts0.addChild(Loader0);
				
				ts0.x = 200;
				ts0.y = 100;
				ts0.rotation = -10;
				ts0.scaleX = 0.5;
				ts0.scaleY = 0.5;
				addChild(ts0);
				
				ts0.nativeTransform = true;
				ts0.gestureList = {"n-drag":true};
			
		}
		
	}
}