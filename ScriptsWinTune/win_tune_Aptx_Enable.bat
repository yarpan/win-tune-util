
REM for Enabling Aptx on Windows 11 lets disable AAC
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BthA2dp\Parameters" /v "BluetoothAacEnable" /d "00000000" /t REG_DWORD /f
