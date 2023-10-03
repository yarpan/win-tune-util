setx -m JAVA_HOME "C:\Program Files\Java\jdk-11"
setx -m JAVA_SDK "C:\Program Files\Java\jdk1-11\bin"
setx -m ADB_HOME "C:\Programs\Android_SDK\platform-tools"
setx -m ANDROID_HOME "C:\Programs\Android_SDK"
setx -m ANDROID_SDK_ROOT "C:\Programs\Android_SDK"
setx -m M2_HOME "C:\Program Files\Maven"
setx -m MAVEN_HOME "C:\Program Files\Maven"
setx -m ALLURE_HOME "C:\Program Files\Allure\allure\bin"

setx /M path "%path%;%JAVA_HOME%;%JAVA_SDK%;%ADB_HOME%;%ANDROID_HOME%;%ANDROID_SDK_ROOT%;%M2_HOME%;%MAVEN_HOME%;%ALLURE_HOME%"

rem Remove the /M flag if you want to set the user PATH instead of the system PATH.