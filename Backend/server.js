const express = require('express');
const app = express();
const port = 4590 || process.env.PORT;
const cors = require('cors');
const bodyParser = require('body-parser');


app.use(cors());
app.use(bodyParser.urlencoded({extended:true}));
app.use(bodyParser.json());
app.use('/',require('./api'));
app.listen(port,()=>{
    console.log('port running on '+port)
});

