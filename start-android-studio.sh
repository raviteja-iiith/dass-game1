#!/bin/bash

# Android Studio Emulator Setup & Run Script

echo "🤖 Running Literacy Game in Android Studio Emulator"
echo ""

# Check if Android Studio / SDK is installed
if ! command -v adb &> /dev/null; then
    echo "❌ Android SDK not found!"
    echo ""
    echo "📥 Please install Android Studio first:"
    echo "   1. Download from: https://developer.android.com/studio"
    echo "   2. Install Android Studio"
    echo "   3. Open Android Studio → Tools → SDK Manager"
    echo "   4. Install Android SDK, SDK Platform-Tools"
    echo "   5. Create an AVD (Virtual Device) in AVD Manager"
    echo ""
    echo "After installation, add to your ~/.bashrc:"
    echo "   export ANDROID_HOME=\$HOME/Android/Sdk"
    echo "   export PATH=\$PATH:\$ANDROID_HOME/emulator"
    echo "   export PATH=\$PATH:\$ANDROID_HOME/platform-tools"
    echo ""
    exit 1
fi

echo "✅ Android SDK found"
echo ""

# Check for running emulators
echo "📱 Checking for running emulators..."
EMULATOR_RUNNING=$(adb devices | grep emulator | wc -l)

if [ $EMULATOR_RUNNING -eq 0 ]; then
    echo "❌ No emulator running"
    echo ""
    echo "🚀 Starting Android emulator..."
    echo ""
    
    # List available AVDs
    echo "Available emulators:"
    $ANDROID_HOME/emulator/emulator -list-avds
    echo ""
    
    # Get first AVD
    FIRST_AVD=$($ANDROID_HOME/emulator/emulator -list-avds | head -n 1)
    
    if [ -z "$FIRST_AVD" ]; then
        echo "❌ No AVD found!"
        echo "Please create a virtual device in Android Studio:"
        echo "   Android Studio → Tools → Device Manager → Create Device"
        exit 1
    fi
    
    echo "Starting emulator: $FIRST_AVD"
    nohup $ANDROID_HOME/emulator/emulator -avd "$FIRST_AVD" > /dev/null 2>&1 &
    
    echo "⏳ Waiting for emulator to boot (this may take 30-60 seconds)..."
    adb wait-for-device
    sleep 10
    echo "✅ Emulator started!"
else
    echo "✅ Emulator already running"
fi

echo ""
echo "📡 Starting backend server..."

# Check if backend is running
if ! curl -s http://localhost:5000 > /dev/null 2>&1; then
    echo "Starting backend..."
    gnome-terminal -- bash -c "cd /home/raviteja/Documents/dass_game/backend && node server.js; exec bash"
    sleep 3
else
    echo "✅ Backend already running"
fi

echo ""
echo "📱 Starting React Native app in Android emulator..."
echo ""
echo "Backend: http://10.2.143.103:5000"
echo "The app will automatically open in the emulator"
echo ""
echo "Press 'a' if it doesn't auto-launch, or Ctrl+C to stop"
echo ""

cd /home/raviteja/Documents/dass_game/mobile

# Auto-open Android
npm start -- --android
