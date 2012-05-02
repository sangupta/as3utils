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
	 * based on a given cutoff size. Can filter either files smalled or 
	 * larger in size (cutoff included in both cases). 
	 * 
	 * @author sangupta
	 * @since 1.0
	 */
	public class SizeFileFilter implements IFileFilter {
		
		private var size:Number = 0;
		
		private var larger:Boolean = false;
		
		/**
		 * Create a new instance of the <code>SizeFileFilter</code>.
		 * 
		 * @param size the value of the size to match
		 * 
		 * @param larger value of <code>true</code> signifies if files equal or larger in
		 * size are selected. A value of <code>false</code> signifies if files equal or
		 * smaller in size are selected.
		 */
		public function SizeFileFilter(size:uint, larger:Boolean = false) {
			super();
			
			if(size == 0) {
				throw new ArgumentError('Use EmptyFileFilter to filter out empty sized files.');
			}
			
			this.size = size;
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
			if(larger) {
				return file.size >= this.size;
			}
			
			return file.size <= this.size;
		}
	}
}
