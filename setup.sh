#!/bin/bash

echo "🚀 Starting Vernacular Early Literacy Game Setup"
echo "=================================================="
echo ""

# Check if MongoDB is running
echo "📦 Checking MongoDB..."
if ! pgrep -x "mongod" > /dev/null; then
    echo "⚠️  MongoDB is not running. Starting MongoDB..."
    sudo systemctl start mongod
    sleep 3
else
    echo "✅ MongoDB is already running"
fi

# Check if database needs seeding
echo ""
echo "📊 Checking database..."
cd /home/raviteja/Documents/dass_game/backend

# Check if quizzes exist
QUIZ_COUNT=$(mongosh --quiet --eval "db = db.getSiblingDB('literacy_game'); db.quizzes.countDocuments()" 2>/dev/null)

if [ "$QUIZ_COUNT" = "0" ] || [ -z "$QUIZ_COUNT" ]; then
    echo "⚠️  Database is empty. Seeding quizzes..."
    node seeds/seedQuizzes.js
else
    echo "✅ Database already has $QUIZ_COUNT quizzes"
fi

echo ""
echo "=================================================="
echo "🎉 Setup Complete!"
echo ""
echo "To start the application, open TWO terminals:"
echo ""
echo "Terminal 1 (Backend):"
echo "  cd ~/Documents/dass_game/backend && npm start"
echo ""
echo "Terminal 2 (Frontend):"
echo "  cd ~/Documents/dass_game/frontend && npm start"
echo ""
echo "Then open: http://localhost:3000"
echo "=================================================="
