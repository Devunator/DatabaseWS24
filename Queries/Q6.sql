WITH action_movies AS (
    SELECT m.MID, m.MovieName ,m.WID, m.gross
    FROM movies m
    WHERE m.Genre = 'Action' AND m.gross IS NOT NULL
    ORDER BY m.gross DESC
    LIMIT 10
)
SELECT a.MovieName, a.gross, w.WriterName
FROM action_movies a
JOIN writers w ON a.WID = w.WID
ORDER BY a.gross DESC;