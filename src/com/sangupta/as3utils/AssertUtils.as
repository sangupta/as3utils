/**
 *
 * as3utils - ActionScript Utility Classes
 * Copyright (C) 2011, Sandeep Gupta
 * http://www.sangupta.com/projects/as3utils
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

package com.sangupta.as3utils {

	import mx.collections.ArrayCollection;
	import mx.collections.ArrayList;
	import mx.utils.ArrayUtil;
	
	/**
	 * General assertion utilities to check for various objects being <code>null</code> or
	 * empty.
	 * 
	 * @author sangupta
	 * @since 1.0
	 */
	public class AssertUtils {
		
		/**
		 * <code>AssertUtils</code> instances should NOT be constructed in standard programming.
		 */
		public function AssertUtils() {
			super();
		}
		
		/**
		 * Assertion method to check if an object is not null, or throw an <code>Error</code>
		 * in case it is.
		 * 
		 * @param object the object to be tested for <code>null</code>
		 * 
		 * @param errorMessage the error message that needs to be thrown as an <code>Error</code>, else
		 * a default message will be used
		 * 
		 * @throws Error if the fiven object is <code>null</code>
		 */
		public static function notNull(object:Object, errorMessage:String = null):void {
			if(object == null) {
				if(errorMessage == null) {
					errorMessage = 'ASSERT FAIL: Object is null.';
				}
					
				throw new Error(errorMessage);
			}
		}
		
		/**
		 * Tests if the given array is <code>null</code> or empty.
		 * 
		 * @param array the array to be tested
		 * 
		 * @return Returns <code>true</code> if the given Array is <code>null</code>
		 * or contains no element, <code>false</code> otherwise.
		 */
		public static function isEmptyArray(array:Array):Boolean {
			if(array == null || array.length == 0) {
				return true;
			}
			
			return false;
		}
		
		/**
		 * Tests if the given array is non-empty.
		 * 
		 * @param array the array to be tested
		 * 
		 * @return Returns <code>false</code> if the given Array object is <code>null</code>
		 * or contains no element, <code>true</code> otherwise.
		 */
		public static function isNotEmptyArray(array:Array):Boolean {
			return !isEmptyArray(array);
		}
		
		/**
		 * Test if the given array collection is null or empty.
		 * 
		 * @param arrayCollection the collection to be tested
		 * 
		 * @return Returns <code>true</code> if the given ArrayCollection object is <code>null</code>
		 * or contains no element, <code>false</code> otherwise.
		 */
		public static function isEmptyArrayCollection(arrayCollection:ArrayCollection):Boolean {
			if(arrayCollection == null || arrayCollection.length == 0) {
				return true;
			}
			
			return false;
		}
		
		/**
		 * Test if the given array collection is non-empty.
		 * 
		 * @param arrayCollection the collection to be tested
		 * 
		 * @return Returns <code>false</code> if the given ArrayCollection object is <code>null</code>
		 * or contains no element, <code>true</code> otherwise.
		 */
		public static function isNotEmptyArrayCollection(arrayCollection:ArrayCollection):Boolean {
			return !isEmptyArrayCollection(arrayCollection);
		}
		
		/**
		 * Test if the given array list is null or empty.
		 * 
		 * @param arrayList the array list to be tested
		 * 
		 * @return Returns <code>true</code> if the given ArrayList object is <code>null</code>
		 * or contains no element, <code>false</code> otherwise.
		 */
		public static function isEmptyArrayList(arrayList:ArrayList):Boolean {
			if(arrayList == null || arrayList.length == 0) {
				return true;
			}
			
			return false;
		}
		
		/**
		 * Test if the given array list is non-empty.
		 * 
		 * @param arrayList the array list to be tested
		 * 
		 * @return Returns <code>false</code> if the given ArrayList object is <code>null</code>
		 * or contains no element, <code>true</code> otherwise.
		 */
		public static function isNotEmptyArrayList(arrayList:ArrayList):Boolean {
			return !isEmptyArrayList(arrayList);
		}
		
		/**
		 * Test if the given string is null or empty.
		 * 
		 * @param string the string to be tested
		 * 
		 * @return Returns <code>true</code> if the given String object is <code>null</code>
		 * or contains no element, <code>false</code> otherwise.
		 */
		public static function isEmptyString(string:String):Boolean {
			if(string == null || string.length == 0) {
				return true;
			}
			
			return false;
		}
		
		/**
		 * Test if the given string is not null and not empty.
		 * 
		 * @param string the string to be tested
		 * 
		 * @return Returns <code>false</code> if the given String object is <code>null</code>
		 * or contains no element, <code>true</code> otherwise.
		 */
		public static function isNotEmptyString(string:String):Boolean {
			return !isEmptyString(string);
		}

		/**
		 * Test if the given number is a valid number or not.
		 * 
		 * @param number the number to be tested
		 * 
		 * @return Returns <code>true</code> if the given number is defined, and fails
		 * the <code>isNaN(number)</code> test.
		 */
		public static function isValidNumber(number:Number):Boolean {
			return !isInvalidNumber(number);
		}

		/**
		 * Test if the given number is not a valid number.
		 * 
		 * @param number the number to be tested
		 * 
		 * @return Returns <code>true</code> if the given number is not yet defined, and passes
		 * the <code>isNaN(number)</code> test.
		 */
		public static function isInvalidNumber(number:Number):Boolean {
			return !isNaN(number);
		}
	}
}
