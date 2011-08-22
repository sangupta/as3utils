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
	 * Operations on <code>Boolean</code> values.
	 * 
	 * @author <a href="http://www.sangupta.com">Sandeep Gupta</a>
	 * @since 1.0
	 */
	public class BooleanUtils {
		
		/**
		 * String representation for <code>Boolean true</code> in Yes/No format.
		 */
		public static const YES:String = 'Yes';
		
		/**
		 * String representation for <code>Boolean false</code> in Yes/No format.
		 */
		public static const NO:String = 'No';
		
		/**
		 * String representation for <code>Boolean true</code> in True/False format.
		 */
		public static const TRUE:String = 'True';
		
		/**
		 * String representation for <code>Boolean false</code> in True/False format.
		 */
		public static const FALSE:String = 'False';
		
		/**
		 * String representation for <code>Boolean true</code> in On/Off format.
		 */
		public static const ON:String = 'On';
		
		/**
		 * String representation for <code>Boolean false</code> in On/Off format.
		 */
		public static const OFF:String = 'Off';
		
		/**
		 * <code>BooleanUtils</code> instances should NOT be constructed in standard programming.
		 */
		public function BooleanUtils() {
			super();
		}
		
		/**
		 * Return the opposite of the given <code>Boolean</code>.
		 */
		public static function negate(bool:Boolean):Boolean {
			return !bool;
		}
		
		/**
		 * Performs an xor on a set of booleans.
		 * 
		 * <code>BooleanUtils.xor(new boolean[] { true, true })   = false</code>
		 * <code>BooleanUtils.xor(new boolean[] { false, false }) = false</code>
		 * <code>BooleanUtils.xor(new boolean[] { true, false })  = true</code>
		 */
		public static function xor(array:Array):Boolean {
			// Validate input
			if(array == null) {
				throw new ArgumentError('Array must not be null.');
			}
			
			if(array.length == 0) {
				throw new ArgumentError('Array is empty.');
			}
			
			// Loop through values, comparing each item
			var trueCount:int = 0;
			for each(var o:Object in array) {
				if(!(o is Boolean)) {
					throw new ArgumentError('Array contains objects other than Boolean.');
				}
				
				if(o as Boolean) {
					if(trueCount < 1) {
						trueCount++;
					} else {
						return false;
					}
				}
			}
			
			// Returns true if there was exactly 1 true item
			return trueCount == 1;
		}
		
		public static function isTrue(bool:String):Boolean {
			if(AssertUtils.isNotEmptyString(bool)) {
				bool = bool.toLowerCase();
				if('on' == bool || 'yes' == bool || 'true' == bool) {
					return true;
				}
			}
			
			return false;
		}
		
		public static function isFalse(bool:String):Boolean {
			return !isTrue(bool);
		}
		
		public static function fromStringOnOff(bool:String):Boolean {
			if(AssertUtils.isNotEmptyString(bool)) {
				bool = bool.toLowerCase();
				if('on' == bool) {
					return true;
				} else if('off' == bool) {
					return false;
				}
			}
			
			throw new ArgumentError("Boolean value must be amongst 'on' or 'off' case-insensitive, got: " + bool);
		}
		
		public static function fromStringTrueFalse(bool:String):Boolean {
			if(AssertUtils.isNotEmptyString(bool)) {
				bool = bool.toLowerCase();
				if('true' == bool) {
					return true;
				} else if('false' == bool) {
					return false;
				}
			}
			
			throw new ArgumentError("Boolean value must be amongst 'true' or 'false' case-insensitive, got: " + bool);
		}
		
		public static function fromStringYesNo(bool:String):Boolean {
			if(AssertUtils.isNotEmptyString(bool)) {
				bool = bool.toLowerCase();
				if('yes' == bool) {
					return true;
				} else if('no' == bool) {
					return false;
				}
			}
			
			throw new ArgumentError("Boolean value must be amongst 'yes' or 'no' case-insensitive, got: " + bool); 
		}
		
		/**
		 * Convert the given <code>Boolean</code> value to a string 
		 * representation in On/Off format.
		 */ 
		public static function toStringOnOff(bool:Boolean):String {
			if(bool) {
				return ON;
			}
			
			return OFF;
		}
		
		/**
		 * Convert the given <code>Boolean</code> value to a string 
		 * representation in True/False format.
		 */ 
		public static function toStringTrueFalse(bool:Boolean):String {
			if(bool) {
				return TRUE;
			}
			
			return FALSE;
		}
		
		/**
		 * Convert the given <code>Boolean</code> value to a string 
		 * representation in Yes/No format.
		 */ 
		public static function toStringYesNo(bool:Boolean):String {
			if(bool) {
				return YES;
			}
			
			return NO;
		}
	}
}
