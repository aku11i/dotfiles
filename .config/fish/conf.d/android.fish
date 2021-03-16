# Android
if test (uname) = "Darwin"
  if test -d $HOME/Library/Android/sdk
    set -x ANDROID_HOME $HOME/Library/Android/sdk
    fish_add_path $ANDROID_HOME/tools/bin $ANDROID_HOME/platform-tools
  end
else if test (uname) = "Linux"
  if test -d $HOME/tools/android-sdk
    set -x ANDROID_HOME $HOME/tools/android-sdk
    fish_add_path $ANDROID_HOME/tools/bin $ANDROID_HOME/platform-tools
  end
end
