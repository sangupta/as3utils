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
	
	import flash.errors.IOError;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	
	/**
	 * General file manipulation utilities.
	 * 
	 * @author sangupta
	 * @since Jan 19, 2011
	 */
	public class FileUtils {
		
		/**
		 * The number of bytes in a kilobyte.
		 */
		public static const ONE_KB:uint = 1024;
		
		/**
		 * The number of bytes in a megabyte.
		 */
		public static const ONE_MB:uint = 1048576;
		
		/**
		 * The number of bytes in a gigabyte.
		 */
		public static const ONE_GB:uint = 1073741824;
		
		public static function forceDelete(file:File):void {
			if(file == null) {
				throw new ArgumentError('File/Directory cannot be null.');
			}
			
			if(!file.exists) {
				throw new ArgumentError('File/Directory ' + file.name + ' does not exists.');
			}
			
			if(file.isDirectory) {
				deleteDirectory(file);
			}
			
			file.deleteFile();
		}
		
		/**
		 * Compares the contents of two files to determine if they are equal or not.
		 */
		public static function contentEquals(file1:File, file2:File):Boolean {
			if(file1 == null || file2 == null) {
				return false;
			}
			
			if(file1.exists != file2.exists) {
				return false;
			}
			
			// two non-existent files are equal
			if(!file1.exists) {
				return true;
			}
			
			if(file1.isDirectory || file2.isDirectory) {
				throw new ArgumentError("Can't compare directories, only files");
			}
			
			if(file1.nativePath == file2.nativePath) {
				// same file
				return true;
			}

			if(file1.size != file2.size) {
				// lengths dont match
				return false;
			}
			
			var stream1:FileStream = new FileStream();
			var stream2:FileStream = new FileStream();
			try {
				stream1.open(file1, FileMode.READ);
				stream2.open(file2, FileMode.READ);
				
				return IOUtils.contentEquals(stream1, stream2);
			} finally {
				IOUtils.closeQuietly(stream1);
				IOUtils.closeQuietly(stream2);
			}
			
			return false;
		}
		
		/**
		 * Copies a whole directory to a new location.
		 */
		public static function copyDirectory(srcDir:File, destDir:File):void {
			checkDirectory(srcDir);
			
			if(destDir == null) {
				throw new ArgumentError('Destination directory cannot be null.');
			}
			
			if(destDir.exists && !destDir.isDirectory) {
				throw new ArgumentError('Destination ' + destDir.nativePath + ' is not a directory.');
			}
			
			if(srcDir.nativePath == destDir.nativePath) {
				throw new ArgumentError('Source ' + srcDir.nativePath + ' and destination ' + destDir.nativePath + ' are the same.');
			}
			
			// cater to scenarios where destination is a child within the source directory
			var exclusionList:Array = new Array();
			if(StringUtils.startsWith(destDir.nativePath, srcDir.nativePath)) {
				
			}
			
			doCopyDirectory(srcDir, destDir, exclusionList, null);
		}
		
		private static function doCopyDirectory(srcDir:File, destDir:File, exclusionList:Array, filter):void {
			// create destination if needed
			if(!destDir.exists) {
				destDir.createDirectory();
			}
			
			// recursively copy
			
		}
		
		public static function copyDirectoryFiltered(srcDir:File, destDir:File, filter):void {
			
		}
		
		/**
		 * Copies a file to a new location.
		 */
		public static function copyFile(srcFile:File, destFile:File):void {
			
		}
		
		/**
		 * Deletes a directory recursively.
		 */
		public static function deleteDirectory(directory:File):void {
			if(directory == null) {
				throw new ArgumentError('Directory cannot be null.');
			}
			
			if(!directory.exists) {
				return;
			}
			
			if(!directory.isDirectory) {
				throw new ArgumentError('Directory ' + directory.nativePath + ' is not a directory.');
			}
			
			directory.deleteDirectory(true);
		}
		
		/**
		 * Deletes a file, never throwing an exception.
		 */
		public static function deleteQuitely(file:File):Boolean {
			if(file == null) {
				return false;
			}
			
			if(file.isDirectory) {
				try {
					deleteDirectory(file);
					return true;
				} catch(e:Error) {
					// eat up
				}
			} else {
				try {
					file.deleteFile();
					return true;
				} catch(e:Error) {
					// eat up
				}
			}
			
			return false;
		}
		
		/**
		 * Cleans a directory without deleting it.
		 */
		public static function cleanDirectory(directory:File):void {
			// sanity checks
			checkDirectory(directory);
			
			// get the file list
			var files:Array = directory.getDirectoryListing();
			if(AssertUtils.isNotEmptyArray(files)) {
				for each(var file:File in files) {
					forceDelete(file);
				}
			}
		}
		
		/**
		 * Makes a directory, including any necessary but nonexistent parent directories.
		 */
		public static function forceMkdir(directory:File):void {
			if(directory == null) {
				throw new ArgumentError('Directory cannot be null.');
			}
			
			if(directory.exists && !directory.isDirectory) {
				throw new IOError('File ' + directory.nativePath + ' exists and is not a directory.');
			}
			
			directory.createDirectory();
		}
		
		/**
		 * Returns the size of the specified file or directory. If the provided 
		 * File is a regular file, then the file's length is returned. If the 
		 * argument is a directory, then the size of the directory is calculated 
		 * recursively. If a directory or subdirectory is security restricted, 
		 * its size will not be included.
		 */
		public static function sizeOf(file:File):Number {
			if(file == null) {
				throw new ArgumentError('File/Directory cannot be null.');				
			}
			
			if(!file.exists) {
				return -1;
			}
			
			if(file.isDirectory) {
				return sizeOfDirectory(file);
			}
			
			return file.size;
		}
		
		/**
		 * Counts the size of a directory recursively (sum of the length of all files).
		 */
		public static function sizeOfDirectory(directory:File):Number {
			// sanity check
			if(directory == null) {
				throw new ArgumentError('Directory cannot be null.');
			}
			
			if(!directory.isDirectory) {
				throw new ArgumentError('Directory ' + directory.name + ' is not a directory.');
			}

			if(!directory.exists) {
				return -1;
			}
			
			// get size
			var files:Array = directory.getDirectoryListing();
			var sum:Number = 0;
			if(AssertUtils.isNotEmptyArray(files)) {
				for each(var file:File in files) {
					if(file.isDirectory) {
						sum += sizeOfDirectory(file);
					} else {
						sum += file.size;
					}
				}
			}
			
			return sum;
		}
		
		public static function moveDirectory(srcDir:File, destDir:File):void {
			
		}
		
		public static function moveFile(srcFile:File, destFile:File):void {
			
		}
		
		public static function moveFileToDirectory(srcFile:File, destDir:File):void {
			
		}
		
		public static function renameFile(srcFile:File, newName:String):void {
			
		}
		
		/**
		 * Reads the contents of a file into a String using the default encoding for the platform.
		 */
		public static function readFileToString(file:File):String {
			checkFile(file);

			var stream:FileStream = new FileStream();
			stream.open(file, FileMode.READ);
			var result:String = stream.readMultiByte(stream.bytesAvailable, File.systemCharset);
			stream.close();
			
			return result;
		}
		
		/**
		 * Reads the contents of a file into a String in the specified encoding.
		 */
		public static function readFileToStringInEncoding(file:File, encoding:String):String {
			checkFile(file);
			
			var stream:FileStream = new FileStream();
			stream.open(file, FileMode.READ);
			var result:String = stream.readMultiByte(stream.bytesAvailable, encoding);
			stream.close();
			
			return result;
		}
		
		/**
		 * Convenience function to test for file existence on disk.
		 */ 
		private static function checkFile(file:File):void {
			if(file == null) {
				throw new ArgumentError('File cannot be null.');
			}
			
			if(!file.exists) {
				throw new ArgumentError('File ' + file.name + ' does not exists.');
			}
			
			if(file.isDirectory) {
				throw new ArgumentError('File ' + file.name + ' is a directory.');
			}
			
		}
		
		/**
		 * Convenience function to test for directory existence on disk.
		 */
		private static function checkDirectory(directory:File):void {
			if(directory == null) {
				throw new ArgumentError('Directory cannot be null.');
			}
			
			if(!directory.exists) {
				throw new ArgumentError('Directory ' + directory.name + ' does not exists.');
			}
			
			if(!directory.isDirectory) {
				throw new ArgumentError('Directory ' + directory.name + ' is not a directory.');
			}
		}
	}
}
