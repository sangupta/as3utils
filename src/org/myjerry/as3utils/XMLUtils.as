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
	
	import flash.filesystem.File;
	
	/**
	 * Utility class to convert data streams into <code>XML</code> objects,
	 * operations surrounding the same and others.
	 * 
	 * @author <a href="http://www.sangupta.com">Sandeep Gupta</a>
	 * @since 1.0
	 */
	public class XMLUtils {
		
		/**
		 * <code>XMLUtils</code> instances should NOT be constructed in standard programming.
		 */
		public function XMLUtils() {
			super();
		}
		
		/**
		 * Reads the contents of the file at the specified path and
		 * returns an <code>XML</code> object of it.
		 * 
		 * @param path the absolute location of the file to be read
		 * 
		 * @return returns the <code>XML</code> object as parsed from the file contents
		 */ 
		public static function readFilePathToXML(path:String):XML {
			var contents:String = FileUtils.readFileToString(new File(path));
			var xml:XML = new XML(contents);
			
			return xml;
		}
		
		/**
		 * Reads the contents of the given <code>File</code> and returns
		 * an <code>XML</code> object of it.
		 * 
		 * @param file the <code>File</code> object from where the contents are read
		 * 
		 * @return returns the <code>XML</code> object as parsed from the file contents
		 */
		public static function readFileToXML(file:File):XML {
			var contents:String = FileUtils.readFileToString(file);
			var xml:XML = new XML(contents);
			
			return xml;
		}
	}
}
