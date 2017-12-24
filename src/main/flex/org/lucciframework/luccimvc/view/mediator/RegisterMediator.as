package org.lucciframework.luccimvc.view.mediator
{
	import mx.core.IMXMLObject;

	public class RegisterMediator implements IMXMLObject
	{

		private var _mediatorClass:Class;

		public function get mediatorClass():Class
		{
			return _mediatorClass;
		}

		public function set mediatorClass(value:Class):void
		{
			_mediatorClass=value;
		}


		private var _mediatorName:String;

		public function get mediatorName():String
		{
			return _mediatorName;
		}

		public function set mediatorName(value:String):void
		{
			_mediatorName=value;
		}

		public function initialized(document:Object, id:String):void
		{

		}

	}
}