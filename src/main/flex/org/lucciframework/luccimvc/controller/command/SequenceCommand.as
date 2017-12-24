/*


   A Travailler

 */
package org.lucciframework.luccimvc.controller.command
{
	import org.lucciframework.luccimvc.controller.event.LucciEvent;
	import org.lucciframework.luccimvc.controller.event.LucciEventDispatcher;
	import org.lucciframework.luccimvc.core.Core;


	public class SequenceCommand extends Core implements ICommand
	{

		public var nextEvent:LucciEvent;

		public function SequenceCommand(nextEvent:LucciEvent=null):void
		{
			super();
			this.nextEvent=nextEvent;
		}

		public function execute(event:LucciEvent):void
		{
		}

		public function executeNextCommand():void
		{
			var isSequenceCommand:Boolean=(nextEvent != null);

			if (isSequenceCommand)
				LucciEventDispatcher.instance.dispatchEvent(nextEvent);
		}
		
		/**
		 * @private
		 */
		public function executeCommand ( event : LucciEvent ) : void {
			
			execute( event );
			
		}
	}
}