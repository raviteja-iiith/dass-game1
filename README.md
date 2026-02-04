# 🚀 Vernacular Early Literacy Game

An interactive, gamified web application for teaching Hindi and Telugu letters to children (ages 3-8) through a space-themed learning experience.

## 🌟 Features

- **Space Theme**: Planets represent different quiz levels
- **Audio Learning**: Letter pronunciation using audio files
- **Two Languages**: Complete support for Hindi and Telugu
- **Progress Tracking**: User progress saved in MongoDB
- **Gamification**: Score system, level unlocking, star ratings
- **Child-Friendly UI**: Large buttons, colorful design, animations

## 🛠️ Tech Stack

- **Frontend**: React, React Router, Axios
- **Backend**: Node.js, Express
- **Database**: MongoDB
- **Audio**: Pre-generated MP3 files (gtts)

## 📁 Project Structure

```
dass_game/
├── backend/
│   ├── config/
│   │   └── db.js
│   ├── models/
│   │   ├── User.js
│   │   ├── Progress.js
│   │   ├── Quiz.js
│   │   └── Score.js
│   ├── routes/
│   │   ├── users.js
│   │   ├── quizzes.js
│   │   ├── scores.js
│   │   └── progress.js
│   ├── seeds/
│   │   └── seedQuizzes.js
│   ├── server.js
│   ├── package.json
│   └── .env
├── frontend/
│   ├── src/
│   │   ├── components/
│   │   │   ├── Homepage.js
│   │   │   ├── Homepage.css
│   │   │   ├── PlanetSelection.js
│   │   │   ├── PlanetSelection.css
│   │   │   ├── Quiz.js
│   │   │   ├── Quiz.css
│   │   │   ├── Results.js
│   │   │   ├── Results.css
│   │   │   ├── Dashboard.js
│   │   │   └── Dashboard.css
│   │   ├── App.js
│   │   ├── App.css
│   │   └── index.js
│   └── package.json
├── hindi/
│   └── (44 Hindi letter audio files)
└── telugu/
    └── (49 Telugu letter audio files)
```

## 🚀 Getting Started

### Prerequisites

- Node.js (v14 or higher)
- MongoDB (running locally or MongoDB Atlas)
- npm or yarn

### Installation

1. **Clone or navigate to the project directory**
   ```bash
   cd /home/raviteja/Documents/dass_game
   ```

2. **Install Backend Dependencies**
   ```bash
   cd backend
   npm install
   ```

3. **Install Frontend Dependencies**
   ```bash
   cd ../frontend
   npm install
   ```

4. **Set up MongoDB**

   Make sure MongoDB is running on your system:
   ```bash
   # Start MongoDB (if installed locally)
   sudo systemctl start mongod
   # OR
   sudo service mongod start
   ```

   Or update `.env` file in backend folder with your MongoDB connection string:
   ```
   MONGODB_URI=mongodb://localhost:27017/literacy_game
   ```

5. **Seed the Database**

   Run the seed script to populate quizzes:
   ```bash
   cd backend
   node seeds/seedQuizzes.js
   ```

   You should see:
   ```
   MongoDB Connected for seeding
   Cleared existing quizzes
   Hindi quizzes seeded
   Telugu quizzes seeded
   Database seeding completed successfully!
   ```

6. **Start the Backend Server**
   ```bash
   # From backend directory
   npm start
   # OR for development with auto-reload
   npm run dev
   ```

   Server will run on `http://localhost:5000`

7. **Start the Frontend Application**

   Open a new terminal:
   ```bash
   cd frontend
   npm start
   ```

   Application will open at `http://localhost:3000`

## 🎮 How to Use

1. **Homepage**: Select your language (Hindi or Telugu)
2. **User Registration**: Enter name and age
3. **Planet Selection**: Choose an unlocked planet/level
4. **Quiz**: 
   - Click the audio button to hear the letter
   - Select from 4 options
   - Get immediate feedback
   - Complete 5 questions
5. **Results**: View score, stars, and unlock next level (if score ≥ 3)

## 📊 API Endpoints

### Users
- `POST /api/users` - Create new user
- `GET /api/users/:id` - Get user by ID

### Quizzes
- `GET /api/quizzes/:language` - Get all quizzes for a language
- `GET /api/quizzes/:language/:level` - Get specific quiz

### Scores
- `POST /api/scores` - Submit quiz score
- `GET /api/scores/user/:userId` - Get user scores

### Progress
- `GET /api/progress/:userId` - Get user progress
- `PUT /api/progress/:userId` - Update progress

## 🎨 Color Scheme

- **Primary**: Deep space blue (#0B0C2A)
- **Secondary**: Purple nebula (#6B2FA5)
- **Accent**: Star yellow (#FFD700)
- **Success**: Green (#4CAF50)
- **Error**: Red (#FF5252)

## 🎯 Game Mechanics

- Each quiz has 5 questions
- Correct answer: +1 point
- Wrong answer: 0 points (no negative marking)
- Pass threshold: 3/5 to unlock next level
- Star ratings:
  - 3 stars: 4-5 correct
  - 2 stars: 2-3 correct
  - 1 star: 0-1 correct

## 📝 Database Schema

### Collections

1. **Users**: Store user information
2. **Progress**: Track user progress and current level
3. **Quizzes**: Store quiz questions with audio files
4. **Scores**: Record quiz attempts and results

## 🔧 Troubleshooting

### MongoDB Connection Error
```bash
# Make sure MongoDB is running
sudo systemctl status mongod

# If not running, start it
sudo systemctl start mongod
```

### Port Already in Use
```bash
# Backend (port 5000)
# Kill process on port 5000
sudo lsof -i :5000
sudo kill -9 <PID>

# Frontend (port 3000)
# Kill process on port 3000
sudo lsof -i :3000
sudo kill -9 <PID>
```

### Audio Not Playing
- Check that audio files exist in `hindi/` and `telugu/` folders
- Verify backend is serving static files correctly
- Check browser console for CORS errors

## 🚧 Future Enhancements

- User authentication
- More levels (currently 3 per language)
- Words and simple sentences
- Leaderboard
- Badges and achievements
- Parent dashboard
- Analytics and learning insights
- More languages

## 📄 License

MIT License

## 👥 Contributors

Raviteja

## 🙏 Acknowledgments

- Audio generated using Google Text-to-Speech (gtts)
- Inspired by the need for vernacular early literacy education

---

**Happy Learning! 🌟📚🚀**
