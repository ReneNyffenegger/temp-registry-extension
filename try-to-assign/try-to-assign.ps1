$null = new-psDrive -name HKUS -psProvider registry -root HKEY_USERS

# $ext   = '.pl'
# $ftype = 'PerlScript'
# $exe   = 'C:\Users\Rene\StrawberryPerl\perl\bin\perl.exe'

  $ext   = '.png'
  $ftype = 'tq84-png'
  $exe   = 'C:\Program Files\IrfanView\i_view64.exe'

$userSid = 'S-1-5-21-1986187950-1154198019-2155599821-1001'

# $reg_root_user="HKUS:\$userSid" # used if no admin access possible
  $reg_root_user="HKCU:"          # used othersiwe no admin access possible

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

# removeRegistryKey "HKUS:\$userSid\Software\Classes\$ext"
  removeRegistryKey "$reg_root_user\$userSid\Software\Classes\$ext"



# removeRegistryKey "HKUS:\$userSid\Software\Classes\$ftype" 
  removeRegistryKey "$reg_root_user\$userSid\Software\Classes\$ftype" 

# if (test-path "HKLM:\Software\Classes\$ftype") {
#   remove-item -recurse -force "HKLM:\Software\Classes\$ftype"
# }
 

# removeRegistryKey "HKUS:\$userSid\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\$ext" 
  removeRegistryKey "$reg_root_user\$userSid\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\$ext" 


  removeRegistryKey "$reg_root_user\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\$ext\UserChoice"
# remove-itemProperty "$reg_root_user\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\$ext\UserChoice" "ProgId"0

# if (test-path "HKUS:\$userSid\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\$ext") {
#   remove-item -recurse -force "HKUS:\$userSid\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\$ext"
# }


#
#   ------------ Create keys ----------------
#

# new-item -path "HKUS:\$userSid\Software\Classes\$ext"
# $null = new-item -path "HKUS:\$userSid\Software\Classes\$ext" -value $ftype
  $null = new-item -path "$reg_root_user\$userSid\Software\Classes\$ext" -value $ftype

# $null = new-item -path "HKUS:\$userSid\Software\Classes\$ftype"
# $null = new-item -path "HKUS:\$userSid\Software\Classes\$ftype\shell"
# $null = new-item -path "HKUS:\$userSid\Software\Classes\$ftype\shell\Open"
# $null = new-item -path "HKUS:\$userSid\Software\Classes\$ftype\shell\Open\Command"
  $null = new-item -path "$reg_root_user\$userSid\Software\Classes\$ftype"
  $null = new-item -path "$reg_root_user\$userSid\Software\Classes\$ftype\shell"
  $null = new-item -path "$reg_root_user\$userSid\Software\Classes\$ftype\shell\Open"
  $null = new-item -path "$reg_root_user\$userSid\Software\Classes\$ftype\shell\Open\Command"

# echo                                                                                          "`"$exe`" `"%1`""
# $null = set-item -path "HKUS:\$userSid\Software\Classes\PerlScript\shell\Open\Command" -value "`"$exe`" `"%1`""
  $null = set-item -path "$reg_root_user\$userSid\Software\Classes\$ftype\shell\Open\Command" -value "`"$exe`" `"%1`""
