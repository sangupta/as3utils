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
	 * Helper class for working with <code>Array</code> class.
	 * 
	 * @author <a href="http://www.sangupta.com">Sandeep Gupta</a>
	 * @since 1.0
	 */
	public class ArrayUtils	{
		
		/**
		 * <code>Arrayutils</code> instances should NOT be constructed in standard programming.
		 */
		public function ArrayUtils() {
			super();
		}

		/**
		 * Method that checks whether the given <code>object</code> is present
		 * in the array using strict === equality.
		 */
		public static function has(array:Array, object:Object):Boolean {
			if(array == null || object == null) {
				return false;
			}
			
			for each(var obj:Object in array) {
				if(obj === object) {
					return true;
				}
			}
			
			return false;
		}
		
		/**
		 * Method that checks whether the given <code>object</code> is present
		 * in the array using normal == equality.
		 */
		public static function contains(array:Array, object:Object):Boolean {
			if(array == null || object == null) {
				return false;
			}
			
			for each(var obj:Object in array) {
				if(obj == object) {
					return true;
				}
			}
			
			return false;
		}
		
		/**
		 * Remove the given item from the array
		 */
		public static function removeItem(array:Array, object:Object):void {
			if(object != null) {
				if(AssertUtils.isNotEmptyArray(array)) {
					for(var index:Number = 0; index < array.length; index++) {
						var item:Object = array[index];
						if(item === object) {
							array.splice(index, 1);
							break;
						}
					}
				}
			}
		}

	}
}
