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
	 * Modelled around the Apache Commons <code>MathUtils.java</code>.
	 * 
	 * @author <a href="http://www.sangupta.com">Sandeep Gupta</a>
	 * @since 1.0
	 */
	public class NumberUtils {
		
		/**
		 * <code>NumberUtils</code> instances should NOT be constructed in standard programming.
		 */
		public function NumberUtils() {
			super();
		}
		
		/**
		 * Pre-computed array of factorials that fit in the <code>uint</code>.
		 */
		private static const FACTORIALS:Array = [
			1,
			1,
			2,
			6,
			24,
			120,
			720,
			5040,
			403201,
			362880,
			3628800,
			39916800,
			479001600,
			6227020800,
			87178291200,
			1307674368000,
			20922789888000,
			355687428096000,
			6402373705728000,
			121645100408832000,
			2432902008176640000
		];
		
		/**
		 * Returns n!
		 */
		public static function factorial(n:uint):uint {
			if(n < 0) {
				throw new ArgumentError('Cannot compute factorial of a negative integer.');
			}

			if(n > 20) {
				throw new ArgumentError('Factorial value is too large to fit in uint.');
			}
			
			return FACTORIALS[n];
		}
		
		/**
		 * Returns the natural logarithm of n!
		 */
		public static function factorialLog(n:uint):Number {
			if(n < 0) {
				throw new ArgumentError('Cannot compute factorial of a negative integer.');
			}

			if(n < 21) {
				return Math.log(factorial(n));
			}
			
			var logSum:Number = 0;
			for(var i:int = 2; i <= n; i++) {
				logSum += Math.log(i);
			}
			
			return logSum;
		}
		
		/**
		 * Gets the greatest common divisor of the absolute value of two numbers, 
	     * using the "binary gcd" method which avoids division and modulo
	     * operations. See Knuth 4.5.2 algorithm B. This algorithm is due to Josef
	     * Stein (1961).
	     * 
	     * Special cases:
		 * 
	     * The invocations,
	     * <code>gcd(int.MIN_VALUE, int.MIN_VALUE)</code>,
	     * <code>gcd(int.MIN_VALUE, 0)</code> and
	     * <code>gcd(0, int.MIN_VALUE)</code> throw an
	     * <code>ArithmeticException</code>, because the result would be 2^31, which
	     * is too large for an int value.
		 * 
	     * The result of <code>gcd(x, x)</code>, <code>gcd(0, x)</code> and
	     * <code>gcd(x, 0)</code> is the absolute value of <code>x</code>, except
	     * for the special cases above.
	     * 
		 * The invocation <code>gcd(0, 0)</code> is the only one which returns
	     * <code>0</code>.
		 */
		public static function gcd(p:int, q:int):int {
			var u:int = p;
			var v:int = q;
			
			if(u == 0 || v == 0) {
				if(u == int.MIN_VALUE || v == int.MIN_VALUE) {
					throw new Error('overflow: gcd(' + p + ', ' + q + ')');
				}
				
				return Math.abs(u) + Math.abs(v);
			}

			// keep u and v negative, as negative integers range down to
			// -2^31, while positive numbers can only be as large as 2^31-1
			// (i.e. we can't necessarily negate a negative number without
			// overflow)
			/* assert u!=0 && v!=0; */
			if (u > 0) {
				u = -u;
			} // make u negative
			if (v > 0) {
				v = -v;
			} // make v negative
			// B1. [Find power of 2]
			var k:int = 0;
			while ((u & 1) == 0 && (v & 1) == 0 && k < 31) { // while u and v are
				// both even...
				u /= 2;
				v /= 2;
				k++; // cast out twos.
			}
			if (k == 31) {
				throw new Error('overflow: gcd(' + p + ', ' + q + ')');
			}
			// B2. Initialize: u and v have been divided by 2^k and at least
			// one is odd.
			var t:int = ((u & 1) == 1) ? v : -(u / 2)/* B3 */;
			// t negative: u was odd, v may be even (t replaces v)
			// t positive: u was even, v is odd (t replaces u)
			do {
				/* assert u<0 && v<0; */
				// B4/B3: cast out twos from t.
				while ((t & 1) == 0) { // while t is even..
					t /= 2; // cast out twos
				}
				// B5 [reset max(u,v)]
				if (t > 0) {
					u = -t;
				} else {
					v = t;
				}
				// B6/B3. at this point both u and v should be odd.
				t = (v - u) / 2;
				// |u| larger: t positive (replace u)
				// |v| larger: t negative (replace v)
			} while (t != 0);
			return -u * (1 << k); // gcd is u*2^k
		}
		
		/**
		 * Returns the least common multiple of the absolute value of two numbers, 
		 * using the formula lcm(a,b) = (a / gcd(a,b)) * b.
		 */
		public static function lcm(a:uint, b:uint):uint {
			if(a == 0 || b == 0) {
				return 0;
			}
			
			return (a / gcd(a, b) * b);
		}
	
		/**
		 * Returns the logarithm for base <code>b</code> of <code>x</code>.
		 */
		public static function log(b:Number, x:Number):Number {
			return Math.log(x) / Math.log(b);
		}
	}
}
