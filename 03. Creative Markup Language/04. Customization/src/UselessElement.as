package  
{
	import com.gestureworks.cml.elements.Album;
	import com.gestureworks.cml.elements.Container;
	import com.gestureworks.cml.elements.Graphic;
	import com.gestureworks.cml.events.*;
	import com.gestureworks.core.*;
	import com.gestureworks.events.*;
	import com.greensock.*;

	public class UselessElement extends Container
	{
		private var channel:Graphic;
		private var knob:TouchSprite;
		private var arm:Graphic;
		private var armContainer:Container;
		private var tweening:Boolean = false;
		private var tween:TweenLite;
		private var album:Album;
		
		public function UselessElement() {
			super();
		}
		
		override public function init():void {
			super.init();
			createGraphics();
			positionGraphics();
			createEvents();
		}
		
		private function onDrag(e:GWGestureEvent):void {
			
			var proj_drag:Object = (function(ax:Number, ay:Number, bx:Number, by:Number):void {
				knob.x += ((ax * bx + ay * by) / (bx * bx + by * by)) * bx;
				knob.y += ((ax * bx + ay * by) / (bx * bx + by * by)) * by;
			})(e.value.drag_dx, e.value.drag_dy, Math.cos((parent.rotation+90)*Math.PI/180), Math.sin((parent.rotation+90)*Math.PI/180));

			function rotateVector(x:Number, y:Number, rotation:Number):Object {
				var cos_rot:Number = Math.cos(rotation);
				var sin_rot:Number = Math.sin(rotation);
				return {x:x * cos_rot - y * sin_rot, y:x * sin_rot + y * cos_rot};
			}
			
			/*
			trace("lkjsdf "+this.x+" "+this.y+" "+Math.random());
			var knob_vec    : Object = rotateVector(knob.x   , knob.y   , -parent.rotation);
			var channel_vec : Object = rotateVector(channel.x, channel.y, -parent.rotation);
			
			if (knob_vec.y > channel_vec.y + channel.height - 5 - knob.height)
				knob_vec.y = channel_vec.y + channel.height - 5 - knob.height;
			else if (knob_vec.y < channel_vec.y + 5)
				knob_vec.y = channel_vec.y + 5;
			if (knob_vec.y + (knob.height / 2) < channel_vec.y + (channel.height / 2))
				startSwitch();
			*/
				
			/*
			// this only works if this.rotation.mod(2*Math.PI) == 0...
			knob.y += e.value.drag_dy;
			
			if (knob.y > channel.y + channel.height - 5 - knob.height)
				knob.y = channel.y + channel.height - 5 - knob.height;
			else if (knob.y < channel.y + 5)
				knob.y = channel.y + 5;
				
			if (knob.y + (knob.height / 2) < channel.y + (channel.height / 2)) {
				startSwitch();
			}
			*/
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
			
			// always dispatch a state even in CML
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