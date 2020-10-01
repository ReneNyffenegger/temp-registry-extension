$null    =  new-psDrive -name HKUS -psProvider registry -root HKEY_USERS

# $ext     = '.pl'
# $ftype   = '.pl_auto_file'
# $ftype   = 'PerlScript'

# $ext     = '.jpg'
# $ftype   = 'IrfanView.jpg'
#
  $ext     = '.png'
# $ftype   = 'IrfanView.jpg'

$userSid = 'S-1-5-21-1986187950-1154198019-2155599821-1001'
# $reg_root_user="HKUS:\$userSid" # used if no admin access possible
  $reg_root_user="HKCU:"          # used othersiwe no admin access possible

function showRegValue($key, $valName) {
  if (test-path $key) {
    write-host "$key $value -> $((get-item $key).GetValue($valName))"
  }
  else {
    write-host "$key does not exist"
  }
}

$ftyle = get-childItem "$reg_root_user\Software\Classes\$ext"

# showRegValue "HKUS:\$userSid\Software\Classes\$ext"                      ""
# showRegValue "HKUS:\$userSid\Software\Classes\$ftype\shell\open\Command" ""
showRegValue "$reg_root_user\Software\Classes\$ext"                      ""
showRegValue "$reg_root_user\Software\Classes\$ftype\shell\open\Command" ""

showRegValue "hklm:\Software\Classes\$ext"                      ""
showRegValue "hklm:\Software\Classes\$ftype\shell\open\Command" ""

# showRegValue "HKUS:\$userSid\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\$ext\UserChoice" "ProgId"
# showRegValue "HKUS:\$userSid\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\$ext\UserChoice" "ProgId"
