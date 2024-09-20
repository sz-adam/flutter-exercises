const Database = require('better-sqlite3');
const db = new Database('./database/user_auth.db');

// Todo tábla létrehozása
db.exec(`
  CREATE TABLE IF NOT EXISTS todos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    userId INTEGER,
    todo TEXT,
    FOREIGN KEY(userId) REFERENCES users(id)
  )
`);

// Todo hozzáadása
const addTodo = (userId, todo) => {
  const stmt = db.prepare('INSERT INTO todos (userId, todo) VALUES (?, ?)');
  return stmt.run(userId, todo);
};

// Todo-k lekérdezése felhasználó alapján
const getTodosByUserId = (userId) => {
  const stmt = db.prepare('SELECT * FROM todos WHERE userId = ?');
  return stmt.all(userId);
};

module.exports = { addTodo, getTodosByUserId };
