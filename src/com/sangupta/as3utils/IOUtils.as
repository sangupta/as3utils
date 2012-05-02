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

package com.sangupta.as3utils {
	
	import flash.filesystem.FileStream;
	
	/**
	 * Utility functions around I/O.
	 * 
	 * @author sangupta
	 * @since 1.0
	 */
	public class IOUtils {
		
		/**
		 * <code>IOUtils</code> instances should NOT be constructed in standard programming.
		 */
		public function IOUtils() {
			super();
		}
		
		/**
		 * Close a given <code>FileStream</code> object quietly, eating up
		 * any errors.
		 */
		public static function closeQuietly(stream:FileStream):void {
			try {
				if(stream != null) {
					stream.close();
				}
			} catch(e:Error) {
				// eat up
			}
		}
		
		/**
		 * Compare the contents of two <code>FileStream</code> objects to determine
		 * if they are equal or not.
		 */
		public static function contentEquals(stream1:FileStream, stream2:FileStream):Boolean {
			while(stream1.bytesAvailable) {
				var byte1:int = stream1.readByte();

				// check if stream 2 has some bytes
				if(!stream2.bytesAvailable) {
					// stream 2 is smaller than stream 1
					return false;
				}
				
				var byte2:int = stream2.readByte();
				if(byte1 != byte2) {
					// we encountered a difference
					return false;
				}
			}
			
			// stream2 has more bytes than stream1
			if(stream2.bytesAvailable) {
				return false;
			}
			
			// all good
			return true;
		}
	}
}