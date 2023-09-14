const {Client} = require('pg');
const express = require('express');
const bcrypt = require("bcrypt");
const router = express.Router();


// postgres connect 
const client = new Client({
    host: 'localhost',
    user: 'postgres',
    password: 'postgres',
    port:3478,
    database: 'postgres'
});

// connecting database 
client.connect();

console.log("database conection successful");

//sign up
router.post('/signup',async (req,res)=>{

  let { name, email, password } = req.body;
  let errors = [];

  if (!name || !email || !password) {
    errors.push({ message: "Please enter all fields" });
  }

  if (password.length < 6) {
    errors.push({ message: "Password must be a least 6 characters long" });
  }
  
  if (errors.length > 0) {
    res.render("register", { errors, name, email, password});
  } else {
    hashedPassword = await bcrypt.hash(password, 10);
    console.log(hashedPassword);
    // Validation passed
    client.query(
      `SELECT * FROM users
        WHERE email = $1`,
      [email],
      (err, results) => {
        if (err) {
          res.json({message:"Server Error"});
        }
        console.log(results.rows);

        if (results.rows.length > 0) {
          return res.json({message: "Email already registered"});
        } else {
          client.query(
            `INSERT INTO users (name, email, password)
                VALUES ($1, $2, $3)
                RETURNING id, password`,
            [name, email, hashedPassword],
            (err, results) => {
              if (err) {
                res.json({message:"Server Error"});
              }
              res.json({
                email:req.body.email,
                password:req.body.password
              });
            }
          );
        }
      }
    );
  }
});// sign up


//sign in
router.post('/signin',async (req,res)=>{
  console.log(req.body);
    let { email, password } = req.body;
    let errors = [];


    if (!email ||!password) {
        errors.push({ message: "Please enter all fields" });
    }
    if(errors.length>0){
      res.json({message:"Please enter all fields"});
    }else{
        client.query(
            `SELECT password FROM users
                WHERE email = $1`,
            [email],
            (err, results) =>{
                
                if (err) {
                  res.json({message:"Server Error"});
                }
              if(results.rowCount > 0){
                (async () => {
                  var t = results.rows;
                  var hpass = t[0].password;
                  var hresult = await bcrypt.compare(password,hpass);
                  if(results.rowCount == 0){
                    res.json({message:"login error"});
                  }else if(hresult == true){
                    res.json({
                      email:req.body.email,
                      password:req.body.password,
                    });
                  }else{
                    res.json({message:"wrong password"});
                  }
                })();
                
              }
              else{
                  res.json({message:"invalid credentials"})
              }
            });
    }
}
);// sign in 
module.exports = router;

