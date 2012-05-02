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
	
	import flash.filesystem.File;
	import flash.system.Capabilities;
	
	/**
	 * General helper functions to work with platform dependencies.
	 * The values returned by the methods are not cached internally and is left
	 * to the using application to cache as appropriate.
	 * 
	 * @author sangupta
	 * @since 1.0
	 */
	public class SystemUtils {
		
		/**
		 * Returns <code>true</code> if the underlying operating system is any
		 * variant of the Microsoft Windows operating system, <code>false</code>
		 * otherwise.
		 * 
		 * @return <code>true</code> if the underlying platform is Microsoft Windows,
		 * <code>false</code> otherwise.
		 */  
		public static function isWindows():Boolean {
			if(StringUtils.containsIgnoreCase(Capabilities.os, 'windows')) {
				return true;
			}
			
			return false;
		}
		
		/**
		 * Returns <code>true</code> if the underlying operating system is any
		 * variant of the Apple Macintosh operating system, <code>false</code>
		 * otherwise.
		 * 
		 * @return <code>true</code> if the underlying platform is Apple Macintosh,
		 * <code>false</code> otherwise.
		 */
		public static function isMac():Boolean {
			if(StringUtils.containsIgnoreCase(Capabilities.os, 'mac os')) {
				return true;
			}
			
			return false;
		}
		
		/**
		 * Returns <code>true</code> if the underlying operating system is any
		 * variant of the Linux operating system, <code>false</code> otherwise.
		 * 
		 * @return <code>true</code> if the underlying platform is Linux,
		 * <code>false</code> otherwise.
		 */
		public static function isLinux():Boolean {
			if(StringUtils.containsIgnoreCase(Capabilities.os, 'linux')) {
				return true;
			}
			
			return false;
		}
		
		/**
		 * Returns <code>true</code> if the underlying operating system is 
		 * Microsoft Windows XP operating system, <code>false</code>
		 * otherwise.
		 * 
		 * @return <code>true</code> if the underlying platform is Microsoft Windows XP,
		 * <code>false</code> otherwise.
		 */
		public static function isWindowsXP():Boolean {
			if(StringUtils.containsIgnoreCase(Capabilities.os, 'windows xp')) {
				return true;
			}
			
			return false;
		}
		
		/**
		 * Returns <code>true</code> if the underlying operating system is 
		 * Microsoft Windows 7 operating system, <code>false</code>
		 * otherwise.
		 * 
		 * @return <code>true</code> if the underlying platform is Microsoft Windows 7,
		 * <code>false</code> otherwise.
		 */
		public static function isWindows7():Boolean {
			if(StringUtils.containsIgnoreCase(Capabilities.os, 'windows 7')) {
				return true;
			}
			
			return false;
		}
		
		/**
		 * Returns <code>true</code> if the underlying operating system is 
		 * Microsoft Windows Vista operating system, <code>false</code>
		 * otherwise.
		 * 
		 * @return <code>true</code> if the underlying platform is Microsoft Windows Vista,
		 * <code>false</code> otherwise.
		 */
		public static function isWindowsVista():Boolean {
			if(StringUtils.containsIgnoreCase(Capabilities.os, 'windows vista')) {
				return true;
			}
			
			return false;
		}
		
		/**
		 * Returns <code>true</code> if the underlying operating system is 
		 * Apple Macintosh Tiger (10.4) operating system, <code>false</code>
		 * otherwise.
		 * 
		 * @return <code>true</code> if the underlying platform is Apple Macintosh Tiger 10.4,
		 * <code>false</code> otherwise.
		 */
		public static function isMacTiger():Boolean {
			var os:String = Capabilities.os;
			if(StringUtils.containsIgnoreCase(os, 'mac os') && os.indexOf('10.4') != -1) {
				return true;
			}
			
			return false;
		}
		
		/**
		 * Returns <code>true</code> if the underlying operating system is 
		 * Apple Macintosh Leopard (10.5) operating system, <code>false</code>
		 * otherwise.
		 * 
		 * @return <code>true</code> if the underlying platform is Apple Macintosh Tiger 10.5,
		 * <code>false</code> otherwise.
		 */
		public static function isMacLeopard():Boolean {
			var os:String = Capabilities.os;
			if(StringUtils.containsIgnoreCase(os, 'mac os') && os.indexOf('10.5') != -1) {
				return true;
			}
			
			return false;
		}
		
		/**
		 * Returns <code>true</code> if the underlying operating system is 
		 * Apple Macintosh Snow Leopard (10.6) operating system, <code>false</code>
		 * otherwise.
		 * 
		 * @return <code>true</code> if the underlying platform is Apple Macintosh Tiger 10.6,
		 * <code>false</code> otherwise.
		 */
		public static function isMacSnowLeopard():Boolean {
			var os:String = Capabilities.os;
			if(StringUtils.containsIgnoreCase(os, 'mac os') && os.indexOf('10.6') != -1) {
				return true;
			}
			
			return false;
		}
		
		/**
		 * Returns <code>true</code> if the underlying operating system is 
		 * Apple Macintosh Lion (10.7) operating system, <code>false</code>
		 * otherwise.
		 * 
		 * @return <code>true</code> if the underlying platform is Apple Macintosh Lion 10.7,
		 * <code>false</code> otherwise.
		 */
		public static function isMacLion():Boolean {
			var os:String = Capabilities.os;
			if(StringUtils.containsIgnoreCase(os, 'mac os') && os.indexOf('10.7') != -1) {
				return true;
			}
			
			return false;
		}
		
		/**
		 * Returns <code>true</code> if the underlying player is a <b>Desktop</b> version
		 * essentially indicating that we are running on AIR.
		 * 
		 * @return <code>true</code> if the machine running is Desktop grade.
		 */
		public static function isDesktop():Boolean {
			var pt:String = Capabilities.playerType;
			if(pt == "Desktop") {
				return true;
			}
			
			return false;
		}
		
		/**
		 * Returns <code>true</code> if the underlying operating systems is a
		 * Debian based linux version, <code>false</code> otherwise.
		 * 
		 * @return <code>true</code> if the underlying operating system is
		 * <b>Debian Linux</b>, <code>false</code> otherwise.
		 */ 
		public static function isLinuxDebian():Boolean {
			if(isLinux()) {
				if ((new File("/usr/bin/dpkg")).exists) {
					return true;
				}
			}
			
			return false;
		}
		
		/**
		 * Returns <code>true</code> if the underlying operating system is a
		 * RedHat (RPM) linux version, <code>false</code> otherwise.
		 * 
		 * @return <code>true</code> if the underlying operating system is
		 * <b>RedHat Linux</b>, <code>false</code> otherwise.
		 */ 
		public static function isLinuxRedHat():Boolean {
			if(isLinux()) {
				if (!((new File("/usr/bin/dpkg")).exists)) {
					return true;
				}
			}
			
			return false;
		}
	}
}
