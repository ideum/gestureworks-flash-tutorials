package 
{
	import com.gestureworks.cml.components.VideoViewer;
	import com.gestureworks.cml.elements.Carousel;
	import com.gestureworks.cml.elements.Graphic;
	import com.gestureworks.cml.elements.TouchContainer;
	import com.gestureworks.events.GWGestureEvent;
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.core.TouchSprite;
	import flash.display.DisplayObject;
	import flash.display.Sprite;

	[SWF(width = "1820", height = "980", backgroundColor = "0x000000", frameRate = "30")]

	public class Main extends GestureWorks
	{
		public function Main():void 
		{
			super();
			gml = "library/gml/my_gestures.gml";
		}
	
		override protected function gestureworksInit():void
 		{
			var window = this;
			
			var Box:Function = function(w:int, h:int, c:int, fancy:Boolean = false):Graphic {
				var g:Graphic = new Graphic();
				g.graphics.beginFill(0, 0.25);
				g.graphics.drawRect(-w/2, -h/2, w, h);
				g.graphics.beginFill(c, 1);
				g.graphics.drawRect(-w / 2 + 4, -h / 2 + 4, w - 8, h - 8);
				g.graphics.beginFill(0xffffff, 1);
				g.graphics.drawRect(-w / 2 + 8, -h / 2 + 8, w - 16, 8);
				if(fancy)g.graphics.drawCircle(0, h, 10);
				return g;
			}
			
			var Btn:Function = function(x:int, y:int, fn:Function):void {
				var ts:TouchSprite = new TouchSprite();
				ts.graphics.beginFill(0xffffff, 1);
				ts.graphics.drawCircle(x, y, 20);
				ts.gestureList = { "n-drag":true };
				ts.addEventListener(GWGestureEvent.RELEASE, fn);
				window.addChild(ts);
			}
			
			var c0:Carousel = new Carousel();
			c0.x = -300;
			c0.y = -300;
			c0.width  = 600;
			c0.height = 600;
			c0.rotationOffset = -Math.PI / 4;
			c0.dragType = Carousel.CIRCULAR_DRAG;
			c0.transformFunc = function(child:DisplayObject, theta:Number):void {
				child.rotation = theta * 180 / Math.PI - 90;
			};for (var i:int = 0; i < 20; ++i) c0.addChild(Box(200, 100, 0xffffff * Math.random()));
			c0.init();
			addChild(c0);
			Btn(10, 10, function(e:GWGestureEvent):void { c0.rotateLeft(); } );
			
			var c1:Carousel = new Carousel();
			c1.x = 550;
			c1.y = 200;
			c1.width  = 400;
			c1.height = 100;
			c1.dragType = Carousel.CIRCULAR_DRAG;
			for (var i:int = 0; i < 20;++i) c1.addChild(Box(100, 100, 0xffffff * Math.random()));
			c1.init();
			addChild(c1);
			
			var c2:Carousel = new Carousel();
			c2.x = 1200;
			c2.y = 150;
			c2.width  = 400;
			c2.height = 100;
			c2.dragType = Carousel.LINEAR_DRAG;
			c2.transformFunc = function(child:DisplayObject, theta:Number):void {
				child.rotation = theta * 180 * 2 / Math.PI + 180;
				child.scaleX = child.scaleY = child.scaleZ = Math.sin(theta) * 0.5 + 0.75;
				child.alpha = Math.sin(theta) * 0.5 + 0.5;
			};for (var i:int = 0; i < 50; ++i) c2.addChild(Box(100, 100, 0xffffff * Math.random(),true));
			c2.init();
			addChild(c2);
		}
	}
}