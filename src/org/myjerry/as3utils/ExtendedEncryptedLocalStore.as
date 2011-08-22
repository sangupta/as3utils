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
	
	import flash.data.EncryptedLocalStore;
	import flash.utils.ByteArray;

	/**
	 * An extension of the original EncryptedLocalStore class to provide for convenience
	 * methods to work with various basic data types like String, Int, Float, Double, etc
	 * to remove boiler plate code.
	 * 
	 * @author Sandeep Gupta
	 * @since 1.0
	 */
	public class ExtendedEncryptedLocalStore extends EncryptedLocalStore {
		
		/**
		 * <code>ExtendedEncryptedLocalStore</code> instances should NOT be constructed in standard programming.
		 */
		public function ExtendedEncryptedLocalStore() {
			super();
		}
		
		// Original methods from the class are listed below
		// this is so because in ActionScript static methods are not inherited
		
		public static function get isSupported():Boolean {
			return EncryptedLocalStore.isSupported;
		}
		
		public static function getItem(name:String):ByteArray {
			return EncryptedLocalStore.getItem(name);
		}
		
		public static function setItem(name:String, data:ByteArray, stronglyBound:Boolean = false):void {
			EncryptedLocalStore.setItem(name, data, stronglyBound);
		}
		
		public static function removeItem(name:String):void {
			EncryptedLocalStore.removeItem(name);
		}
		
		public static function reset():void {
			EncryptedLocalStore.reset();
		}
		
		// Convenience methods start from here
		
		public static function setStringItem(name:String, data:String, stronglyBound:Boolean = false):void {
			var byteArray:ByteArray = new ByteArray();
			byteArray.writeUTFBytes(data);
			EncryptedLocalStore.setItem(name, byteArray, stronglyBound);
		}
		
		public static function getStringItem(name:String):String {
			var byteArray:ByteArray = EncryptedLocalStore.getItem(name);
			if(byteArray == null) {
				return null;
			}
			
			return byteArray.readUTFBytes(byteArray.length);
		}
		
		public static function setUnsignedIntItem(name:String, data:uint, stronglyBound:Boolean = false):void {
			var byteArray:ByteArray = new ByteArray();
			byteArray.writeUnsignedInt(data);
			EncryptedLocalStore.setItem(name, byteArray, stronglyBound);
		}
		
		public static function getUnsignedIntItem(name:String):uint {
			var byteArray:ByteArray = EncryptedLocalStore.getItem(name);
			if(byteArray != null) {
				return byteArray.readUnsignedInt();
			}
			
			return 0;
		}
		
		public static function setBoolean(name:String, data:Boolean, stronglyBound:Boolean = false):void {
			var byteArray:ByteArray = new ByteArray();
			byteArray.writeBoolean(data);
			EncryptedLocalStore.setItem(name, byteArray, stronglyBound);
		}
		
		public static function getBoolean(name:String, defaultValue:Boolean = false):Boolean {
			var byteArray:ByteArray = EncryptedLocalStore.getItem(name);
			if(byteArray == null) {
				return defaultValue;
			}
			
			return byteArray.readBoolean();
		}
		
		public static function setDouble(name:String, data:Number, stronglyBound:Boolean = false):void {
			var byteArray:ByteArray = new ByteArray();
			byteArray.writeDouble(data);
			EncryptedLocalStore.setItem(name, byteArray, stronglyBound);
		}
		
		public static function getDouble(name:String):Number {
			var byteArray:ByteArray = EncryptedLocalStore.getItem(name);
			if(byteArray == null) {
				return Number.NaN;
			}
			
			return byteArray.readDouble();
		}
		
		public static function setFloat(name:String, data:Number, stronglyBound:Boolean = false):void {
			var byteArray:ByteArray = new ByteArray();
			byteArray.writeFloat(data);
			EncryptedLocalStore.setItem(name, byteArray, stronglyBound);
		}
		
		public static function getFloat(name:String):Number {
			var byteArray:ByteArray = EncryptedLocalStore.getItem(name);
			if(byteArray == null) {
				return Number.NaN;
			}
			
			return byteArray.readFloat();
		}
		
		public static function setInt(name:String, data:int, stronglyBound:Boolean = false):void {
			var byteArray:ByteArray = new ByteArray();
			byteArray.writeInt(data);
			EncryptedLocalStore.setItem(name, byteArray, stronglyBound);
		}
		
		public static function getInt(name:String):int {
			var byteArray:ByteArray = EncryptedLocalStore.getItem(name);
			if(byteArray == null) {
				return Number.NaN;
			}
			
			return byteArray.readInt();
		}
		
		public static function setByte(name:String, data:int, stronglyBound:Boolean = false):void {
			var byteArray:ByteArray = new ByteArray();
			byteArray.writeByte(data);
			EncryptedLocalStore.setItem(name, byteArray, stronglyBound);
		}
		
		public static function getByte(name:String):int {
			var byteArray:ByteArray = EncryptedLocalStore.getItem(name);
			if(byteArray == null) {
				return Number.NaN;
			}
			
			return byteArray.readByte();
		}
		
		/**
		 * Writes a 16-bit integer to the byte stream. The low 16 bits of the parameter are used. The high 16 bits are ignored.
		 * 
		 * @param name The name of the item in the encrypted local store.
		 * 
		 * @param data 32-bit integer, whose low 16 bits are written to the <code>EncryptedLocalStore</code>.
		 * 
		 * @param stronglyBound (deprecated) The <code>stronglyBound</code> parameter should be set to 
		 * <code>false</code> (the default value). If set to <code>true</code>, the stored item cannot be 
		 * retrieved if any application files are altered. For example,if a user installs an update of your 
		 * application, the updated application cannot read any strongly bound data that was previously 
		 * written to the encrypted local store.
		 */
		public static function setShort(name:String, data:int, stronglyBound:Boolean = false):void {
			var byteArray:ByteArray = new ByteArray();
			byteArray.writeShort(data);
			EncryptedLocalStore.setItem(name, byteArray, stronglyBound);
		}
		
		/**
		 * Reads a signed 16-bit integer from the <code>EncryptedLocalStore</code>. 
		 * The returned value is in the range -32768 to 32767.
		 * 
		 * @return A 16-bit signed integer between -32768 and 32767.
		 */
		public static function getShort(name:String):int {
			var byteArray:ByteArray = EncryptedLocalStore.getItem(name);
			if(byteArray == null) {
				return Number.NaN;
			}
			
			return byteArray.readShort();
		}
		
	}
}
