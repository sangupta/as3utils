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

package com.sangupta.as3utils.filefilter {
	
	import flash.filesystem.File;

	/**
	 * An implementation of <code>FileFilter</code> that selects all files
	 * that match the given name irrespective of the extension.
	 * 
	 * @author <a href="http://www.sangupta.com">Sandeep Gupta</a>
	 * @since 1.0
	 */
	public class NameFileFilter implements IFileFilter {
		
		private var name:String = null;
		
		/**
		 * Contructor.
		 */
		public function NameFileFilter(name:String) {
			super();
			
			if(name == null) {
				throw new ArgumentError('Name cannot be null. To match files that do not have a name, leave it blank.');
			}
			
			this.name = name;
		}
		
		/**
		 * Test whether the supplied file fulfills the criteria of this filter.
		 * 
		 * @param the file to be tested against
		 * 
		 * @return <code>true</code> if the file can be accepted by the filter,
		 * <code>false</code> otherwise.
		 */
		public function accept(file:File):Boolean {
			var n:String = file.name.substr(0, file.name.length - file.extension.length - 1);
			if(this.name == n) {
				return true;
			}
			
			return false;
		}
	}
}
