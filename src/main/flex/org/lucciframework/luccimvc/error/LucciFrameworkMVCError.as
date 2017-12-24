package org.lucciframework.luccimvc.error
{
	import mx.resources.ResourceManager;
	import mx.utils.StringUtil;

	public class LucciFrameworkMVCError extends Error
	{
		
		[ResourceBundle("LucciErrorMessages")] 
		
		public function LucciFrameworkMVCError( errorCode : String, ... rest )
		{
			super( formatMessage( errorCode, rest.toString() ) );
		}
		
		private function formatMessage( errorCode : String, ... rest ) : String
		{
			var message : String =  StringUtil.substitute( ResourceManager.getInstance().getString('LucciErrorMessages',errorCode), rest );
			
			return StringUtil.substitute( "{0}: {1}", errorCode, message);
		}
		
	}
}