package 
{
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.core.TouchSprite;
	import com.gestureworks.events.GWGestureEvent;
	import com.gestureworks.utils.ExampleTemplate;
	import com.greensock.TimelineLite;
	import com.greensock.TweenLite;
	import flash.display.Loader;
	import flash.net.URLRequest;
	
	[SWF(width="1280",height="720",backgroundColor="0x000000",frameRate="60")]
	
	public class ClusterBubbling extends GestureWorks
	{
		public function ClusterBubbling():void
		{
			gml = "cluster-bubbling.gml";
		}
		
		override protected function gestureworksInit():void
		{
			var container:TouchSprite = new TouchSprite()	
			container.x = 100
			container.y = 100;					
			container.clusterBubbling = false;
			container.mouseChildren = true;
			container.nativeTransform = true;
			container.gestureList = { "n-drag":true};					
			addChild(container);
			
			//belt
			var belt:TouchSprite = new TouchSprite()
			belt.graphics.lineStyle(4, 0x333333);
			belt.graphics.beginFill(0x999999);
			belt.graphics.drawRect(0, 0, 1000, 400);					
			belt.nativeTransform = true;
			belt.mouseChildren = true;
			belt.clusterBubbling = true; 
			belt.y_lock = true; 
			belt.gestureList = { "n-drag":true };
			container.addChild(belt);
			
			//logos
			var logo1:TouchSprite = getLogo("gwLogo.png");
			logo1.x = 150;				
			belt.addChild(logo1);	
		
			var logo2:TouchSprite = getLogo("gwLogo1.png");	
			logo2.x = 450;					
			belt.addChild(logo2);
			
			var logo3:TouchSprite = getLogo("gwLogo2.png");	
			logo3.x = 750;
			belt.addChild(logo3);			
			
			// touch frame
			var frame_width:int = 80;
			var frame:TouchSprite = new TouchSprite();
			frame.graphics.lineStyle(frame_width, 0x6666CC, 0.6);
			frame.graphics.drawRect( -frame_width/2, -frame_width/2, 400+frame_width, 400+frame_width);
			frame.targetParent = true; 
			container.addChild(frame)																	
		}
		
		private function getLogo(img:String):TouchSprite {
			var logo:TouchSprite = new TouchSprite();
			logo.scale = 0.6;
			logo.gestureList = { "n-tap":true };
			logo.addEventListener(GWGestureEvent.TAP, tapHandler);
			logo.y = 150;
			
			var loader:Loader = new Loader();
			loader.load(new URLRequest("../../../../assets/" + img));
			loader.y = -120;
			loader.x = -120;
			logo.addChild(loader);
			return logo;
		}
				
		private function tapHandler(event:GWGestureEvent):void {
			var tl:TimelineLite = new TimelineLite();
			tl.append(new TweenLite(event.target, 0.1, { scale:1.5 } ));
			tl.append(new TweenLite(event.target, 0.1, { scale:0.6 } ));
		}	
	}

}