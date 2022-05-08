require("dotenv").config();
const express = require("express");
const db = require("./database");
const cors = require("cors");
const path = require("path");


const app = express();

app.listen(3001);

app.use(cors());
app.use(express.json());

app.get('/api/v1/data', (req, res) => {
    res.sendFile(path.join(__dirname, "water-price.pgsql"));
})

app.post('/api/v1/suggestion', async (req, res) => {

})

app.post('/api/v1/query', async (req, res) => {
    try {

        // creates query using the keys
        // todo refactor into utility function?
        query = "SELECT * FROM value_price INNER JOIN source ON source.src_uri=value_price.source_uri WHERE";

        const keys = Object.keys(req.body);
        const values = [];


        const nonEmptyKeys = keys.filter((key) => req.body[key])
        for (let i = 0; i < nonEmptyKeys.length; i ++) {

                values.push(req.body[nonEmptyKeys[i]])
                // todo check if keys are valid to prevent SQL injection
                // gotta be a better way to do this?
                if (nonEmptyKeys[i] === "min_price") {
                    query = query.concat(" value_price." , "vp_num", ` >= $${i + 1}`);
                } else if (nonEmptyKeys[i] === "max_price") {
                    query = query.concat(" value_price." , "vp_num", ` <= $${i + 1}`);
                } else {
                    query = query.concat(" value_price." ,nonEmptyKeys[i], ` = $${i + 1}`);
                }
    
                if (i < nonEmptyKeys.length - 1) {
                    query = query.concat(" AND");
                } else {
                    query = query.concat(";")
                
            }
        }

        const results = await db.query(
            query,
            values
        )       

        res.status(201).json({
            status: "success",
            data: {
                rows: results.rows
            }
        })
    } catch (err) {
        console.log(err);
    }})