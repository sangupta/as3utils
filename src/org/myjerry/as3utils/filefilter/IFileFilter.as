package org.myjerry.as3utils.filefilter
{
	import flash.filesystem.File;

	public interface IFileFilter
	{
		function accept(file:File):Boolean;
	}
}