const express = require('express');
const bodyParser = require('body-parser');
const authRoutes = require('./routes/auth');
const todoRoutes = require('./routes/todo');

const app = express();

app.use(bodyParser.json());

// Auth útvonalak
app.use('/auth', authRoutes);
//todo utvanalak
app.use('/todo', todoRoutes);


// Szerver indítása
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
