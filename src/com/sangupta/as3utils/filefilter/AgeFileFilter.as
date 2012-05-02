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
	 * based on a cutoff time. Can filter either newer files or older (cutoff 
	 * included in both cases). 
	 * 
	 * @author sangupta
	 * @since 1.0
	 */
	public class AgeFileFilter implements IFileFilter {
		
		private var cutoff:Number = 0;
		
		private var older:Boolean = false;
		
		/**
		 * Create a new instance of <code>AgeFileFilter</code>
		 * 
		 * @param date the date to be compared against
		 * 
		 * @param older a boolean value of <code>true</code> signifies that files
		 * that were last modified before the given date are selected. A boolean
		 * value of <code>false</code> signifies that files newer than the given
		 * date are selected. 
		 */
		public function AgeFileFilter(date:Date, older:Boolean = false) {
			super();
			
			if(date == null) {
				throw new ArgumentError('Date cannot be null.');
			}
			
			this.cutoff = date.time;
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
			if(older) {
				return file.modificationDate.time <= cutoff;
			}
			
			return file.modificationDate.time >= cutoff;
		}
	}
}
