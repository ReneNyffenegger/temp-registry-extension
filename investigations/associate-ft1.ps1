set-strictMode -version 3

function removeRegistryKey($key) {
   if (test-path $key) {
      write-host "Removing $key"
      $null = remove-item -recurse -force $key
   }
}

$ext   = '.ft1'

$ftype = 'filetype-one'

$exe   = "$psScriptRoot\prog-1.exe"

write-host "exe = $exe"


$regKey = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\$ext"

removeRegistryKey $regKey

$null = new-item -path $regKey
# $null = new-item -path $regKey\OpenWithList
# $null = new-item -path $regKey\OpenWithProgids

set-itemProperty -path $regKey\OpenWithProgids -name $ftype -value ([byte[]] @()) # -type none
