package org.lucciframework.luccimvc.business
{
	import flash.utils.Dictionary;
	import flash.utils.describeType;
	
	import mx.logging.ILogger;
	import mx.logging.Log;
	import mx.rpc.http.HTTPService;
	import mx.rpc.remoting.RemoteObject;
	import mx.rpc.soap.WebService;
	
	import org.lucciframework.luccimvc.core.Core;
	
	public class Services extends Core implements IServices
	{
		
		private static const logger:ILogger = Log.getLogger("org.lucciframework.luccimvc.business.Services");
		
		private var _httpServiceList : Dictionary;
		private var _remoteObjectList : Dictionary;
		private var _webServiceList : Dictionary;
				
		public function Services()
		{
			_httpServiceList = new Dictionary();
			_remoteObjectList = new Dictionary();
			_webServiceList = new Dictionary();
		}
		
		public static function getInstance ( facadeRef : String ): IServices {
			
			if ( serviceMap [ facadeRef ] == null )
			{			
				var temp : Services =  new Services();
				temp.facadeRef = facadeRef;
				serviceMap [ facadeRef ] = temp;
			}
			return serviceMap [ facadeRef ];
		}
		
		private var services : Dictionary = new Dictionary();
		
		/**
		 * Permet de supprimer la référence d'un contrôleur.
		 */
		public static function removeServices( facadeRef:String ):void
		{
			delete serviceMap [ facadeRef ];	
			
			logger.info("remove services on facade reference: " + facadeRef);
		}
		
		
		public function getHTTPService( name : String ) : HTTPService
		{
			var httpService : HTTPService = _httpServiceList [ name ];
			
			if ( httpService == null ) {
				throw new Error();
			}
			return _httpServiceList [ name ];
		}
		
		public function getRemoteObject( name : String ) : RemoteObject
		{
			var remoteObject : RemoteObject = _remoteObjectList [ name ];
			
			if ( remoteObject == null ) {
				throw new Error();
			}
			
			return _remoteObjectList [ name ];
		}
		
		public function getWebService( name : String ) : WebService
		{
			var webService : WebService = _webServiceList [ name ];
			
			if ( webService == null ) {
				throw new Error();
			}
			
			return _webServiceList [ name ];			
		}
		
		
		private function initServices () : void{
			register(this);
		}
		
		public function register( service : IServices ) : void
		{
			var accessors : XMLList = getAccessors( service );
			
			for ( var i : uint = 0; i < accessors.length(); i++ )
			{
				var name : String = accessors[ i ];
				var obj : Object = service[ name ];
				
				if ( obj is RemoteObject ){
					RemoteObject ( obj ).requestTimeout = _timeout;
					_remoteObjectList[ name ] = obj;
					
				}
				if ( obj is HTTPService ){
					HTTPService ( obj ).requestTimeout = _timeout;
					_httpServiceList[ name ] = obj;
				}
				if ( obj is WebService ){
					WebService ( obj ).requestTimeout = _timeout;
					_webServiceList[ name ] = obj;
				}
			}
		}
		
		private function getAccessors( services : IServices ) : XMLList
		{        
			var description : XML = describeType( services );
			var accessors : XMLList = description.accessor.( @access == "readwrite" ).@name;
			
			return accessors;
		}
		
		private var _timeout : int;
		
		/**
		 * Set the timeout of all services.
		 */
		public function set timeout( timeoutTime : int ) : void
		{
			_timeout = timeoutTime;
		}      
		
		/**
		 * get the timeout for the services.
		 */
		public function get timeout() : int
		{
			return _timeout;
		}  
		
		private static var _serviceMap : Dictionary = new Dictionary ();
		
		public static function get serviceMap () : Dictionary {
			return _serviceMap;
		}
		
		public static function set serviceMap ( value : Dictionary ) : void {
			_serviceMap = value;	
		}
		
		
		override public function set facadeRef ( value : String ) : void {
			_facadeRef = value;
			initialized();	
		}
		
		public function initialized() : void {
			
			if ( serviceMap [ _facadeRef ] ) {
				throw new Error ("The Service is already instanciated");
			}
			
			serviceMap [ _facadeRef ] = this;
			
			initServices();
		}
	}
}