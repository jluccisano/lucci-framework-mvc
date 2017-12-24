package org.lucciframework.luccimvc.model.presenationModel
{
	import org.lucciframework.luccimvc.core.ICore;


	public interface IPresentationModel extends ICore
	{

		function get presentationModelName () : String;
		
		function set presentationModelName ( value : String ) : void;
			
	}
}