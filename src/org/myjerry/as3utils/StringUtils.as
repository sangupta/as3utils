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
	
	import mx.utils.StringUtil;
	
	/**
	 * General string manipulation utilities.
	 * Modelled around the Apache Commons <code>StringUtils.java</code>.
	 * 
	 * @author Sandeep Gupta
	 * @since 1.0
	 */
	public class StringUtils {
		
		/**
		 * The empty string ""
		 */
		public static const EMPTY:String = "";
		
		/**
		 * String containing all white space characters.
		 */
		private static const WHITESPACES:String = " \n\t";
		
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
		
		/**
		 * Abbreviate a given string by padding it with ellipsis at the end (and at start if needed).
		 */
		public static function abbreviate(string:String, maxWidth:uint, offset:uint = 0):String {
			if(string == null) {
				return null;
			}
			
			if(maxWidth < 4) {
				throw new ArgumentError('Minimum abbreviation width is 4');
			}
			
			var length:uint = string.length;
			
			if(length <= maxWidth) {
				return string;
			}
			
			if(offset > length) {
				offset = length;
			} 
			
			if ((length - offset) < (maxWidth - 3)) {
				offset = length - (maxWidth - 3);
			}
			if (offset <= 4) {
				return string.substring(0, maxWidth - 3) + "...";
			}
			
			if (maxWidth < 7) {
				throw new ArgumentError("Minimum abbreviation width with offset is 7");
			}
			
			if ((offset + (maxWidth - 3)) < length) {
				return "..." + abbreviate(string.substring(offset), maxWidth - 3);
			}
			
			return "..." + string.substring(length - (maxWidth - 3));
		}
		
		/**
		 * Center a given string by padding with the given pad character (or blank space) in the specified length.
		 */
		public static function center(string:String, size:uint, padChar:String = " "):String {
			if (AssertUtils.isEmptyString(string)) {
				return string;
			}

			if(padChar.length != 1) {
				throw new ArgumentError('Padding character should be exactly 1 character in length, got: ' + padChar);
			}

			var strLen:int = string.length;
			var pads:int = size - strLen;
			
			if (pads <= 0) {
				return string;
			}
			
			string = leftPad(string, strLen + pads / 2, padChar);
			string = rightPad(string, size, padChar);
			
			return string;
		}
		
		/**
		 * Left pad the given string with the given pad character (or blank space) to bring 
		 * it to the given minimum size.
		 */ 
		public static function leftPad(string:String, size:uint, padChar:String = " "):String {
			if (string == null) {
				return null;
			}
			
			if(padChar.length != 1) {
				throw new ArgumentError('Padding character should be exactly 1 character in length, got: ' + padChar);
			}
			
			var pads:int = size - string.length;
			
			if (pads <= 0) {
				return string; // returns original String when possible
			}
			
			var padding:String = "";
			for (var i:int = 0; i < pads; i++) {
				padding += padChar;
			}
			
			return padding + string;
		}
		
		/**
		 * Right pad the given string with the given pad character (or blank space) to bring 
		 * it to the given minimum size.
		 */
		public static function rightPad(string:String, size:uint, padChar:String = " "):String {
			if (string == null) {
				return null;
			}
			
			if(padChar.length != 1) {
				throw new ArgumentError('Padding character should be exactly 1 character in length, got: ' + padChar);
			}
			
			var pads:int = size - string.length;
			
			if (pads <= 0) {
				return string; // returns original String when possible
			}
			
			var padding:String = "";
			for (var i:int = 0; i < pads; i++) {
				padding += padChar;
			}
			
			return string + padding;
		}
		
		/**
		 * Test equality in two given strings, <i>case-sensitively</i>.
		 */
		public static function equals(string1:String, string2:String):Boolean {
			if(string1 == null || string2 == null) {
				return false;
			}
			
			if(string1.length != string2.length) {
				return false;
			}
			
			if(string1 == string2) {
				return true;
			}
			
			return false;
		}
		
		/**
		 * Test equality in two given strings, <i>case-insensitively</i>.
		 */
		public static function equalsIgnoreCase(string1:String, string2:String):Boolean {
			if(string1 == null || string2 == null) {
				return false;
			}
			
			if(string1.length != string2.length) {
				return false;
			}
			
			string1 = string1.toLowerCase();
			string2 = string2.toLowerCase();
			
			if(string1 == string2) {
				return true;
			}
			
			return false;
		}
		
		/**
		 * Get <code>length</code> characters from the given position in the string.
		 */
		public static function mid(string:String, position:uint, length:uint):String {
			if(string == null || string.length == 0) {
				throw new ArgumentError('Given string is null/empty.');
			}
			
			return string.substr(position, length);
		}
		
		/**
		 * Get left-most <code>length</code> characters from the string.
		 */
		public static function left(string:String, length:uint):String {
			if(string == null || string.length == 0) {
				throw new ArgumentError('Given string is null/empty.');
			}
			
			return string.substr(0, length);
		}
		
		/**
		 * Get right-most <code>length</code> characters from the string.
		 */
		public static function right(string:String, length:uint):String {
			if(string == null || string.length == 0) {
				throw new ArgumentError('Given string is null/empty.');
			}
			
			return string.substring(string.length - length);
		}
		
		/**
		 * Removes all leading whitespaces from the given string.
		 */
		public static function leftTrim(string:String):String {
			if(AssertUtils.isEmptyString(string)) {
				return string;
			}
			
			for(var index:int = 0; index < string.length; index++) {
				if(WHITESPACES.indexOf(string.charAt(index)) == -1) {
					return string.substr(index);
				}
			}
			
			return EMPTY;
		}
		
		/**
		 * Removes all trailing whitespaces from the given string.
		 */
		public static function rightTrim(string:String):String {
			if(AssertUtils.isEmptyString(string)) {
				return string;
			}

			for(var index:int = string.length; index > 0; index--) {
				if(WHITESPACES.indexOf(string.charAt(index - 1)) == -1) {
					return string.substring(0, index);
				}
			}
			
			return EMPTY;
		}
		
		/**
		 * Removes all leading and trailing whitespaces from the given string.
		 */
		public static function trim(string:String):String {
			if(AssertUtils.isEmptyString(string)) {
				return string;
			}

			return StringUtil.trim(string);
		}
		
		/**
		 * Gets a String's length or 0 if the String is <code>null</code>.
		 */
		public static function length(string:String):uint {
			if(string == null) {
				return 0;
			}
			
			return string.length;
		}
		
		/**
		 * Finds the n-th occurence of searchString within a String, handling <code>null</code>.
		 */
		public static function ordinalIndexOf(string:String, searchString:String, ordinal:uint):int {
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
		
		/**
		 * Converts the first character of the string to upper case (if needed).
		 */
		public static function capitalize(string:String):String {
			if (AssertUtils.isEmptyString(string)) {
				return string;
			}
			
			return string.charAt(0).toUpperCase() + string.substring(1);
		}

		/**
		 * Converts the first character of the string to lower case (if needed).
		 */
		public static function uncapitalize(string:String):String {
			if (AssertUtils.isEmptyString(string)) {
				return string;
			}
			
			return string.charAt(0).toLowerCase() + string.substring(1);
		}
		
		/**
		 * Checks if a given string contains a search String, handling <code>null</code>.
		 */
		public static function contains(string:String, searchString:String):Boolean {
			if(string == null || searchString == null) {
				return false;
			}
			
			if(string.length == searchString.length == 0) {
				return true;
			}
			
			if(string.length < searchString.length) {
				return false;
			}
			
			if(string.indexOf(searchString) != -1) {
				return true;
			}
			
			return false;
		}
		
		/**
		 * Checks if a given string contains a search String, ignoring case, handling <code>null</code>.
		 */
		public static function containsIgnoreCase(string:String, searchString:String):Boolean {
			if(string == null || searchString == null) {
				return false;
			}
			
			if(string.length == searchString.length == 0) {
				return true;
			}
			
			if(string.length < searchString.length) {
				return false;
			}
			
			string = string.toLowerCase();
			searchString = string.toLowerCase();
			
			if(string.indexOf(searchString) != -1) {
				return true;
			}
			
			return false;
		}
		
		/**
		 * Convert the given string to a <code>Boolean</code> value. Returns <code>true</code> if the string is
		 * any of <code>'yes', 'true', or 'on'</code>. Returns <code>false</code> if the string is any of <code>
		 * 'no', 'false', or 'off'</code>. Returns the mentioned default value if the string is <code>null</code>,
		 * empty or any other given string. 
		 */
		public static function getBoolean(boolString:String, defaultValue:Boolean = false):Boolean {
			if(AssertUtils.isNotEmptyString(boolString)) {
				boolString = StringUtil.trim(boolString.toLowerCase());
				if(equals("yes", boolString) || equals("true", boolString) || equals("on", boolString)) {
					return true;
				}
				
				if(equals("no", boolString) || equals("false", boolString) || equals("off", boolString)) {
					return false;
				}
				
			}
			
			return defaultValue; 
		}
		
		/**
		 * Convert the given string to a <code>Number</code>. Returns ZERO if the string is <code>null</code>, or empty.
		 */
		public static function getNumber(number:String):Number {
			if(AssertUtils.isEmptyString(number)) {
				return 0;
			}
			
			return Number(number);
		}
	}
}
