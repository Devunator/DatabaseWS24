WITH most_succesfull_movies AS (
    SELECT Genre, gross
    FROM movies
    WHERE gross IS NOT NULL
    ORDER BY gross DESC
    LIMIT 100
)
SELECT Genre, SUM(gross) AS Total_Gross
FROM most_succesfull_movies
GROUP BY Genre
ORDER BY Total_Gross DESC
LIMIT 10;