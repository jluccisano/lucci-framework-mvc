/*



*/
package org.lucciframework.luccimvc.controller
{
	import flash.utils.Dictionary;
	import flash.utils.describeType;
	import flash.utils.getQualifiedClassName;
	
	import mx.logging.ILogger;
	import mx.logging.Log;
	
	import org.lucciframework.luccimvc.controller.command.ICommand;
	import org.lucciframework.luccimvc.controller.event.LucciEvent;
	import org.lucciframework.luccimvc.controller.event.LucciEventDispatcher;
	import org.lucciframework.luccimvc.controller.event.LucciEvent;
	import org.lucciframework.luccimvc.controller.event.LucciEventDispatcher;
	import org.lucciframework.luccimvc.core.Core;
	import org.lucciframework.luccimvc.error.LucciFrameworkMVCError;
	import org.lucciframework.luccimvc.error.LucciMessageCodes;
	
	/**
	 * Le contrôleur est un multiton.
	 * Il existe un seul contrôleur par facade
	 * Le contrôleur est charger de dispatcher les événements vers les bonnes
	 * commandes.
	 */
	public class Controller extends Core implements IController
	{
		
		private static const logger:ILogger = Log.getLogger("org.lucciframework.controller.Controller");
		
		private static var controllerMap : Dictionary = new Dictionary ();
		
		private var commandMap : Dictionary;
		
		/**
		 * Constructeur.
		 */
		public function Controller( facadeRef : String )
		{
			this.facadeRef = facadeRef;
			commandMap = new Dictionary();
		}
		
		/**
		 * Permet d'obtenir une instance du controleur relatif à une facade.
		 */
		public static function getInstance ( facadeRef : String ): IController {
			
			if ( controllerMap [ facadeRef ] != null )
				throw new LucciFrameworkMVCError ( LucciMessageCodes.SINGLETON_EXCEPTION );
							
				controllerMap [ facadeRef ] = new Controller ( facadeRef );
				
				logger.info("new controller on facade reference: " + facadeRef);
			
			return controllerMap [ facadeRef ];
		}
		
		/**
		 * Permet de supprimer la référence d'un contrôleur.
		 */
		public static function removeController( facadeRef:String ):void
		{
			delete controllerMap [ facadeRef ];	
			
			logger.info("remove controller on facade reference: " + facadeRef);
		}
		
		/**
		 * Permet d'ajouter une commande
		 */
		
		public function addCommand( commandName : String, commandRef : Class, useWeakReference : Boolean = true ) : void {	
			
			if ( commandName == null ) 
				throw new LucciFrameworkMVCError( LucciMessageCodes.COMMAND_NAME_NULL );
			
			if ( commandRef == null ) 
				throw new LucciFrameworkMVCError( LucciMessageCodes.COMMAND_REF_NULL );
			
			if( commandMap[ commandName ] != null )
				throw new LucciFrameworkMVCError( LucciMessageCodes.COMMAND_ALREADY_REGISTERED, commandName );
			
			if ( implementsICommand( commandRef ) == false )
				throw new LucciFrameworkMVCError( LucciMessageCodes.COMMAND_SHOULD_IMPLEMENT_ICOMMAND, commandRef );
					
			commandMap [ commandName ] = commandRef;
			
			logger.info("add new command on controller with facade reference: " + facadeRef);
			
			LucciEventDispatcher.instance.addEventListener( commandName, executeCommand, false, 0, useWeakReference );	
		}
		
		public function removeCommand( commandName : String ) : void {
			
			if ( commandName  === null )
				throw new LucciFrameworkMVCError( LucciMessageCodes.COMMAND_NAME_NULL, commandName);  
			
			if ( commandMap[ commandName ] === undefined )
				throw new LucciFrameworkMVCError( LucciMessageCodes.COMMAND_NOT_REGISTERED, commandName);  
			
			delete commandMap[ commandName ]; 
			
			logger.info("remove command on controller with facade reference: " + facadeRef);
			
			LucciEventDispatcher.instance.removeEventListener( commandName, executeCommand );	
		}
		
		protected function executeCommand( event : org.lucciframework.luccimvc.controller.event.LucciEvent ) : void {
			
			logger.info("Handling event: {0}", event.type);
			
			var commandToInitialise : Class = getCommand( event.type );
			
			var commandToExecute : ICommand = new commandToInitialise();

			commandToExecute.facadeRef = this.facadeRef;
			
			commandToExecute.executeCommand( event );
		}
		
		public function hasCommand( commandName:String ) : Boolean
		{
			return  commandMap [ commandName ] != null ;
		}
		
		private function getCommand( commandName : String ) : Class {
			
			logger.info("Executing command: {0}", getQualifiedClassName(commandName));
			
			var command : Class = commandMap [ commandName ];
			
			if ( commandName == null )
				throw new LucciFrameworkMVCError( LucciMessageCodes.COMMAND_NOT_FOUND, commandName );
			
			return command;
		}
		

		private function implementsICommand( commandRef : Class ) : Boolean
		{			
			var classDescription : XML = describeType( commandRef ) as XML;
			
			return classDescription.factory.implementsInterface.( @type == getQualifiedClassName( ICommand ) ).length() != 0;
		}
			
	}
}