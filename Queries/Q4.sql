WITH top_directors AS (
    SELECT m.DID, d.DirectorName, SUM(m.gross) AS Total_Gross
    FROM movies m
    JOIN directors d ON m.DID = d.DID
    WHERE m.gross IS NOT NULL
    GROUP BY m.DID, d.DirectorName
    ORDER BY Total_Gross DESC
    LIMIT 10
),
top_movies AS (
    SELECT MID, gross
    FROM movies
    WHERE gross IS NOT NULL
    ORDER BY gross DESC
    LIMIT 100
)
SELECT dir.DirectorName, COUNT(mov.MID) AS Appearances_In_Top_100
FROM top_directors dir
JOIN movies mov ON dir.DID = mov.DID
JOIN top_movies dhelp ON mov.MID = dhelp.MID
GROUP BY dir.DirectorName
ORDER BY Appearances_In_Top_100 DESC;