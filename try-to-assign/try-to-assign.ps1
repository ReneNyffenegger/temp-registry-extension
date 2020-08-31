$null = new-psDrive -name HKUS -psProvider registry -root HKEY_USERS

$ext   = '.pl'
$ftype = 'PerlScript'
$exe   = 'C:\Users\Rene\StrawberryPerl\perl\bin\perl.exe'

$userSid = 'S-1-5-21-1986187950-1154198019-2155599821-1001'

#
#   ------------ Remove keys ---------------
#

function removeRegistryKey($key) {

  if (test-path $key) {
     write-host "Removing $key"
     $null = remove-item -recurse -force $key
  }

}

removeRegistryKey "HKLM:\Software\Classes\$ext"

# if (test-path ) {
#   remove-item -recurse -force "HKLM:\Software\Classes\$ext"
# }


removeRegistryKey "HKLM:\Software\Classes\$ftype" 

removeRegistryKey "HKUS:\$userSid\Software\Classes\$ext"

# if (test-path ) {
#   remove-item -recurse -force "HKLM:\Software\Classes\$ext"
# }


removeRegistryKey "HKUS:\$userSid\Software\Classes\$ftype" 

# if (test-path "HKLM:\Software\Classes\$ftype") {
#   remove-item -recurse -force "HKLM:\Software\Classes\$ftype"
# }
 

removeRegistryKey "HKUS:\$userSid\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\$ext" 

# if (test-path "HKUS:\$userSid\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\$ext") {
#   remove-item -recurse -force "HKUS:\$userSid\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\$ext"
# }


#
#   ------------ Create keys ----------------
#

# new-item -path "HKUS:\$userSid\Software\Classes\$ext"
$null = new-item -path "HKUS:\$userSid\Software\Classes\$ext" -value $ftype

$null = new-item -path "HKUS:\$userSid\Software\Classes\$ftype"
$null = new-item -path "HKUS:\$userSid\Software\Classes\$ftype\shell"
$null = new-item -path "HKUS:\$userSid\Software\Classes\$ftype\shell\Open"
$null = new-item -path "HKUS:\$userSid\Software\Classes\$ftype\shell\Open\Command"

# echo                                                                                          "`"$exe`" `"%1`""
  $null = set-item -path "HKUS:\$userSid\Software\Classes\PerlScript\shell\Open\Command" -value "`"$exe`" `"%1`""
