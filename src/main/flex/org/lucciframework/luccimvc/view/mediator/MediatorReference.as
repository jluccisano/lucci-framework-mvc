package org.lucciframework.luccimvc.view.mediator
{
	import mx.core.IMXMLObject;

	import org.lucciframework.luccimvc.core.Core;
	import org.lucciframework.luccimvc.view.View;

	public class MediatorReference extends Core implements IMXMLObject
	{
		private var _mediatorName:String;

		public function get mediatorName():String
		{
			return _mediatorName;
		}

		public function set mediatorName(value:String):void
		{
			_mediatorName=value;
		}

		private var _mediator:IMediator;

		public function get mediator():IMediator
		{
			return _mediator;
		}

		public function set mediator(value:IMediator):void
		{
			_mediator=value;
		}

		private var _componentName:String;

		public function get componentName():String
		{
			return _componentName;
		}

		public function set componentName(value:String):void
		{
			_componentName=value;
		}


		public function initialized(document:Object, id:String):void
		{

			_mediator=View.getInstance(facadeRef).getMediator(mediatorName);

			_mediator.viewComponentMap[_componentName]=document;

		}

	}
}