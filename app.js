//in dev run nodemon with for instant reload
//add requiered library 
//const express =  require('express'); //must be installed with npm
import express from "express";
//const ejs = require('ejs'); //must be installed with npm
import ejs from "ejs";
//const db = require('./db.js'); // Import the database module
import * as db from "./db.js"
//const bodyParser = require('body-parser');//must be installed with npm
import bodyParser from "body-parser";


//create variable representing express
const app = express();

//set public folder for static web pages
app.use(express.static('public'));

//set dynamic web pages, set views and engine
app.set('view engine', 'ejs');

// Set up body parser middleware to parse URL-encoded form data
app.use(bodyParser.urlencoded({ extended: true }));
// Use body-parser middleware to send JSON data
app.use(bodyParser.json());

////////////////Routing
function buildData(cols){
        let colQuery = "";
        for (let i = 0; i < cols.length; i++) {
            if(i<cols.length-1){    
                colQuery+=cols[i]+",";
            }else{
                colQuery+=cols[i]
            }     
        }
        return colQuery;
    }

async function insertInto(data){
    const sql = `INSERT INTO ${data.tableName} (${buildData(data.columnNames)}) VALUES (${buildData(data.columnValues)})`;
    const dbData = await db.query(sql);
}

async function getTables(){
    const sql = 'SHOW tables';
    const dbTables = await db.query(sql);
    return dbTables
}

app.get('/', async (req, res) => {
    //res.send("hello World");//serves index.html
    const pageTitle = "Dynamic webpage";
    const dbTables = await getTables();
    let errorMsg = "";
    let tableName = "select table";
    res.render('index', {pageTitle,tableName, dbTables, errorMsg} );
});

let currentTable;
app.post('/', async (req, res) => {
    console.log(req.body);
    const dbTables = await getTables();
    //getting input data from the form
    const pageTitle = "Dynamic webpage";
    //remove row
    if(req.body.delRowBtn){
        await db.query(`DELETE FROM ${req.body.delRowBtn.split(",")[0]} WHERE id=${req.body.delRowBtn.split(",")[1]}`);
    }

    //show data
  

    let errorMsg = "";
    let tableName = "";
    let dbData=[];
    if(req.body.tableAsideBtn){
        let tableName = req.body.tableAsideBtn;
        let sql = `SELECT * FROM ${req.body.tableAsideBtn}`;
        dbData = await db.query(sql);
        res.render('index', {pageTitle,tableName, dbData, dbTables, errorMsg});
    }else if(req.body.delRowBtn){
        let tableName = req.body.delRowBtn.split(",")[0];
        let sql = `SELECT * FROM ${req.body.delRowBtn.split(",")[0]}`;
        dbData = await db.query(sql);
        res.render('index', {pageTitle,tableName, dbData, dbTables, errorMsg});
    }else{
        errorMsg = "table name missing";
        dbData = [{}];
        res.render('index', {pageTitle,tableName, dbData,dbTables, errorMsg});
    }
});



app.get('/removeData', async (req, res) => {
    //res.send("hello World");//serves index.html
    const pageTitle = "Dynamic webpage";
    const sql = `SELECT * FROM ${currentTable}`;
    const dbData = await db.query(sql);
    console.log(dbData);
    res.render('removeData', {pageTitle, dbData} );
});
app.post('/removeData', async (req, res) => {
    //res.send("hello World");//serves index.html
    //getting input data from the form
    console.log(req.body);
    const requestData = req.body;
    const pageTitle = "Dynamic webpage";
    //execute delete query on a table.row
    const sqlDeleteQuery = `DELETE FROM ${currentTable} WHERE id=${requestData.id}`;
    const deleteQuery = await db.query(sqlDeleteQuery);
    console.log(deleteQuery);
    //get table data
    const sql = `SELECT * FROM ${currentTable}`;
    const dbData = await db.query(sql);
    //get table headers
    const sql2 = `DESCRIBE ${currentTable}`;
    const dbDataHeaders = await db.query(sql2);
    console.log(dbDataHeaders);
    //show webpage to the user
    res.render('removeData', {pageTitle, dbData, dbDataHeaders} );
});

//return Json table data /student /student ?id=2&name=John /student/2
app.get('/students', async (req, res) => {
    let sql = "";
    const {id,john} = req.query;
    console.log(id);
    if(id){
        sql = `SELECT * FROM students WHERE id = ${id}`;
    }else{
        sql = `SELECT * FROM students`;
    }
    const dbData = await db.query(sql);
    console.log(dbData);
    res.json(dbData);
});

//return Json table data / courses /courses ?id=2&name=HTML & CSS /course/2
app.get('/courses', async (req, res) => {
    let sql = "";
    const {id,john} = req.query;
    console.log(id);
    if(id){
        sql = `SELECT * FROM courses WHERE id = ${id}`;
    }else{
        sql = `SELECT * FROM courses`;
    }
    const dbData = await db.query(sql);
    console.log(dbData);
    res.json(dbData);
});

//server configuration
const port = 3000;
app.listen(port, () => {
    console.log(`server is running on  http://localhost:${port}/`);
});