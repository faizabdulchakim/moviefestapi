-- --------------------------------------------------------
-- Host:                         FAIZPC\MSSQLSERVER01
-- Server version:               Microsoft SQL Server 2019 (RTM) - 15.0.2000.5
-- Server OS:                    Windows 10 Home Single Language 10.0 <X64> (Build 18363: ) (Hypervisor)
-- HeidiSQL Version:             11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES  */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table cms.artists
CREATE TABLE IF NOT EXISTS "artists" (
	"id" INT NOT NULL,
	"name" VARCHAR(50) NULL DEFAULT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"status" BIT NULL DEFAULT NULL,
	PRIMARY KEY ("id")
);

-- Dumping data for table cms.artists: -1 rows
/*!40000 ALTER TABLE "artists" DISABLE KEYS */;
INSERT INTO "artists" ("id", "name", "status") VALUES
	(1, 'Angelina Jolie', b'1'),
	(2, 'Robert Downey, Jr.', b'1'),
	(3, 'Chris Hemsworth', b'1'),
	(4, 'Tom Holland', b'1'),
	(5, 'Chris Evans', b'1'),
	(6, 'Will Smith', b'1'),
	(7, 'Naomi Scott', b'1');
/*!40000 ALTER TABLE "artists" ENABLE KEYS */;

-- Dumping structure for table cms.genres
CREATE TABLE IF NOT EXISTS "genres" (
	"id" INT NOT NULL,
	"name" VARCHAR(50) NULL DEFAULT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"status" BIT NULL DEFAULT NULL,
	PRIMARY KEY ("id")
);

-- Dumping data for table cms.genres: -1 rows
/*!40000 ALTER TABLE "genres" DISABLE KEYS */;
INSERT INTO "genres" ("id", "name", "status") VALUES
	(1, 'Cartoon', b'1'),
	(2, 'Horror', b'1'),
	(3, 'Action', b'1'),
	(4, 'Adventure', b'1');
/*!40000 ALTER TABLE "genres" ENABLE KEYS */;

-- Dumping structure for table cms.movies
CREATE TABLE IF NOT EXISTS "movies" (
	"id" INT NOT NULL,
	"title" VARCHAR(50) NULL DEFAULT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"description" TEXT NULL DEFAULT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"duration" INT NULL DEFAULT NULL,
	"watchURL" VARCHAR(50) NULL DEFAULT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"status" BIT NULL DEFAULT 'NULL',
	"genre_id" INT NULL DEFAULT 'NULL',
	PRIMARY KEY ("id")
);

