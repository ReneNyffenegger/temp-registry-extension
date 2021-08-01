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

if ($true) {

   $null = new-item -path $regFileExts
   $null = new-item -path $regFileExts\OpenWithProgids
   set-itemProperty -path $regFileExts\OpenWithProgids -name $ftype -value ([byte[]] @()) # -type none

#  $null = new-item -path $regFileExts\OpenWithList
#  set-itemProperty -path $regFileExts\OpenWithList  -name a       -value "`"$exe`" `"%1`""

#
#  set-itemProperty -path $regFileExts\OpenWithList  -name a       -value "`"$exe`" `"%1`""
#  set-itemProperty -path $regFileExts\OpenWithList  -name MRUList -value a
#
# q 
#          set-item       $regFileExts $ftype
# q 
# q # set-itemProperty -path $regFileExts\OpenWithProgids -name $ftype -value ([byte[]] @()) # -type none


}
else {

  $null = new-item -path    $regClassFileExt
          set-item          $regClassFileExt $ftype
}

# - - - - 


  $null = new-item -path "$regFtype"
  $null = new-item -path "$regFtype\shell"
  $null = new-item -path "$regFtype\shell\Open"
  $null = new-item -path "$regFtype\shell\Open\Command"

  $null = set-item -path "$regFtype\shell\Open\Command" -value "`"$exe`" `"%L`" %*"

# echo                                                                                          "`"$exe`" `"%1`""
# $null = set-item -path "HKUS:\$userSid\Software\Classes\PerlScript\shell\Open\Command" -value "`"$exe`" `"%1`""
# $null = set-item -path "$reg_root_user\$userSid\Software\Classes\$ftype\shell\Open\Command" -value "`"$exe`" `"%1`""

return

#
#   ------------ Remove keys ---------------
#


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
  removeRegistryKey "$reg_root_user\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\$ext\UserChoice"
  removeRegistryKey "$reg_root_user\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\$ext" 

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

  echo "now start ms-settings:defaultapps"
