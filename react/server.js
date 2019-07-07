const express = require('express'); 
const path = require('path')
const app = express(); 

const port = 8000
const options = { 
    index: 'index.html' 
}; 

app.use('/', express.static('/public', options)); 

app.listen(port, () => console.log(`Example app listening on port ${port}!`))