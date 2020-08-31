$ext   = '.pl'
$ftype = 'PerlScript'

function showRegValue($key, $valName) {

  if (test-path $key) {
    write-host "$key $value -> $((get-item $key).GetValue($valName))"
  }
  else {
    write-host "$key does not exist"
  }

}

showRegValue "hkcu:\Software\Classes\$ext"                      ""
showRegValue "hkcu:\Software\Classes\$ftype\shell\open\Command" ""

showRegValue "hklm:\Software\Classes\$ext"                      ""
showRegValue "hklm:\Software\Classes\$ftype\shell\open\Command" ""

showRegValue "hkcu:\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.pl\UserChoice" "ProgId"
