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

	import mx.collections.ArrayCollection;
	import mx.collections.ArrayList;
	import mx.utils.ArrayUtil;
	
	/**
	 * General assertion utilities.
	 * 
	 * @author Sandeep Gupta
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
		 */
		public static function notNull(object:Object, errorMessage:String = null):void {
			if(object == null) {
				if(errorMessage == null) {
					errorMessage = 'ASSERT FAIL: Object is null.';
					
					throw new Error(errorMessage);
				}
			}
		}
		
		/**
		 * Returns <code>true</code> if the given Array object is <code>null</code>
		 * or contains no element, <code>false</code> otherwise.
		 */
		public static function isEmptyArray(array:Array):Boolean {
			if(array == null || array.length == 0) {
				return true;
			}
			
			return false;
		}
		
		/**
		 * Returns <code>false</code> if the given Array object is <code>null</code>
		 * or contains no element, <code>true</code> otherwise.
		 */
		public static function isNotEmptyArray(array:Array):Boolean {
			return !isEmptyArray(array);
		}
		
		/**
		 * Returns <code>true</code> if the given ArrayCollection object is <code>null</code>
		 * or contains no element, <code>false</code> otherwise.
		 */
		public static function isEmptyArrayCollection(arrayCollection:ArrayCollection):Boolean {
			if(arrayCollection == null || arrayCollection.length == 0) {
				return true;
			}
			
			return false;
		}
		
		/**
		 * Returns <code>false</code> if the given ArrayCollection object is <code>null</code>
		 * or contains no element, <code>true</code> otherwise.
		 */
		public static function isNotEmptyArrayCollection(arrayCollection:ArrayCollection):Boolean {
			return !isEmptyArrayCollection(arrayCollection);
		}
		
		/**
		 * Returns <code>true</code> if the given ArrayList object is <code>null</code>
		 * or contains no element, <code>false</code> otherwise.
		 */
		public static function isEmptyArrayList(arrayList:ArrayList):Boolean {
			if(arrayList == null || arrayList.length == 0) {
				return true;
			}
			
			return false;
		}
		
		/**
		 * Returns <code>false</code> if the given ArrayList object is <code>null</code>
		 * or contains no element, <code>true</code> otherwise.
		 */
		public static function isNotEmptyArrayList(arrayList:ArrayList):Boolean {
			return !isEmptyArrayList(arrayList);
		}
		
		/**
		 * Returns <code>true</code> if the given String object is <code>null</code>
		 * or contains no element, <code>false</code> otherwise.
		 */
		public static function isEmptyString(string:String):Boolean {
			if(string == null || string.length == 0) {
				return true;
			}
			
			return false;
		}
		
		/**
		 * Returns <code>false</code> if the given String object is <code>null</code>
		 * or contains no element, <code>true</code> otherwise.
		 */
		public static function isNotEmptyString(string:String):Boolean {
			return !isEmptyString(string);
		}
	}
}
