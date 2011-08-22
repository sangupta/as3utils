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
	import flexunit.framework.Assert;
	
	import org.flexunit.asserts.assertTrue;
	
	
	/**
	 *
	 * @author <a href="http://www.sangupta.com">Sandeep Gupta</a>
	 * @since 1.0
	 */
	public class AssertUtilsTest {
		
		[Test]
		public function testNotNull():void {
			try {
				AssertUtils.notNull(new Object());
				Assert.assertTrue(true);
			} catch(e:Error) {
				Assert.assertTrue(false);
			}
			
			try {
				AssertUtils.notNull(null);
				Assert.assertTrue(false);
			} catch(e:Error) {
				Assert.assertTrue(true);
			}
		}
		
		[Test]
		public function testIsEmptyArray():void {
			var array:Array = new Array();
			Assert.assertTrue(AssertUtils.isEmptyArray(array));
			array.push(new Object());
			Assert.assertFalse(AssertUtils.isEmptyArray(array));
			array.pop();
			Assert.assertTrue(AssertUtils.isEmptyArray(array));
		}
		
	}
}
