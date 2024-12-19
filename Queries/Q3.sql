WITH most_successfull AS (
    SELECT MID, MovieName, gross, IMDBScore
    FROM movies
    WHERE gross IS NOT NULL
    ORDER BY gross DESC
    LIMIT 100
),
most_popular AS (
    SELECT MID, MovieName, gross, IMDBScore
    FROM movies
    WHERE IMDBScore IS NOT NULL
    ORDER BY IMDBScore DESC
    LIMIT 100
)
SELECT suc.MovieName, suc.gross, suc.IMDBScore
FROM most_successfull suc
JOIN most_popular vot ON suc.MID = vot.MID
ORDER BY suc.gross DESC;