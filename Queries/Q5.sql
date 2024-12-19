WITH top_actor AS (
    SELECT m.SID, s.StarName, SUM(m.gross) AS Total_Gross
    FROM movies m
    JOIN stars s ON m.SID = s.SID
    WHERE m.gross IS NOT NULL
    GROUP BY m.SID, s.StarName
    ORDER BY Total_Gross DESC
    LIMIT 10
),
actor_genre AS (
    SELECT m.SID, m.Genre, COUNT(*) AS Genre_Count
    FROM movies m
    GROUP BY m.SID, m.Genre
)
SELECT a.StarName, a.Total_Gross, g.Genre, g.Genre_Count
FROM top_actor a
JOIN actor_genre g ON a.SID = g.SID
WHERE g.Genre IN (
    SELECT Genre
    FROM actor_genre ghelp
    WHERE ghelp.SID = a.SID
    ORDER BY ghelp.Genre_Count DESC
    LIMIT 1
)
ORDER BY a.Total_Gross DESC;