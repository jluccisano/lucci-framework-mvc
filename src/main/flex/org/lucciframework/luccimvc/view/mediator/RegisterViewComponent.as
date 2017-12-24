package org.lucciframework.luccimvc.view.mediator
{
	import flash.display.DisplayObject;
	
	import mx.core.IMXMLObject;

	public class RegisterViewComponent implements IMXMLObject
	{
		public function RegisterViewComponent()
		{
		}
		
		private var _viewComponent : DisplayObject;

		public function get viewComponent():DisplayObject
		{
			return _viewComponent;
		}

		public function set viewComponent(value:DisplayObject):void
		{
			_viewComponent = value;
		}

		
		private var _viewComponentName : String;

		public function get viewComponentName():String
		{
			return _viewComponentName;
		}

		public function set viewComponentName(value:String):void
		{
			_viewComponentName = value;
		}
		
		private var _mediatorName : String;

		public function get mediatorName():String
		{
			return _mediatorName;
		}

		public function set mediatorName(value:String):void
		{
			_mediatorName = value;
		}
		
		public function initialized( document : Object, id : String ) : void {
			
		}
		
	}
}