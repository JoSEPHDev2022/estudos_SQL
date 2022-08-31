-- Selecione o nome (Customer.FirstName) e a soma dos valores das contas dos usuários
-- (Invoice.Total) filtrando pelos usuários que tiveram a soma das contas maiores
-- que 40 e ordenados de modo que os maiores valores apareçam primeiro;
SELECT
	Customer.FirstName,
	SUM(Invoice.Total)
FROM Customer
	LEFT JOIN Invoice
		ON Customer.CustomerId = Invoice.CustomerId
GROUP BY Customer.FirstName
	HAVING SUM(Invoice.Total) > 40
ORDER BY SUM(Invoice.Total) DESC;

-- Exiba a soma de tempo das músicas em milisegundos agrupados pelos nomes dos países de origem
-- dos usuários;
SELECT
	Customer.Country,
	SUM(Track.Milliseconds)
FROM Customer
	LEFT JOIN Invoice
		ON Customer.CustomerId = Invoice.CustomerId
	LEFT JOIN InvoiceLine
		ON InvoiceLine.InvoiceId = Invoice.InvoiceId
	LEFT JOIN Track
		ON InvoiceLine.TrackId = Track.TrackId
GROUP BY Customer.Country
ORDER BY SUM(Track.Milliseconds) DESC;
    
-- Selecione o país de origem dos usuários que mais escutam músicas do tipo Rock;
SELECT 
	Customer.Country,
	SUM(Track.Milliseconds),
	Genre.Name genre
FROM Customer
	LEFT JOIN Invoice
		ON Invoice.CustomerId = Customer.CustomerId
	LEFT JOIN InvoiceLine
		ON InvoiceLine.InvoiceId = Invoice.InvoiceId
	LEFT JOIN Track
		ON Track.TrackId = InvoiceLine.TrackId
	LEFT JOIN Genre
		ON Genre.GenreId = Track.GenreId
GROUP BY Customer.Country, Genre.Name
	HAVING Genre.Name = 'Rock'
ORDER BY SUM(Track.Milliseconds) DESC;   
    
-- Selecione o nome do artista mais tocado no Brasil;
SELECT
	Artist.Name artista,
	SUM(Track.Milliseconds),
	Customer.Country
FROM Artist
	LEFT JOIN Album
		ON Album.ArtistId = Artist.ArtistId
	LEFT JOIN Track
		ON Track.AlbumId = Album.AlbumId
	LEFT JOIN InvoiceLine
		ON InvoiceLine.TrackId = Track.TrackId
	LEFT JOIN Invoice
		ON InvoiceLine.InvoiceId = Invoice.InvoiceId
	LEFT JOIN Customer
		ON Customer.CustomerId = Invoice.CustomerId
GROUP BY Artist.Name, Customer.Country
	HAVING Customer.Country = 'Brazil'
ORDER BY SUM(Track.Milliseconds) DESC
LIMIT 1;
    
-- Selecione os nomes dos artistas mais tocados agrupados por países de origem dos
-- usuários;
SELECT 
	Customer.Country,
	Artist.Name artist,
	SUM(Track.Milliseconds) total
FROM Customer
	LEFT JOIN Invoice
		ON Invoice.CustomerId = Customer.CustomerId
	LEFT JOIN InvoiceLine
		ON InvoiceLine.InvoiceId = Invoice.InvoiceId
	LEFT JOIN Track
		ON Track.TrackId = InvoiceLine.TrackId
	LEFT JOIN Album
		ON Album.AlbumId = Track.AlbumId
	LEFT JOIN Artist
		ON Artist.ArtistId = Album.ArtistId
GROUP BY Artist.Name, Customer.Country
ORDER BY SUM(Track.Milliseconds) DESC;

-- Selecione o nome dos artistas associados com o título dos seus álbuns;
SELECT 
	Artist.Name Artista,
	Album.Title Album
FROM Artist
	LEFT JOIN Album
		ON Artist.ArtistId = Album.ArtistId
GROUP BY Artist.Name, Album.Title
ORDER BY Artist.Name;

-- Selecione o nome dos artistas associados com o nome das músicas (Track.name) de
-- forma paginada com 10 resultados por página;
SELECT * FROM
(SELECT Artist.Name AS artista, Track.Name AS musica FROM Track
    INNER JOIN Album
        ON Track.AlbumId = Album.AlbumId
    INNER JOIN Artist
        ON Album.ArtistId = Artist.ArtistId
    GROUP BY Artist.Name, Track.Name
    ORDER BY Track.Name)
AS tabela
ORDER BY artista, musica
    LIMIT 10
    OFFSET (1-1)*10;
    
-- Selecione o nome das playlists e o total de músicas (Track.Name) agrupadas pelas
-- playlists que pertencem e ordenadas pelas playlists que possuem mais músicas;
SELECT
	Playlist.Name playlist,
	COUNT(Track.Name) num_musicas
FROM Playlist
	LEFT JOIN PlaylistTrack
		ON Playlist.PlaylistId = PlaylistTrack.PlaylistId
	LEFT JOIN Track
		ON PlaylistTrack.TrackId = Track.TrackId
GROUP BY Playlist.Name
ORDER BY COUNT(Track.Name) DESC;

-- Exiba o nome do gênero e a média de tempo das musicas em milisegundos agrupadas
-- por gênero
SELECT 
	Genre.Name genero,
	AVG(Track.Milliseconds) media
FROM Genre
	LEFT JOIN Track
		ON Genre.GenreId = Track.GenreId
GROUP BY Genre.Name
ORDER BY AVG(Track.Milliseconds) DESC;

-- Exiba o álbum que possui a maior média de tempo em milisegundos cujo gênero musical é Rock;
SELECT
	Album.Title album,
	SUM(Track.Milliseconds) media,
	Genre.Name genero
FROM Album
	LEFT JOIN Track
		ON Album.AlbumId = Track.AlbumId
	LEFT JOIN Genre
		ON Genre.GenreId = Track.GenreId
GROUP BY Album.Title, Genre.Name
	HAVING Genre.Name = 'Rock'
ORDER BY SUM(Track.Milliseconds) DESC;