const { Pool } = require("pg");

const pool = new Pool({
    user: "postgres",
    host: "localhost",
    database: "postgres",
    password: "your_password",
    port: 5432
});

async function getUser(userId) {
    try {
        const result = await pool.query(
            "SELECT * FROM users WHERE id = $1",
            [userId]
        );

        console.log(result.rows);
    } catch (error) {
        console.error(error.message);
    }
}

getUser(1);