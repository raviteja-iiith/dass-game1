# Quick Start Guide

## First Time Setup (5 minutes)

### 1. Install Backend Dependencies
```bash
cd /home/raviteja/Documents/dass_game/backend
npm install
```

### 2. Install Frontend Dependencies
```bash
cd /home/raviteja/Documents/dass_game/frontend
npm install
```

### 3. Start MongoDB
```bash
# Check if MongoDB is running
sudo systemctl status mongod

# If not running, start it
sudo systemctl start mongod
```

### 4. Seed Database (First time only)
```bash
cd /home/raviteja/Documents/dass_game/backend
node seeds/seedQuizzes.js
```

### 5. Start Backend Server
```bash
# Terminal 1 - Backend
cd /home/raviteja/Documents/dass_game/backend
npm start
```

### 6. Start Frontend Application
```bash
# Terminal 2 - Frontend
cd /home/raviteja/Documents/dass_game/frontend
npm start
```

## Quick Commands

### Run Backend
```bash
cd ~/Documents/dass_game/backend && npm start
```

### Run Frontend
```bash
cd ~/Documents/dass_game/frontend && npm start
```

### Reseed Database
```bash
cd ~/Documents/dass_game/backend && node seeds/seedQuizzes.js
```

### View MongoDB Data
```bash
mongosh
use literacy_game
db.quizzes.find().pretty()
db.users.find().pretty()
db.progress.find().pretty()
db.scores.find().pretty()
```

## URLs

- **Frontend**: http://localhost:3000
- **Backend API**: http://localhost:5000
- **Test API**: http://localhost:5000/api/test
- **Hindi Audio**: http://localhost:5000/audio/hindi/hi_अ.mp3
- **Telugu Audio**: http://localhost:5000/audio/telugu/te_అ.mp3

## Testing the Application

1. Open http://localhost:3000
2. Select Hindi or Telugu
3. Enter a name and age (3-8)
4. Click on Planet 1 (Level 1)
5. Play the audio and answer questions
6. Complete the quiz to see results
7. Score ≥ 3 will unlock the next level

## Common Issues

**MongoDB not starting?**
```bash
sudo systemctl enable mongod
sudo systemctl start mongod
```

**Port 3000 or 5000 in use?**
```bash
# Kill process on port
sudo lsof -i :3000
sudo kill -9 <PID>
```

**Backend can't find audio files?**
- Make sure hindi/ and telugu/ folders are in the project root
- Check that .mp3 files exist in those folders

**CORS errors?**
- Backend server must be running
- Check that backend uses cors middleware (already configured)

Enjoy teaching children! 🚀📚
