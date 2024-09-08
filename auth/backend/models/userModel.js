const Database = require('better-sqlite3');
const db = new Database('./database/user_auth.db');

// Felhasználó táblázat létrehozása, ha még nem létezik
// Intiger egész számok , Primary key az elsődleges kulcs 
// AUTOINCREMENT automatikussan növekvő érték
// TEXT oszlop szöveget tárol 
// UNIQUE egyedinek kell lennie nem lehet 2 egyforma 

db.exec(`
  CREATE TABLE IF NOT EXISTS users (
    id INTEGER PRIMARY KEY AUTOINCREMENT, 
    username TEXT UNIQUE,
    password TEXT NOT NULL
  )
`);

//felhasználó létrehozása
const createUser = (username, password) => {
  const createUser = db.prepare('INSERT INTO users (username, password) VALUES (?, ?)');
  return createUser.run(username, password);
};

//felhasználó keresése
const findUserByUsername = (username) => {
  const loginUser = db.prepare('SELECT * FROM users WHERE username = ?');
  return loginUser.get(username);
};

module.exports = { createUser, findUserByUsername };
