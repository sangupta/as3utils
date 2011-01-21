package org.myjerry.as3utils.filefilter
{
	import flash.filesystem.File;
	
	public class ExtensionFileFilter implements IFileFilter {
		
		private var extension:String = null;
		
		public function ExtensionFileFilter(extension:String) {
			super();
			
			this.extension = extension;
		}
		
		public function accept(file:File):Boolean {
			var ex:String = file.extension;
			if(this.extension == ex) {
				return true;
			}
			
			return false;
		}
	}
}