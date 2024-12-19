WITH top_studio AS (
    SELECT m.CID, c.CompanyName, AVG(m.gross) AS average_gross
    FROM movies m
    JOIN companies c ON m.CID = c.CID
    WHERE m.gross IS NOT NULL
    GROUP BY m.CID, c.CompanyName
    ORDER BY average_gross DESC
    LIMIT 10
),
top_genre AS (
    SELECT m.CID, m.Genre, SUM(m.gross) AS genre_gross
    FROM movies m
    GROUP BY m.CID, m.Genre
)
SELECT s.CompanyName, s.average_gross, g.Genre, g.genre_gross
FROM top_studio s
JOIN top_genre g ON s.CID = g.CID
WHERE g.genre_gross = (
    SELECT MAX(genre_gross)
    FROM top_genre ghelp
    WHERE ghelp.CID = s.CID
)
ORDER BY s.average_gross DESC;