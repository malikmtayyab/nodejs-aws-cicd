// index.js
const express = require('express');
const app = express();
const port = 3000;

// Middleware to parse JSON bodie
app.use(express.json());

// Define a route
app.get('/', (req, res) => {
  res.send('Hello, Express!');
});

// Start the server
app.listen(port, () => {
  console.log(`Server is running at http://localhost:${port}`);
});
