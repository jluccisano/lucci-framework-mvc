package org.lucciframework.luccimvc.model.presenationModel
{
	import mx.core.IMXMLObject;
	
	import org.lucciframework.luccimvc.core.Core;
	import org.lucciframework.luccimvc.model.Model;

	public class PresentationModelReference extends Core implements IMXMLObject
	{

		private var _presentationModelName : String;

		public function get presentationModelName():String
		{
			return _presentationModelName;
		}

		public function set presentationModelName(value:String):void
		{
			_presentationModelName = value;
		}
		
		private var _presentationModel : IPresentationModel;

		public function get presentationModel():IPresentationModel
		{
			return _presentationModel;
		}

		public function set presentationModel(value:IPresentationModel):void
		{
			_presentationModel = value;
		}
		
		public function initialized( document : Object, id : String ) : void {
			
			_presentationModel = Model.getInstance(facadeRef).getPresentationModel(presentationModelName);	
			
		}
		
	}
}