package org.lucciframework.luccimvc.view.mediator
{
	import flash.utils.Dictionary;
	
	import org.lucciframework.luccimvc.controller.event.LucciEvent;
	import org.lucciframework.luccimvc.core.ICore;

	public interface IMediator extends ICore
	{
		function get mediatorName () : String ;
		
		function set mediatorName ( value : String ) : void ;
	
		
		function set viewComponentMap(value:Dictionary):void;
		
		function get viewComponentMap():Dictionary;
		
		function onResult(lucciEvent:LucciEvent):void;
		
		
	}
}