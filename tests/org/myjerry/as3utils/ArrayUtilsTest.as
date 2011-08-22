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
	
	import org.flexunit.Assert;
	
	/**
	 *
	 * @author <a href="http://www.sangupta.com">Sandeep Gupta</a>
	 * @since 1.0
	 */
	public class ArrayUtilsTest {
		
		[Test]
		public function testHas():void {
			var object:Object = new Object();
			var array:Array = new Array();
			
			Assert.assertFalse(ArrayUtils.has(array, null));
			Assert.assertFalse(ArrayUtils.has(array, object));
			array.push(object);
			Assert.assertTrue(ArrayUtils.has(array, object));
			array.pop();
			Assert.assertFalse(ArrayUtils.has(array, object));
		}
		
		[Test]
		public function testContains():void {
			var object:Object = new Object();
			var array:Array = new Array();

			Assert.assertFalse(ArrayUtils.contains(array, object));
			Assert.assertFalse(ArrayUtils.contains(array, null));
			array.push(object);
			Assert.assertTrue(ArrayUtils.contains(array, object));
			array.pop();
			Assert.assertFalse(ArrayUtils.contains(array, object));
		}
	}
}
