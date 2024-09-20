const express = require('express');
const { addTodo, getTodosByUserId } = require('../models/todoModel');
const authenticateToken = require('../middleware/authMiddleware');
const router = express.Router();

// Új todo hozzáadása
router.post('/add', authenticateToken, (req, res) => {
  const { todo } = req.body;

  if (!todo) {
    return res.status(400).json({ message: 'Todo text is required' });
  }

  addTodo(req.user.userId, todo);
  res.status(201).json({ message: 'Todo added successfully' });
});

// Todo-k megjelenítése bejelentkezett felhasználó számára
router.get('/', authenticateToken, (req, res) => {
  const todos = getTodosByUserId(req.user.userId);
  res.status(200).json(todos);
});

module.exports = router;
