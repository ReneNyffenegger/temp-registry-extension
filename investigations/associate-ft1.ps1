set-strictMode -version 3

function removeRegistryKey($key) {
   if (test-path $key) {
      write-host "Removing $key"
      $null = remove-item -recurse -force $key
   }
}

$ext   = '.ft1'
$ftype = 'FtOne.File'
$exe   = "$psScriptRoot\prog-1.exe"

write-host "exe = $exe"

$regFileExts         = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\$ext"
$regClassFileExt     = "hkcu:\Software\Classes\$ext"
$regFtype            = "hkcu:\Software\Classes\$ftype"


removeRegistryKey $regFileExts
removeRegistryKey $regClassFileExt
removeRegistryKey $regFtype

if ($true) {   ##### Change here!

   $null = new-item -path $regFileExts
   $null = new-item -path $regFileExts\OpenWithProgids
   set-itemProperty -path $regFileExts\OpenWithProgids -name $ftype -value ([byte[]] @()) # -type none

}
else {

  $null = new-item -path    $regClassFileExt
          set-item          $regClassFileExt $ftype
}

# --------------- Part II define executable to be run


  $null = new-item -path "$regFtype"
  $null = new-item -path "$regFtype\shell"
  $null = new-item -path "$regFtype\shell\Open"
  $null = new-item -path "$regFtype\shell\Open\Command"

  $null = set-item -path "$regFtype\shell\Open\Command" -value "`"$exe`" `"%L`" %*"

return
