package org.lucciframework.luccimvc.view
{
	import org.lucciframework.luccimvc.core.ICore;
	import org.lucciframework.luccimvc.view.mediator.IMediator;
	

	public interface IView extends ICore
	{
		
		/**
		 * Get Mediator
		 */
		function getMediator( mediatorName : String ) : IMediator ;
		
		/**
		 * Add Mediator
		 */
		function addMediator ( mediator : IMediator ) : void ;
		
		/**
		 * Remove Mediator
		 */
		function removeMediator ( mediatorName : String ) : void ;
		
		/**
		 * Has Mediator
		 */
		function hasMediator( mediatorName:String ) : Boolean;
	}
}