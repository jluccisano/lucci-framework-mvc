/*




*/
package org.lucciframework.luccimvc.controller.command
{
	import flash.utils.getQualifiedClassName;
	
	import mx.logging.ILogger;
	import mx.logging.Log;
	import mx.rpc.IResponder;
	
	import org.lucciframework.luccimvc.controller.event.LucciEvent;
	import org.lucciframework.luccimvc.core.Core;
	
	/**
	 * Cette classe permet d'éxécuter une commande
	 */
	
	public class Command extends Core implements ICommand, IResponder
	{
		
		private static const logger:ILogger = Log.getLogger("org.lucciframework.controller.command.Command");
		
		/**
		 * 
		 */
		protected var event : LucciEvent;
		
		private var startTime : Number;
		
		/**
		 * @private
		 */
		public function executeCommand ( _event : LucciEvent ) : void {
			
			event = _event;
			
			execute( event );
			notify();
		}
		
		/**
		 * Permet de réaliser les traitements relatif à l'événement dispatcher.
		 */
		protected function execute( event : LucciEvent ) : void 
		{			
			//event = LucciEvent ( event );
			
			startTime = flash.utils.getTimer();
		}
		
		/**
		 * @private
		 */
		private function notify () : void 
		{		
			if ( event.notificationType != null )
					new LucciEvent( event.notificationType ).dispatch();
		}
		
		public function result(data:Object):void
		{
			logCommandDuration("result");
		}
		
		public function fault(info:Object):void
		{
			logCommandDuration("fault");
		}
				
		private function logCommandDuration(outcome:String):void
		{
			logger.info("Command executed: class={0}, outcome={1}, duration={2}ms", 
				getQualifiedClassName(this), 
				outcome, 
				flash.utils.getTimer() - startTime);
		}
		
	}
}