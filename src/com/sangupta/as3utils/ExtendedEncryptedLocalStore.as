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
	
	import flash.data.EncryptedLocalStore;
	import flash.utils.ByteArray;

	/**
	 * An extension of the original <code>EncryptedLocalStore</code> class to provide for convenience
	 * methods to work with various basic data types like String, Int, Float, Double, etc
	 * to remove boiler plate code.
	 * 
	 * @author <a href="http://www.sangupta.com">Sandeep Gupta</a>
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
		
		/**
		 * [Read Only] The isSupported property is set to <code>true</code> 
		 * if the <code>EncryptedLocalStore</code> class is supported on the 
		 * current platform, otherwise it is set to <code>false</code>.
		 * (Copied verbatim from <code>EncryptedLocalStore.setItem</code>)
		 */
		public static function get isSupported():Boolean {
			return EncryptedLocalStore.isSupported;
		}
		
		/**
		 * The data corresponding to the specified name. If an item does not exist 
		 * by the specified name, this method returns <code>null</code>.
		 * (Copied verbatim from <code>EncryptedLocalStore.setItem</code>)
		 * 
		 * @param name The name of the item in the encrypted local store.
		 * 
		 * @return The ByteArray data. If there is no data for the provided name, the method returns <code>null</code>.
		 * 
		 * @throws ArgumentError The name value is null or an empty string.
		 */
		public static function getItem(name:String):ByteArray {
			return EncryptedLocalStore.getItem(name);
		}
		
		/**
		 * Stores a ByteArray object under the specified name. 
		 * (Copied verbatim from <code>EncryptedLocalStore.setItem</code>)
		 * 
		 * @param name The name of the item in the encrypted local store 
		 * 
		 * @param data The data.
		 * 
		 * @param stronglyBound (deprecated) The <code>stronglyBound</code> parameter should be set to 
		 * <code>false</code> (the default value). If set to <code>true</code>, the stored item cannot be 
		 * retrieved if any application files are altered. For example,if a user installs an update of your 
		 * application, the updated application cannot read any strongly bound data that was previously 
		 * written to the encrypted local store.
		 * 
		 * @throws ArgumentError The name value is null or an empty string.
		 */
		public static function setItem(name:String, data:ByteArray, stronglyBound:Boolean = false):void {
			EncryptedLocalStore.setItem(name, data, stronglyBound);
		}
		
		/**
		 * Removes the item with the given name from the encrypted local store.
		 * (Copied verbatim from <code>EncryptedLocalStore.setItem</code>)
		 * 
		 * @param name The name of the item in the encrypted local store.
		 * 
		 * @throws ArgumentError The name value is null or an empty string.
		 */
		public static function removeItem(name:String):void {
			EncryptedLocalStore.removeItem(name);
		}
		
		/**
		 * [Inherited] Clears the entire encrypted local store, deleting all data.
		 * (Copied verbatim from <code>EncryptedLocalStore.setItem</code>)
		 */
		public static function reset():void {
			EncryptedLocalStore.reset();
		}
		
		// Convenience methods start from here
		
		/**
		 * 
		 * @param stronglyBound (deprecated) The <code>stronglyBound</code> parameter should be set to 
		 * <code>false</code> (the default value). If set to <code>true</code>, the stored item cannot be 
		 * retrieved if any application files are altered. For example,if a user installs an update of your 
		 * application, the updated application cannot read any strongly bound data that was previously 
		 * written to the encrypted local store.
		 */
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
		
		/**
		 * 
		 * @param stronglyBound (deprecated) The <code>stronglyBound</code> parameter should be set to 
		 * <code>false</code> (the default value). If set to <code>true</code>, the stored item cannot be 
		 * retrieved if any application files are altered. For example,if a user installs an update of your 
		 * application, the updated application cannot read any strongly bound data that was previously 
		 * written to the encrypted local store.
		 */
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
		
		/**
		 * 
		 * @param stronglyBound (deprecated) The <code>stronglyBound</code> parameter should be set to 
		 * <code>false</code> (the default value). If set to <code>true</code>, the stored item cannot be 
		 * retrieved if any application files are altered. For example,if a user installs an update of your 
		 * application, the updated application cannot read any strongly bound data that was previously 
		 * written to the encrypted local store.
		 */
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
		
		/**
		 * 
		 * @param stronglyBound (deprecated) The <code>stronglyBound</code> parameter should be set to 
		 * <code>false</code> (the default value). If set to <code>true</code>, the stored item cannot be 
		 * retrieved if any application files are altered. For example,if a user installs an update of your 
		 * application, the updated application cannot read any strongly bound data that was previously 
		 * written to the encrypted local store.
		 */
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
		
		/**
		 * 
		 * @param stronglyBound (deprecated) The <code>stronglyBound</code> parameter should be set to 
		 * <code>false</code> (the default value). If set to <code>true</code>, the stored item cannot be 
		 * retrieved if any application files are altered. For example,if a user installs an update of your 
		 * application, the updated application cannot read any strongly bound data that was previously 
		 * written to the encrypted local store.
		 */
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
		
		/**
		 * 
		 * @param stronglyBound (deprecated) The <code>stronglyBound</code> parameter should be set to 
		 * <code>false</code> (the default value). If set to <code>true</code>, the stored item cannot be 
		 * retrieved if any application files are altered. For example,if a user installs an update of your 
		 * application, the updated application cannot read any strongly bound data that was previously 
		 * written to the encrypted local store.
		 */
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
		
		/**
		 * 
		 * @param stronglyBound (deprecated) The <code>stronglyBound</code> parameter should be set to 
		 * <code>false</code> (the default value). If set to <code>true</code>, the stored item cannot be 
		 * retrieved if any application files are altered. For example,if a user installs an update of your 
		 * application, the updated application cannot read any strongly bound data that was previously 
		 * written to the encrypted local store.
		 */
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
