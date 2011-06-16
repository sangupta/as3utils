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
	
	import flash.net.URLRequestHeader;
	
	/**
	 * General helper functions to work with objects that interact with WEB.
	 * 
	 * @author Sandeep Gupta
	 * @since 1.0
	 */
	public class WebUtils {
		
		/**
		 * <code>WebUtils</code> instances should NOT be constructed in standard programming.
		 */
		public function WebUtils() {
			super();
		}
		
		/**
		 * Returns the value of a given HTTP Header from the list of supplied header values.
		 */
		public static function getHeader(headers:Array, headerName:String):String {
			if(AssertUtils.isEmptyArray(headers)) {
				return null;
			}

			var header:URLRequestHeader = null;
			for each(header in headers) {
				if(StringUtils.equalsIgnoreCase(header.name, headerName)) {
					return header.value;
				}
			}
			
			return null;
		}
	}
}
