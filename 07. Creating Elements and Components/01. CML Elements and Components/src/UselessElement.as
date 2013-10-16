package  
{
	import com.gestureworks.cml.element.*;
	import com.gestureworks.cml.events.*;
	import com.gestureworks.core.*;
	import com.gestureworks.events.*;
	import com.greensock.*;
	/**
	 * ...
	 * @author josh
	 */
	public class UselessElement extends Element
	{
		private var channel:Graphic;
		private var knob:TouchSprite;
		private var arm:Graphic;
		private var armContainer:Container;
		private var tweening:Boolean = false;
		private var tween:TweenLite;
		
		public function UselessElement() 
		{
			super();
		}
		
		override public function init():void {
			super.init();
			createGraphics();
			positionGraphics();
			createEvents();
		}
		
		private function onDrag(e:GWGestureEvent):void {
			//trace("Dragging.");
			knob.y += e.value.drag_dy;
			
			if (knob.y > channel.y + channel.height - 5 - knob.height)
				knob.y = channel.y + channel.height - 5 - knob.height;
			else if (knob.y < channel.y + 5)
				knob.y = channel.y + 5;
				
			if (knob.y + (knob.height / 2) < channel.y + (channel.height / 2)) {
				startSwitch();
			}
		}
		
		private function startSwitch():void {
			if (tweening) return;
			
			tweening = true;
			var timeLine:TimelineLite = new TimelineLite();
			tween = new TweenLite(armContainer, 1, { rotation: -90, onComplete:reverse, onReverseComplete:tweenOff, onUpdate:tweenUpdate } );
		}
		
		private function tweenUpdate():void {
			if (armContainer.rotation < (180/Math.PI) * ( (Math.PI / 2) + Math.tan((knob.height - 5) / armContainer.x - (knob.x + knob.width)))) {
				TweenLite.to(knob, 0.25, { y:channel.y + knob.height + 5 } );
			}
		}
		
		private function reverse():void {
			tween.reverse();
		}
		
		private function tweenOff():void {
			tweening = false;
			dispatchEvent(new StateEvent(StateEvent.CHANGE, this.id, "uselessEvent", "uselessComplete"));
		}
		
		private function createGraphics():void {
			var background:Graphic = new Graphic();
			background.shape = "rectangle";
			background.color = 0xd9bea7;
			background.width = width;
			background.height = height;
			addChild(background);
			
			channel = new Graphic();
			knob = new TouchSprite();
			arm = new Graphic();
			armContainer = new Container();
			
			channel.shape = "rectangle";
			arm.shape = "rectangle";
			
			channel.color = 0x594432;
			channel.width = 90;
			channel.height = 170;
			channel.lineColor = 0x707CBC;
			
			arm.width = 80;
			arm.height = 340;
			arm.lineColor = 0x232326;
			arm.color = 0x707cbc;
			
			knob.graphics.beginFill(0xD9BEA7);
			knob.graphics.lineStyle(1.5, 0xf2f2f2);
			knob.graphics.drawRect(0, 0, 80, 80);
			knob.graphics.endFill();
			
			knob.gestureEvents = true;
			knob.gestureList = { "n-drag":true };
			
			addChild(channel);
			addChild(knob);
			
			addChild(armContainer);
			armContainer.addChild(arm);
			
		}
		
		private function positionGraphics():void {
			
			arm.y -= arm.height;
			
			channel.x = width / 4;
			channel.y = height * 0.5;
			
			knob.x = channel.x + 5;
			knob.y = channel.y + knob.height + 5;
			
			armContainer.x = channel.x + arm.height;
			armContainer.y = knob.y;
		}
		
		private function createEvents():void {
			knob.addEventListener(GWGestureEvent.DRAG, onDrag);
		}
	}

}