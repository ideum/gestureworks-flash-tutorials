package  
{
	import com.gestureworks.cml.components.Component;
	import com.gestureworks.cml.element.*;
	import com.gestureworks.cml.events.*;
	import com.gestureworks.cml.kits.*;
	
	public class UselessViewer extends Component 
	{		
		/**
		 * useless viewer Constructor
		 */
		public function UselessViewer() 
		{
			super();
			mouseChildren = true;
			disableNativeTransform = false;
			disableAffineTransform = false;			
		}
		
		
		
		private var _useless:*;
		
		public function get useless():* {return _useless}
		public function set useless(value:*):void 
		{
			if (!value) return;
			
			_useless = value;
		}			
	
		/**
		 * Initialization function
		 */
		override public function init():void 
		{	
			// automatically try to find elements based on AS3 class
			if (!useless)
				useless = searchChildren(UselessElement);
			
			if (useless)
				useless.addEventListener(StateEvent.CHANGE, uselessComplete);
			
			super.init();	
		}
		
		private function uselessComplete(e:StateEvent):void {
			trace("The useless machine has done its job.");
		}
		
		/**
		 * CML initialization
		 */
		override public function displayComplete():void
		{
			init();
		}		
					
		override protected function updateLayout(event:*=null):void 
		{
			if (useless) {
				// update width and height to the size of the useless, if not already specified
					width = useless.width;
					height = useless.height;	
			}	
			super.updateLayout();				
		}	
		
		
		
		/**
		 * Dispose method to nullify the attributes and remove listener
		 */
		override public function dispose():void 
		{
			super.dispose();
			useless = null;
		}
		
	}
	
}