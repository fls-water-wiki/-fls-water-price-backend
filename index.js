require("dotenv").config();
const express = require("express");
const db = require("./database");
const cors = require("cors");
const path = require("path");
const { rows } = require("pg/lib/defaults");


const app = express();

app.listen(3001);

app.use(cors());
app.use(express.json());

// returns the pgsql file containing all the water data
app.get('/api/v1/data', (req, res) => {
    res.sendFile(path.join(__dirname, "water-price.pgsql"));
});

// handles adding new data
app.post('/api/v1/add', async (req, res) => {
    const sourceText = "INSERT INTO source (source_uri, source_title, source_date, source_note, source_belief, source_creator) VALUES($1, $2, $3, $4, $5, $6)";
    const sourceValues = [req.body.source_uri, req.body.source_title, req.body.source_date, req.body.source_note, req.body.source_belief, req.body.source_creator];

    const valuePriceText = "INSERT INTO value_price (vp_num, curr_code, vp_date, vp_wtrunit, type_id, sector_code, source_uri, region_code, nat_code) VALUES($1, $2, $3, $4, $5, $6, $7, $8, $9, $10)";
    const valuePriceValues = [req.body.vp_num, req.body.curr_code, req.body.vp_usd, req.body.vp_date, req.body.vp_wtrunit, req.body.type_id, req.body.sector_code, req.body.source_uri, req.body.region_code, req.body.nat_code];

    try {
        await db.query(sourceText, sourceValues);
        await db.query(valuePriceText, valuePriceValues);

        res.status(201).json({
            status: "success"
        });

    } catch (err) {
        res.status(500);
    }

});

// handles search queries
app.post('/api/v1/query', async (req, res) => {
    try {

        // the  query and values are separate, where the nth item in the values array
        // corresponds to the nth item in the query
        // TODO refactor into utility function?
        let query = "SELECT value_price.*, source.src_uri, source.src_title FROM value_price INNER JOIN source ON source.src_uri=value_price.source_uri WHERE";

        const keys = Object.keys(req.body);
        const values = [];


        const nonEmptyKeys = keys.filter((key) => req.body[key]);
        for (let i = 0; i < nonEmptyKeys.length; i ++) {

                values.push(req.body[nonEmptyKeys[i]])
                // TODO check if keys are valid to prevent SQL injection
                // gotta be a better way to do this
                if (nonEmptyKeys[i] === "earliest_year") {
                    query = query.concat(" value_price." , "date", ` >= $${i + 1}`);
                } else if (nonEmptyKeys[i] === "latest_year") {
                    query = query.concat(" value_price." , "date", ` <= $${i + 1}`);
                } else {
                    query = query.concat(" value_price." ,nonEmptyKeys[i], ` = $${i + 1}`);
                };
    
                if (i < nonEmptyKeys.length - 1) {
                    query = query.concat(" AND");
                } else {
                    query = query.concat(";");
                };
        };

        const results = await db.query(query, values);
        
        res.status(201).json({
            status: "success",
            data: {
                rows: results.rows
            }
        });
    } catch (err) {
        console.log(err);
    }})