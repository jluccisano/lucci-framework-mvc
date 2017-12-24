/*




*/
package org.lucciframework.luccimvc.logging
{
	import mx.logging.Log;
	import mx.logging.LogEventLevel;
	import mx.logging.targets.TraceTarget;
	
	/**
	 * Cette classe permet de configurer la gestion des loggings
	 */

	public class LucciMVCLogging extends TraceTarget
	{
		/**
		 * Constructeur
		 */
		public function LucciMVCLogging()
		{
			this.includeCategory = true;
			this.includeDate = true;
			this.includeLevel = true;
			this.includeTime = true;				
			this.level = LogEventLevel.ALL;
			
			Log.addTarget(this);	
		}
	}
}