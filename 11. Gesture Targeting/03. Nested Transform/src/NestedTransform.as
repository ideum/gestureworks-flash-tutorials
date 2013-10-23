package 
{
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.core.TouchSprite;
	import com.gestureworks.events.GWGestureEvent;
	import com.gestureworks.utils.FrameRate;
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.net.URLRequest;
	
	[SWF(width="1280",height="720",backgroundColor="0x000000",frameRate="60")]
		
	public class NestedTransform extends GestureWorks
	{
		
		public function NestedTransform():void
		{
			gml = "nested-transform.gml";
		}
		
		override protected function gestureworksInit():void
		{							
			//bottom container
			var ts1:TouchSprite = new TouchSprite()	
			ts1.graphics.beginFill(0x222222,1);
			ts1.graphics.drawRect(0, 0, 1200, 800);
			ts1.x = 400;
			ts1.scaleX = 0.4;
			ts1.scaleY = 0.4;
			ts1.rotation = 20;
			ts1.touchChildren = true;
			ts1.nativeTransform = true			
			ts1.gestureList = { "n-drag":true, "n-scale":true, "n-rotate":true};			
			addChild(ts1);	
				
			//bottom border
			var ts1_border:TouchSprite = new TouchSprite()
			ts1_border.graphics.lineStyle(80,0x555555,1);
			ts1_border.graphics.drawRect( -25, -25, 1250, 850);				
			ts1_border.touchChildren = false; 
			ts1_border.targetParent = true; 				
			ts1.addChild(ts1_border);
				
			
			//middle container
			var ts2:TouchSprite = new TouchSprite()	
			ts2.graphics.beginFill(0x222222,1);
			ts2.graphics.drawRect(0, 0, 1200, 800);
			ts2.scaleX = 0.6;
			ts2.scaleY = 0.6;
			ts2.rotation = 20;
			ts2.touchChildren = true;
			ts2.nativeTransform = true				
			ts2.gestureList = { "n-drag":true, "n-scale":true, "n-rotate":true };					
			ts1.addChild(ts2);	
		
			//middle border
			var ts6_border:TouchSprite = new TouchSprite()
			ts6_border.graphics.lineStyle(80,0x555555,1);
			ts6_border.graphics.drawRect( -25, -25, 1250, 850);				
			ts6_border.touchChildren = false; 
			ts6_border.targetParent = true; 				
			ts2.addChild(ts6_border);
			
			
			//top container
			var ts3:TouchSprite = new TouchSprite()					
			ts3.graphics.beginFill(0x222222,1);
			ts3.graphics.drawRect(0, 0, 1200, 800);			
			ts3.scaleX = 0.4;
			ts3.scaleY = 0.4;
			ts3.x = 200;
			ts3.y = 200;
			ts3.touchChildren = true;
			ts3.nativeTransform = true
			ts3.gestureList = { "n-drag":true, "n-scale":true, "n-rotate":true};					
			ts2.addChild(ts3);						
				
			//top border
			var ts2:TouchSprite = new TouchSprite()
			ts2.graphics.lineStyle(120,0x555555,1);
			ts2.graphics.drawRect( -25, -25, 1250, 850);				
			ts2.touchChildren = false; 
			ts2.targetParent = true; 				
			ts3.addChild(ts2);
									
		}
		
		
	}
}