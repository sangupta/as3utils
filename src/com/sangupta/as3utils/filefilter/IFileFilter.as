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
	 * Contract for implementing classes used to filter out specific files/directories
	 * from a given set of files.
	 * 
	 * @author <a href="http://www.sangupta.com">Sandeep Gupta</a>
	 * @since 1.0
	 */
	public interface IFileFilter {
	
		/**
		 * Function that takes in a file object and returns <code>true</code>
		 * if the file should be accepted in the filtered list, <code>false</code>
		 * otherwise.
		 * 
		 * Implementations will never receive a <code>null</code> argument to this
		 * method.
		 */
		function accept(file:File):Boolean;
	}
}
