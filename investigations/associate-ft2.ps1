set-strictMode -version 3

function removeRegistryKey($key) {
   if (test-path $key) {
      write-host "Removing $key"
      $null = remove-item -recurse -force $key
   }
}

$ext   = '.ft2'
# $ftype = 'FtTwo.File'
$exe   = "$psScriptRoot\prog-2.exe"

# $regFileExts         = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\$ext"
  $regClassFileExt     = "hkcu:\Software\Classes\$ext"
# $regFtype            = "hkcu:\Software\Classes\$ftype"


# removeRegistryKey $regFileExts
  removeRegistryKey $regClassFileExt
# removeRegistryKey $regFtype


# }
# else {
# 
#   $null = new-item -path    $regClassFileExt
#           set-item          $regClassFileExt $ftype
# }

# --------------- Part II define executable to be run


  $null = new-item -path "$regClassFileExt"
  $null = new-item -path "$regClassFileExt\shell"
  $null = new-item -path "$regClassFileExt\shell\Open"
  $null = new-item -path "$regClassFileExt\shell\Open\Command"

  $null = set-item -path "$regClassFileExt\shell\Open\Command" -value "`"$exe`" `"%L`" %*"

return
