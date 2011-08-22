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
	 * based on a given cutoff size. Can filter either files smalled or 
	 * larger in size (cutoff included in both cases). 
	 * 
	 * @author <a href="http://www.sangupta.com">Sandeep Gupta</a>
	 * @since 1.0
	 */
	public class SizeFileFilter implements IFileFilter {
		
		private var size:Number = 0;
		
		private var larger:Boolean = false;
		
		/**
		 * Contructor.
		 */
		public function SizeFileFilter(size:uint, larger:Boolean = false) {
			super();
			
			if(size == 0) {
				throw new ArgumentError('Use EmptyFileFilter to filter out empty sized files.');
			}
			
			this.size = size;
		}
		
		public function accept(file:File):Boolean {
			if(larger) {
				return file.size >= this.size;
			}
			
			return file.size <= this.size;
		}
	}
}
