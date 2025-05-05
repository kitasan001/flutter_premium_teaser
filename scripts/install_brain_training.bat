@echo off
echo Android Brain Training Install Script
echo --------------------------------------

adb devices

echo Please make sure your device is listed above.

pause

adb install --bypass-low-target-sdk-block -t "C:\Users\brain-training\android-brain-training-v1.4.2.apk"

echo.
echo If you see "Success" above, installation is complete!
pause
