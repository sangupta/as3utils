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
	
	/**
	 * Utiltiy functions around the <code>Date</code> objects.
	 * 
	 * @author sangupta
	 * @since 1.0
	 */
	public class DateUtils {
		
		/**
		 * <code>DateUtils</code> instances should NOT be constructed in standard programming.
		 */
		public function DateUtils() {
			super();
		}
		
		/**
		 * Constant value that defines the milliseconds in 24-hours of a day.
		 */
		private static const MS_IN_ONE_DAY:Number = (24 * 60 * 60 * 1000);
		
		/**
		 * Compute the difference between the two given dates in milliseconds.
		 * 
		 * @param dateBefore the date that occurs earlier in time
		 * 
		 * @param dateAhead the date that occurs later in time
		 * 
		 * @return the difference between two dates in milliseconds as a <code>Number</code>.
		 */
		public static function diffDateInTime(dateBefore:Date, dateAhead:Date):Number {
			var timeAhead:Number = 0;
			var timeBefore:Number = 0;
			
			if(dateAhead != null) {
				timeAhead = dateAhead.time;
			}
			if(dateBefore != null) {
				timeBefore = dateBefore.time;
			}
			
			return (timeAhead - timeBefore);
		}

		/**
		 * Compute the difference between the two given dates in number of days.
		 * 
		 * @param dateBefore the date that occurs earlier in time
		 * 
		 * @param dateAhead the date that occurs later in time
		 * 
		 * @return the difference between two dates in number of days as a <code>Number</code>.
		 */
		public static function diffDateInDays(dateBefore:Date, dateAhead:Date):Number {
			return diffDateInTime(dateBefore, dateAhead) / MS_IN_ONE_DAY;
		}
		
		/**
		 * Test of the given year is a leap year or not.
		 * 
		 * @param year the year as complete 4-digits
		 * 
		 * @return Returns <code>true</code> if the given year was a leap year, <code>false</code> otherwise.
		 */
		public static function isLeapYear(year:uint):Boolean {
			if(year % 400 == 0) {
				return true;
			} else if(year % 100 == 0) {
				return false;
			} else if(year % 4 == 0) {
				return true;
			}
			
			return false;
		}
		
		/**
		 * Test if the given date is a leap year or not.
		 * 
		 * @param date the <code>non-null</code> date to be tested
		 * 
		 * @return Returns <code>true</code> if the given date was a leap year, <code>false</code> otherwise.
		 */
		public static function isLeap(date:Date):Boolean {
			if(date == null) {
				throw new ArgumentError('Date cannot be null.');
			}
			
			return isLeapYear(date.fullYear);
		}
	}
}
