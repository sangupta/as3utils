/**
 *
 * as3utils - ActionScript Utility Classes
 * Copyright (C) 2011, myJerry Developers
 * http://www.myjerry.org/as3utils
 *
 * The file is licensed under the the Apache License, Version 2.0
 * (the "License"); you may not use this file except in compliance with
 * the License.  You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 */

package org.myjerry.as3utils {
	
	import flash.system.Capabilities;
	
	/**
	 * General helper functions to work with platform dependencies.
	 * 
	 * @author sangupta
	 * @since Jan 19, 2011
	 */
	public class SystemUtils {
		
		public static function isWindows():Boolean {
			var os:String = Capabilities.os;
			if(os.indexOf('Windows') != -1) {
				return true;
			}
			
			return false;
		}
		
		public static function isMac():Boolean {
			return false;
		}
		
		public static function isLinux():Boolean {
			return false;
		}
		
		public static function isWindowsXP():Boolean {
			return false;
		}
		
		public static function isWindows7():Boolean {
			return false;
		}
		
		public static function isWindowsVista():Boolean {
			return false;
		}
		
		public static function isMacTiger():Boolean {
			return false;
		}
		
		public static function isMacLeopard():Boolean {
			return false;
		}
		
		public static function isMacSnowLeopard():Boolean {
			return false;
		}
	}
}
