package 
{
	import com.gestureworks.cml.core.CMLParser;
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.core.TouchSprite;
	import com.gestureworks.managers.Leap2DManager;
	import com.gestureworks.managers.LeapManager;
	import com.gestureworks.managers.MotionManager;
	import com.leapmotion.leap.events.LeapEvent;
	import com.leapmotion.leap.Pointable;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.net.URLRequest;
	
	[SWF(width = "1280", height = "720", backgroundColor = "0x000000", frameRate = "30")]

	public class Main extends GestureWorks 
	{
		
		public function Main():void 
		{
			super();
			cml = "library/cml/my_application.cml";
			gml="library/gml/my_gestures.gml"
						
			CMLParser.addEventListener(CMLParser.COMPLETE, cmlInit);
			
			//enable Leap input
			leap2D = true;
			
			//Leap2D manager
			var leap:Leap2DManager = Leap2DManager(MotionManager.lmManager);

			//output point Leap point data
			leap.addEventListener(LeapEvent.LEAPMOTION_FRAME, function(e:LeapEvent):void {
				for each(var pointable:Pointable in e.frame.pointables)
				{
					trace("POINT ID:"+ pointable.id+ " x:"+ pointable.tipPosition.x+ " y:"+ pointable.tipPosition.y+ " z:"+ pointable.tipPosition.z);
				}				
			});
			
			//optional calibration settings
			leap.minX = -160;
			leap.maxX = 80;
			leap.minY = 120;
			leap.maxY = 260;	
		}
	
		override protected function gestureworksInit():void
 		{
			trace("gestureWorksInit()");	
			
			var myTouchSprite:TouchSprite = new TouchSprite();
			var Loader0:Loader = new Loader();
				Loader0.load(new URLRequest("library/assets/Vitruvian_man.png"));
			myTouchSprite.addChild(Loader0);
			myTouchSprite.debugDisplay = true;
			addChild(myTouchSprite);
			
			myTouchSprite.gestureList = { "n-drag-inertia":true, "n-scale-inertia":true, "n-rotate-inertia":true };				
			myTouchSprite.gestureReleaseInertia = true;
			myTouchSprite.disableNativeTransform = false;		
		}
		
		private function cmlInit(event:Event):void
		{
			trace("cmlInit()");
			CMLParser.removeEventListener(CMLParser.COMPLETE, cmlInit);
		}
		
	}
	
}