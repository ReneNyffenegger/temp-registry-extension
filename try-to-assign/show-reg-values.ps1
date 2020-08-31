$null    =  new-psDrive -name HKUS -psProvider registry -root HKEY_USERS

$ext     = '.pl'
$ftype   = 'PerlScript'
$userSid = 'S-1-5-21-1986187950-1154198019-2155599821-1001'

function showRegValue($key, $valName) {
  if (test-path $key) {
    write-host "$key $value -> $((get-item $key).GetValue($valName))"
  }
  else {
    write-host "$key does not exist"
  }
}

showRegValue "HKUS:\$userSid\Software\Classes\$ext"                      ""
showRegValue "HKUS:\$userSid\Software\Classes\$ftype\shell\open\Command" ""

showRegValue "hklm:\Software\Classes\$ext"                      ""
showRegValue "hklm:\Software\Classes\$ftype\shell\open\Command" ""

showRegValue "HKUS:\$userSid\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.pl\UserChoice" "ProgId"
