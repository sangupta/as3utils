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

package org.myjerry.as3utils.filefilter
{
	import flash.filesystem.File;
	
	/**
	 * An implementation of <code>FileFilter</code> that selects files matching
	 * a given file extension.
	 * 
	 * @author <a href="http://www.sangupta.com">Sandeep Gupta</a>
	 * @since 1.0
	 */
	public class ExtensionFileFilter implements IFileFilter {
		
		private var extension:String = null;
		
		public function ExtensionFileFilter(extension:String) {
			super();
			
			if(extension == null) {
				throw new ArgumentError('Extension cannot be null. Leave empty to match files with no extension.');
			}
			
			this.extension = extension;
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
			var ex:String = file.extension;
			if(this.extension == ex) {
				return true;
			}
			
			return false;
		}
	}
}