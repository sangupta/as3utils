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
	
	import com.sangupta.as3utils.filefilter.IFileFilter;
	
	import flash.errors.IOError;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.utils.ByteArray;
	
	/**
	 * General file manipulation utilities.
	 * 
	 * @author sangupta
	 * @since 1.0
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
		
		/**
		 * <code>FileUtils</code> instances should NOT be constructed in standard programming.
		 */
		public function FileUtils() {
			super();
		}
		
		/**
		 * Delete a given file or directory (and all its sub-directories).
		 * 
		 * @param file the file or directory to be deleted, should exist on disk and not be <code>null</code>
		 *
		 * @throws ArgumentError if the file/directory is null
		 * 
		 * @throws ArgumentError if the file/directory does not exist on disk 
		 */
		public static function forceDelete(file:File):void {
			// sanity checks
			if(file == null) {
				throw new ArgumentError('File/Directory cannot be null.');
			}
			
			if(!file.exists) {
				throw new ArgumentError('File/Directory ' + file.name + ' does not exists.');
			}
			
			// go ahead
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
		public static function copyDirectory(srcDir:File, destDir:File, filter:IFileFilter = null):void {
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
			
			doCopyDirectory(srcDir, destDir, exclusionList, filter);
		}
		
		/**
		 * Internal function to copy directory.
		 */
		private static function doCopyDirectory(srcDir:File, destDir:File, exclusionList:Array, filter:IFileFilter):void {
			// create destination if needed
			if(!destDir.exists) {
				destDir.createDirectory();
			}
			
			if(destDir.exists && !destDir.isDirectory) {
				throw new IOError('Destination ' + destDir.nativePath + ' is a file and not a directory.');
			}
			
			var exclusion:Boolean = AssertUtils.isNotEmptyArray(exclusionList);

			// recursively copy
			var files:Array = srcDir.getDirectoryListing();
			if(AssertUtils.isNotEmptyArray(files)) {
				for each(var file:File in files) {
					var targetFile:File = destDir.resolvePath(file.name);
					if(!exclusion) {
						if(file.isDirectory) {
							doCopyDirectory(file, targetFile, exclusionList, filter); 
						} else {
							copyFile(file, targetFile, true);
						}
					}
				}
			}
		}
		
		/**
		 * Copies a file to a new location.
		 */
		public static function copyFile(srcFile:File, destFile:File, overwrite:Boolean = false):void {
			// sanity checks
			checkFile(srcFile);
			
			if(destFile == null) {
				throw new ArgumentError('Destination cannot be null.');
			}
			
			if(!overwrite && !destFile.isDirectory && destFile.exists) {
				throw new IOError('Destination file already exists, overwrite is prevented.');
			}
			
			// copy the file
			srcFile.copyTo(destFile, overwrite);
		}
		
		/**
		 * Deletes a directory recursively.
		 */
		public static function deleteDirectory(directory:File):void {
			// sanity checks
			if(directory == null) {
				throw new ArgumentError('Directory cannot be null.');
			}
			
			if(!directory.exists) {
				return;
			}
			
			if(!directory.isDirectory) {
				throw new ArgumentError('Directory ' + directory.nativePath + ' is not a directory.');
			}
			
			// delete the directory
			directory.deleteDirectory(true);
		}
		
		/**
		 * Deletes a file, never throwing an exception.
		 */
		public static function deleteQuitely(file:File):Boolean {
			// sanity check
			if(file == null) {
				return false;
			}
			
			// delete the file/directory
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
		
		/**
		 * Move the given directory from one location to another. In case the destination directory
		 * is a child of the source directory, every file/directory inside the source directory except
		 * the destination directory will be moved to the destination directory. 
		 */
		public static function moveDirectory(srcDir:File, destDir:File):void {
			// sanity checks
			checkDirectory(srcDir);
			
			if(destDir == null) {
				throw new ArgumentError('Destination directory cannot be null.');
			}
			
			if(!destDir.isDirectory) {
				throw new ArgumentError('Destination ' + destDir.nativePath + ' is a file and not a directory.');
			}
			
			// in case the destination is a child of source, make sure we move everything else except child
		}
		
		/**
		 * Move the source file to the destination location.
		 */
		public static function moveFile(srcFile:File, destFile:File):void {
			// sanity checks
			checkFile(srcFile);
			
			if(destFile == null) {
				throw new ArgumentError('File cannot be null.');
			}
			
			if(!destFile.isDirectory) {
				throw new ArgumentError('File ' + destFile.name + ' is a file and not directory.');
			}
			
			srcFile.moveTo(destFile, true);
		}
		
		/**
		 * Move the file to the given destination folder.
		 */
		public static function moveFileToDirectory(srcFile:File, destDir:File):void {
			// sanity checks
			checkFile(srcFile);
			
			if(destDir == null) {
				throw new ArgumentError('Destination directory cannot be null.');
			}
			
			if(destDir.exists && !destDir.isDirectory) {
				throw new ArgumentError('File ' + destDir.nativePath + ' is a file and not directory.');
			}
			
			// check if the file's containing folder is same as destination folder
			if(destDir.exists && srcFile.parent.nativePath == destDir.nativePath) {
				// do nothing
				return;
			}
			
			if(!destDir.exists) {
				destDir.createDirectory();
			}
			
			var targetFile:File = destDir.resolvePath(srcFile.name);
			
			moveFile(srcFile, targetFile);
		}
		
		/**
		 * Rename the source file to the new name.
		 */
		public static function renameFile(srcFile:File, newName:String):void {
			// sanity checks
			checkFile(srcFile);
			
			if(AssertUtils.isEmptyString(newName)) {
				throw new ArgumentError('New name for the file cannot be empty/null.');
			}
			
			var parentDir:File = srcFile.parent;
			var targetFile:File = parentDir.resolvePath(newName);
			
			if(targetFile.exists && !targetFile.isDirectory) {
				throw new ArgumentError('A file with target name ' + newName + ' already exists.');
			}
			
			moveFile(srcFile, targetFile);
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
		 * Write the given data to the file in the given encoding. If no encoding is specified,
		 * data will be written in the UTF encoding.
		 */
		public static function writeStringToFile(file:File, data:String, encoding:String = null):void {
			if(file == null) {
				throw new ArgumentError('Target file cannot be null.');
			}
			
			if(file.exists && file.isDirectory) {
				throw new ArgumentError('Target file is a directory.');
			}
			
			var stream:FileStream = new FileStream();
			stream.open(file, FileMode.WRITE);
			
			if(encoding == null) {
				stream.writeUTFBytes(data);
			} else {
				stream.writeMultiByte(data, encoding);
			}
			
			IOUtils.closeQuietly(stream);
		}
		
		/**
		 * Append the given data to the file in the given encoding. If no encoding is specified,
		 * data will be written in the UTF encoding.
		 */
		public static function appendStringToFile(file:File, data:String, encoding:String = null):void {
			if(file == null) {
				throw new ArgumentError('Target file cannot be null.');
			}
			
			if(file.exists && file.isDirectory) {
				throw new ArgumentError('Target file is a directory.');
			}
			
			var stream:FileStream = new FileStream();
			stream.open(file, FileMode.APPEND);
			
			if(encoding == null) {
				stream.writeUTFBytes(data);
			} else {
				stream.writeMultiByte(data, encoding);
			}
			
			IOUtils.closeQuietly(stream);
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
		 * Convenience function to test if the given <code>File</code> object 
		 * is a valid directory on disk.
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
		
		/**
		 * Returns a list of all files/directories inside the given directory. Provides a mechanism
		 * to filter out specific files from all the files.
		 */
		public static function getFilesInDirectory(directory:File, filter:IFileFilter = null):Array {
			checkDirectory(directory);
			
			var files:Array = directory.getDirectoryListing();
			
			if(filter == null) {
				return files;
			}
			
			if(AssertUtils.isEmptyArray(files)) {
				return files;
			}
			
			var filtered:Array = new Array();
			for each(var file:File in files) {
				if(filter.accept(file)) {
					filtered.push(file);
				}
			}
			
			return filtered;
		}
		
		/**
		 * Returns <code>true</code> if the given file is not a directory, packages (MacOS), or a symbolic link.
		 */
		public static function isFile(file:File):Boolean {
			checkFile(file);
			
			if(file.isDirectory || file.isPackage || file.isSymbolicLink) {
				return false;
			}
			
			return true;
		}
		
		/**
		 * Reads the given file into a <code>ByteArray</code> object.
		 * 
		 * @param file the file to be read
		 * 
		 * @return the <code>ByteArray</code> object, or <code>null</code> if file does not exists.
		 * 
		 * @throws ArgumentError if the file is <code>null</code> object.
		 */
		public static function readFileToByteArray(file:File):ByteArray {
			checkFile(file);
			
			var stream:FileStream = new FileStream();
			stream.open(file, FileMode.READ);
			
			var byteArray:ByteArray = new ByteArray();
			stream.readBytes(byteArray, 0, file.size);
			
			IOUtils.closeQuietly(stream);
			
			return byteArray;
		}
		
		/**
		 * Write the given byte array to the file.
		 */
		public static function writeByteArrayToFile(file:File, data:ByteArray):void {
			if(file == null) {
				throw new ArgumentError('Target file cannot be null.');
			}
			
			if(file.exists && file.isDirectory) {
				throw new ArgumentError('Target file is a directory.');
			}
			
			var stream:FileStream = new FileStream();
			stream.open(file, FileMode.WRITE);
			
			stream.writeBytes(data, 0, data.length);
			
			IOUtils.closeQuietly(stream);
		}
		
		/**
		 * Tests if the specified folder contains a file with the given filename
		 * 
		 * @param folder the directory in which to check for file
		 * 
		 * @param filename the name of the file to look for
		 * 
		 * @return <code>true</code> if the file exists, <code>false</code> if the folder is null, or does 
		 * not exists, or the file does not exists in folder
		 */ 
		public static function folderContainsFile(folder:File, filename:String):Boolean {
			if(folder == null || !folder.exists) {
				return false;
			}
			
			var filePath:String = folder.nativePath + File.separator + filename;
			var file:File = new File(filePath);
			
			if(file.exists) {
				return true;
			}
			
			return false;
		}
		
	}
}
