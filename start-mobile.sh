#!/bin/bash

# Literacy Game Mobile - Start Script

echo "🚀 Starting Literacy Game Mobile App..."
echo ""

# Check if backend is running
echo "📡 Checking backend server..."
if ! curl -s http://10.2.143.103:5000 > /dev/null 2>&1; then
    echo "❌ Backend not running!"
    echo "⚠️  Please start backend first:"
    echo "   cd /home/raviteja/Documents/dass_game/backend && node server.js"
    echo ""
    read -p "Start backend now? (y/n) " -n 1 -r
    echo ""
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        gnome-terminal -- bash -c "cd /home/raviteja/Documents/dass_game/backend && node server.js; exec bash"
        sleep 3
    else
        exit 1
    fi
fi

echo "✅ Backend is running"
echo ""
echo "📱 Starting React Native development server..."
echo ""
echo "Next steps:"
echo "1. Install 'Expo Go' app from Play Store on your phone"
echo "2. Connect phone to same WiFi as this computer"
echo "3. Scan the QR code that appears below"
echo "4. App will load on your phone!"
echo ""
echo "Your computer IP: 10.2.143.103"
echo "Backend running at: http://10.2.143.103:5000"
echo ""
echo "Press Ctrl+C to stop"
echo ""

cd /home/raviteja/Documents/dass_game/mobile
npm start
