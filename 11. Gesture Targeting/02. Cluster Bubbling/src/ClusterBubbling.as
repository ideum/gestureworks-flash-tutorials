package 
{
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.core.TouchSprite;
	import com.gestureworks.events.GWGestureEvent;
	import com.gestureworks.utils.ExampleTemplate;
	
	[SWF(width="1280",height="720",backgroundColor="0x000000",frameRate="60")]
	
	public class ClusterBubbling extends GestureWorks
	{
		public function ClusterBubbling():void
		{
			gml = "cluster-bubbling.gml";
		}
		
		override protected function gestureworksInit():void
		{
			trace("gestureWorksInit()");

			//create parent/child pair with cluster bubbling
			var parent:TouchSprite = new TouchSprite();
			parent.x = 100;
			parent.y = 50;
			parent.graphics.beginFill(0xCCCCCC);
			parent.graphics.drawRect(0, 0, 300, 300);
			parent.clusterBubbling = true; //enable point propagation from child to parent
			parent.mouseChildren = true;
			parent.nativeTransform = true;
			parent.gestureList = { "parent-drag":true };
			addChild(parent);
			
			var child:TouchSprite = new TouchSprite();
			child.graphics.beginFill(0xFF0000);
			child.graphics.drawRect(50, 50, 200, 200);
			child.nativeTransform = true;
			child.gestureList = { "child-scale":true };
			parent.addChild(child);						
		}
	
	}

}