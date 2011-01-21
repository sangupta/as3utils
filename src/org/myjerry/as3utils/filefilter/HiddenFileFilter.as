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

package org.myjerry.as3utils.filefilter {
	
	import flash.filesystem.File;

	/**
	 * An implementation of <code>FileFilter</code> that selects all files
	 * that are hidden.
	 * 
	 * @author Sandeep Gupta
	 * @since 1.0
	 */
	public class HiddenFileFilter implements IFileFilter {
		
		/**
		 * Contructor.
		 */
		public function HiddenFileFilter() {
			super();
		}
		
		public function accept(file:File):Boolean {
			if(file.isHidden) {
				return true;
			}
			
			return false;
		}
	}
}
