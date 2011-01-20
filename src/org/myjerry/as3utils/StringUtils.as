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
	
	/**
	 * General string manipulation utilities.
	 * Modelled around the Apache Commons <code>StringUtils.java</code>.
	 * 
	 * @author sangupta
	 * @since Jan 19, 2011
	 */
	public class StringUtils {
		
		/**
		 * The empty string ""
		 */
		public static const EMPTY:String = "";
		
		/**
		 * <code>StringUtils</code> instances should NOT be constructed in standard programming.
		 */
		public function StringUtils() {
			super();
		}
		
		public static function toInitials(string:String):String {
			if(AssertUtils.isEmptyString(string)) {
				return string;
			}
			
			var camelLetters:String = string.match(/[A-Z]/g).join('');
			return camelLetters.toLowerCase();
		}
		
		public static function abbreviate(string:String, maxWidth:uint):String {
			return null;
		}
		
		public static function center(string:String, size:uint, padString:String = ""):String {
			return null;
		}
		
		public static function equals(string1:String, string2:String):Boolean {
			return false;
		}
		
		public static function equalsIgnoreCase(string1:String, string2:String):Boolean {
			return false;
		}
		
		public static function mid(string:String, position:uint, length:uint):String {
			return null;
		}
		
		public static function left(string:String, length:uint):String {
			return null;
		}
		
		public static function right(string:String, length:uint):String {
			return null;
		}
		
		public static function leftTrim(string:String):String {
			return null;
		}
		
		public static function rightTrim(string:String):String {
			return null;
		}
		
		/**
		 * Gets a String's length or 0 if the String is null.
		 */
		public static function length(string:String):uint {
			if(string == null) {
				return 0;
			}
			
			return string.length;
		}
		
		/**
		 * Finds the n-th index within a String, handling null.
		 */
		public static function ordinalIndexOf(string:String, searchString:String, ordinal:uint):uint {
			return 0;
		}
		
		public static function endsWith(string:String, suffix:String):Boolean {
			return false;
		}
		
		public static function endsWithIgnoreCase(string:String, suffix:String):Boolean {
			return false;
		}
		
		public static function startsWith(string:String, prefix:String):Boolean {
			return false;
		}
		
		public static function startsWithIgnoreCase(string:String, prefix:String):Boolean {
			return false;
		}
		
		public static function swapCase(string:String):String {
			return null;
		}
		
		public static function capitalize(string:String):String {
			return null;
		}
		
		public static function uncapitalize(string:String):String {
			return null;
		}
		
		public static function chomp(string:String):String {
			return null;
		}
		
		public static function chompString(string:String):String {
			return null;
		}
	}
}