-- Dumping data for table cms.movies: -1 rows
/*!40000 ALTER TABLE "movies" DISABLE KEYS */;
INSERT INTO "movies" ("id", "title", "description", "duration", "watchURL", "status", "genre_id") VALUES
	(1, 'Soul', 'Soul is a 2020 American computer-animated fantasy comedy-drama film produced by Pixar Animation Studios and released by Walt Disney Pictures. Directed by Pete Docter and co-directed by Kemp Powers, the film stars the voices of Jamie Foxx, Tina Fey, Graham Norton, Rachel House, Alice Braga, Richard Ayoade, Phylicia Rashad, Donnell Rawlings, Questlove, and Angela Bassett. The story follows a middle school music teacher named Joe Gardner, who seeks to reunite his soul and his body after they are accidentally separated, just before his big break as a jazz musician.

Docter began developing the film in 2016, working from his contemplations on the origins of human personalities and the concept of determinism. He co-wrote the screenplay with Mike Jones and Powers. The film''s producers consulted various jazz musicians including Herbie Hancock and Terri Lyne Carrington, and animated its musical sequences using the sessions of musician Jon Batiste (who created original compositions for the film) as reference. Soul is the first Pixar film to feature an African-American protagonist.

Soul premiered at the London Film Festival on October 11, 2020. Originally intended to be a theatrical release in the United States, the film was released to stream on Disney+ on December 25, 2020, and was theatrically released in countries without the streaming service. It received highly positive reviews from critics, with praise for its animation, story, voice acting, and music.', 120, 'http://test.kom/1', b'1', 1),
	(2, 'Mulan', 'Mulan is a 2020 American action drama film produced by Walt Disney Pictures. It is a live-action adaptation of Disney''s 1998 animated film of the same name, itself based on the Chinese folklore story, "The Ballad of Mulan". The film stars Yifei Liu in the title role, alongside Donnie Yen, Tzi Ma, Jason Scott Lee, Yoson An, Ron Yuan, Gong Li, and Jet Li in supporting roles. It is directed by Niki Caro, with a screenplay by Rick Jaffa, Amanda Silver, Lauren Hynek, and Elizabeth Martin. Plans for a live-action remake began in 2010 but the project stalled in "development hell" for most of the decade. Filming took place in New Zealand and China from August to November 2018. Over the course of production, the film was the subject of several controversies, including changes to the source material and filming in Xinjiang in light of the Uyghur genocide and Xinjiang re-education camps.

Mulan''s Hollywood premiere was held on March 9, 2020. Originally scheduled to be a wide theatrical release later that month, it was ultimately cancelled in the United States after being delayed multiple times due to the COVID-19 pandemic. Disney instead premiered the film on September 4, 2020 on Disney+, for a premium fee in countries where the service had launched. The film had a traditional theatrical release in countries without Disney+ where theaters have re-opened. With a production budget of $200 million, the film was a financial disappointment (partially due to the pandemic), grossing only $70 million, not including digital earnings from Disney+. The film received generally positive reviews from western critics, who praised the action sequences, visuals, and performances but criticized the screenplay. It received unfavorable reviews from Chinese audiences, who criticized the character development, inaccurate depictions of Chinese history and mishandling of Chinese cultural elements.', 130, 'http://test.kom/2', b'1', 3),
	(3, 'Avengers Infinity War', 'Avengers: Infinity War is a 2018 American superhero film based on the Marvel Comics superhero team the Avengers. Produced by Marvel Studios and distributed by Walt Disney Studios Motion Pictures, it is the sequel to The Avengers (2012) and Avengers: Age of Ultron (2015), and the 19th film in the Marvel Cinematic Universe (MCU). Directed by Anthony and Joe Russo and written by Christopher Markus and Stephen McFeely, the film features an ensemble cast including Robert Downey Jr., Chris Hemsworth, Mark Ruffalo, Chris Evans, Scarlett Johansson, Benedict Cumberbatch, Don Cheadle, Tom Holland, Chadwick Boseman, Paul Bettany, Elizabeth Olsen, Anthony Mackie, Sebastian Stan, Danai Gurira, Letitia Wright, Dave Bautista, Zoe Saldana, Josh Brolin, and Chris Pratt. In the film, the Avengers and the Guardians of the Galaxy attempt to prevent Thanos from collecting the six all-powerful Infinity Stones as part of his quest to kill half of all life in the universe.', 180, 'http://test.kom/3', b'1', 3),
	(4, 'Terminator Dark Fate', 'Terminator: Dark Fate is a 2019 American science fiction action film directed by Tim Miller and written by David Goyer, Justin Rhodes, and Billy Ray from a story by James Cameron, Charles Eglee, Josh Friedman, Goyer, and Rhodes. Cameron also produced the film with David Ellison. It is the sixth installment in the Terminator film franchise, and acts as a direct sequel to The Terminator (1984) and Terminator 2: Judgment Day (1991), while disregarding T2-3D: Battle Across Time (1996), Terminator 3: Rise of the Machines (2003), Terminator Salvation (2009), Terminator Genisys (2015), and the television series Terminator: The Sarah Connor Chronicles (2008–2009) as occurring in alternate timelines, following the return of creative control to Cameron.[5]', 90, 'http://test.kom/4', b'1', 3),
	(5, 'Maleficent: Mistress of evil', 'Maleficent: Mistress of Evil is a 2019 American 3D fantasy film produced by Walt Disney Pictures, directed by Joachim Rønning, and written by Linda Woolverton, Micah Fitzerman-Blue, and Noah Harpster. It is a sequel to the 2014 film Maleficent,[1] with Angelina Jolie returning to portray the title role. Elle Fanning, Sam Riley, Imelda Staunton, Juno Temple and Lesley Manville also return to their previous roles, with Harris Dickinson replacing Brenton Thwaites from the first film and Chiwetel Ejiofor, Ed Skrein and Michelle Pfeiffer joining the cast as new characters.', 115, 'http://test.kom/5', b'1', 2),
	(6, 'Aladdin', 'Aladdin is a 2019 American live-action animated musical fantasy film produced by Walt Disney Pictures. Directed by Guy Ritchie, from a script he co-wrote with John August, it is a live-action adaptation of Disney''s 1992 animated film of the same name, which itself is based on the eponymous tale from One Thousand and One Nights.[1][a] The film stars Will Smith, Mena Massoud, Naomi Scott, Marwan Kenzari, Navid Negahban, Nasim Pedrad, Billy Magnussen, and Numan Acar, as well as the voices of Alan Tudyk and Frank Welker, the latter of whom reprises his roles from all previous media. The plot follows Aladdin, a street urchin, as he falls in love with Princess Jasmine, befriends a wish-granting Genie, and battles the wicked Jafar.', 125, 'http://test.kom/6', b'1', 4),
	(7, 'The Lion King', 'The Lion King is a 1994 American animated musical drama film produced by Walt Disney Feature Animation and released by Walt Disney Pictures. It is the 32nd Disney animated feature film, and the fifth animated film produced during a period known as the Disney Renaissance. The Lion King was directed by Roger Allers and Rob Minkoff, produced by Don Hahn, and has a screenplay credited to Irene Mecchi, Jonathan Roberts, and Linda Woolverton. Its original songs were written by composer Elton John and lyricist Tim Rice, with a score by Hans Zimmer. The film features an ensemble voice cast that includes Matthew Broderick, James Earl Jones, Jeremy Irons, Jonathan Taylor Thomas, Moira Kelly, Nathan Lane, Ernie Sabella, Rowan Atkinson, Robert Guillaume, Madge Sinclair (in her last film role), Whoopi Goldberg, Cheech Marin, and Jim Cummings. The story takes place in a kingdom of lions in Africa and was influenced by the Biblical stories of Joseph and Moses, and William Shakespeare''s Hamlet.', 135, 'http://test.kom/7', b'1', 1),
	(8, 'Toy Story 4', 'Toy Story 4 is a 2019 American computer-animated comedy film produced by Pixar Animation Studios and released by Walt Disney Pictures. It is the fourth installment in Pixar''s Toy Story series and the sequel to Toy Story 3 (2010). It was directed by Josh Cooley (in his feature directorial debut) from a screenplay by Andrew Stanton and Stephany Folsom; the three also conceived the story alongside John Lasseter, Rashida Jones, Will McCormack, Valerie LaPointe, and Martin Hynes.[1] Tom Hanks, Tim Allen, Annie Potts, Joan Cusack, Don Rickles (via archive recordings),[a] Wallace Shawn, John Ratzenberger, Estelle Harris, Blake Clark, Bonnie Hunt, Jeff Garlin, Kristen Schaal and Timothy Dalton reprise their character roles from the first three films. They are joined by Tony Hale, Keegan-Michael Key, Jordan Peele, Christina Hendricks, Keanu Reeves, and Ally Maki, who voice the new characters.', 112, 'http://test.kom/8', b'1', 1),
	(9, 'I, Robot', 'I, Robot (stylized as i,robot) is a 2004 American science fiction action film directed by Alex Proyas. The screenplay by Jeff Vintar and Akiva Goldsman is from a screen story by Vintar, based on his original screenplay "Hardwired", and suggested by Isaac Asimov''s 1950 short-story collection of the same name. The film stars Will Smith, Bridget Moynahan, Bruce Greenwood, James Cromwell, Chi McBride, and Alan Tudyk. In 2035, highly intelligent robots fill public service positions throughout the dystopian[2] world, operating under three rules to keep humans safe. Detective Del Spooner (Smith) investigates the alleged suicide of U.S. Robotics founder Alfred Lanning (Cromwell) and believes that a human-like robot (Tudyk) murdered him.', 124, 'http://test.kom/9', b'1', 3);
/*!40000 ALTER TABLE "movies" ENABLE KEYS */;

-- Dumping structure for table cms.movie_artists
CREATE TABLE IF NOT EXISTS "movie_artists" (
	"artist_id" INT NULL DEFAULT NULL,
	"movie_id" INT NULL DEFAULT NULL,
	"status" BIT NULL DEFAULT NULL
);

-- Dumping data for table cms.movie_artists: -1 rows
/*!40000 ALTER TABLE "movie_artists" DISABLE KEYS */;
INSERT INTO "movie_artists" ("artist_id", "movie_id", "status") VALUES
	(1, 5, b'1'),
	(2, 3, b'1'),
	(3, 3, b'1'),
	(4, 3, b'1'),
	(5, 3, b'1'),
	(6, 6, b'1'),
	(6, 9, b'1');
/*!40000 ALTER TABLE "movie_artists" ENABLE KEYS */;

-- Dumping structure for table cms.user_account
CREATE TABLE IF NOT EXISTS "user_account" (
	"id" INT NOT NULL,
	"user_level_id" INT NULL DEFAULT NULL,
	"name" VARCHAR(50) NULL DEFAULT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"password" VARCHAR(50) NULL DEFAULT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"status" TINYINT NULL DEFAULT NULL,
	PRIMARY KEY ("id")
);

-- Dumping data for table cms.user_account: -1 rows
/*!40000 ALTER TABLE "user_account" DISABLE KEYS */;
INSERT INTO "user_account" ("id", "user_level_id", "name", "password", "status") VALUES
	(1, 1, 'faiz', 'e172dd95f4feb21412a692e73929961e', 1),
	(2, 1, 'abdul', 'cfgfdgdg', 1),
	(3, 1, 'chakim', 'fgfghfhfgh', 1);
/*!40000 ALTER TABLE "user_account" ENABLE KEYS */;

-- Dumping structure for table cms.views
CREATE TABLE IF NOT EXISTS "views" (
	"user_account_id" INT NULL DEFAULT NULL,
	"movie_id" INT NULL DEFAULT NULL
);

-- Dumping data for table cms.views: -1 rows
/*!40000 ALTER TABLE "views" DISABLE KEYS */;
INSERT INTO "views" ("user_account_id", "movie_id") VALUES
	(1, 1),
	(1, 2),
	(1, 9),
	(2, 6),
	(2, 8),
	(2, 2),
	(2, 7),
	(3, 2),
	(3, 9);
/*!40000 ALTER TABLE "views" ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
