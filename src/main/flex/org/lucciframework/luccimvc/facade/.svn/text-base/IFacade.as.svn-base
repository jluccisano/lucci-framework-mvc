package org.lucciframework.luccimvc.facade
{
	import org.lucciframework.luccimvc.core.ICore;
	import org.lucciframework.luccimvc.view.mediator.IMediator;
	
	import spark.components.Application;

	public interface IFacade extends ICore
	{

		/**
		 * Add new command
		 */
		function addCommand(commandName:String, commandRef:Class, useWeakReference:Boolean=true):void;

		/**
		 * Remove command
		 */
		function removeCommand(commandName:String):void;

		/**
		 * Has command
		 */
		function hasCommand(commandName:String):Boolean;


		/**
		 * Add new mediator
		 */
		function addMediator(mediator:IMediator):void;

		/**
		 * Get Mediator
		 */
		function getMediator(mediatorName:String):IMediator;

		/**
		 * Remove Mediator
		 */
		function removeMediator(mediatorName:String):void;

		/**
		 * Has mediator
		 */
		function hasMediator(mediatorName:String):Boolean;

		/**
		 * Add Presentation model
		 */
		function addPresentationModel(presentationModel:Class, presentationModelName:String):void;
		
		/**
		 * Remove Presentation model
		 */
		function removePresentationModel(presentationModelName:String):void;

		/**
		 * Has Presentation model
		 */
		function hasPresentationModel(presentationModelName:String):Boolean;
		
		

	}
}