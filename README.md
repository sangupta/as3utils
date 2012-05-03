as3utils
--------

Utility classes for ActionScript based projects including Flex projects. Some of the utility classes are specific to AIR applications and require Adobe AIR libraries to run. Such classes provide the isSupported method as a guide. 

Library Details
---------------

The library consists of the following utility classes

- ArrayUtils: Operations on working with arrays, like contains, removeItem etc.
- AssertUtils: Operations on strings/arrays/lists/collections to see if they are null, empty etc
- BooleanUtils: Operations on converting `Boolean` to `String` and vice-versa
- DateUtils: Operations like checking for leap year, compute difference in two dates
- FileUtils: Operations on files/directories like read, write, copy, delete etc
- IOUtils: Operations on streams to read, write and close
- NumberUtils: Commons operations like factorial, gcd, factorialLog, log etc.
- StringUtils: Operations on `String` like left/right padding, abbreviations, trim, starts/ends with etc.
- SystemUtils: Utility checks on operating systems and their specific versions
- WebUtils: Function to extract header value from a given set of response headers
- XMLUtils: Operations around reading files to XML

In addition a special class called `ExtendedEncryptedLocalStore` is provided. This class helps to get/put basic ActionScript data types like `int`, `uint`, `String`, `Number` etc.

Versioning
----------

For transparency and insight into our release cycle, and for striving to maintain backward compatibility, as3utils will be maintained under the Semantic Versioning guidelines as much as possible.

Releases will be numbered with the follow format:

`<major>.<minor>.<patch>`

And constructed with the following guidelines:

* Breaking backward compatibility bumps the major
* New additions without breaking backward compatibility bumps the minor
* Bug fixes and misc changes bump the patch

For more information on SemVer, please visit http://semver.org/.

License
-------

Copyright 2011-2012, Sandeep Gupta

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this work except in compliance with the License. You may obtain a copy of the License in the LICENSE file, or at:

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
