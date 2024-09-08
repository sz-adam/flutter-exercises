const express = require('express');
const bcrypt = require('bcryptjs');
const { createUser, findUserByUsername } = require('../models/userModel');
const router = express.Router();

// Regisztráció
router.post('/register', async (req, res) => {
  const { username, password } = req.body;

  // Ellenőrizzük, hogy a felhasználónév foglalt-e
  const existingUser = findUserByUsername(username);
  if (existingUser) {
    return res.status(400).json({ message: 'Username is already taken' });
  }

  // Jelszó titkosítása
  const hashedPassword = await bcrypt.hash(password, 10);

  // Új felhasználó létrehozása
  createUser(username, hashedPassword);
  res.status(201).json({ message: 'User created successfully' });
});

// Bejelentkezés
router.post('/login', async (req, res) => {
  const { username, password } = req.body;

  // Felhasználó megkeresése
  const user = findUserByUsername(username);
  if (!user) {
    return res.status(400).json({ message: 'Invalid Username' });
  }

  // Jelszó ellenőrzése
  const isPasswordValid = await bcrypt.compare(password, user.password);
  if (!isPasswordValid) {
    return res.status(400).json({ message: 'Invalid Password' });
  }

  res.status(200).json({ message: 'Login successful' });
});

module.exports = router;