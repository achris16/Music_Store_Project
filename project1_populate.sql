INSERT INTO MUSICIAN VALUES ('123-45-6789', 'John Doe', '1234 Apple St. Glendale, CA 91208', '818-867-5309');
INSERT INTO MUSICIAN VALUES ('123-55-9999', 'Jane Doe', '1234 Apple St. Glendale, CA 91208', '818-555-5555');
INSERT INTO MUSICIAN VALUES ('987-65-4321', 'Bob Smith', '1111 Pear St. Pasadena, CA 91101', '626-867-5309');

INSERT INTO ALBUM VALUES (1, 'John and Jane Collection', '01/20/2001', 'CD', 'NTR1', '123-55-9999');
INSERT INTO ALBUM VALUES (2, 'John Live in Concert', '03/18/2003', 'MC', 'NTR2', '123-45-6789');
INSERT INTO ALBUM VALUES (3, 'John and Bob Sounds of The Future', '11/27/2005', 'CD', 'NTR3', '987-65-4321');
INSERT INTO ALBUM VALUES (4, 'Riding Rockets', '11/27/2006', 'CD', 'NTR4', '123-55-9999');

INSERT INTO SONG VALUES ('Happy Days', 'John', 1);
INSERT INTO SONG VALUES ('Needle and Thread', 'John', 1);
INSERT INTO SONG VALUES ('Late Nights', 'Jane', 1);
INSERT INTO SONG VALUES ('Fast Times', 'Jane', 1);
INSERT INTO SONG VALUES ('Old Man and The Sea', 'John', 1);
INSERT INTO SONG VALUES ('Stormy Weather', 'John', 1);
INSERT INTO SONG VALUES ('Happy Days (Live)', 'John', 2);
INSERT INTO SONG VALUES ('Needle and Thread (Live)', 'John', 2);
INSERT INTO SONG VALUES ('Stormy Weather (Live)', 'John', 2);
INSERT INTO SONG VALUES ('Old Man and The Sea (Live)', 'John', 2);
INSERT INTO SONG VALUES ('Everything is Chrome', 'John', 3);
INSERT INTO SONG VALUES ('Into the Abyss', 'John', 3);
INSERT INTO SONG VALUES ('Flying Cars', 'Bob', 3);
INSERT INTO SONG VALUES ('Lost in Orbit', 'Bob', 3);
INSERT INTO SONG VALUES ('LAZERS!', 'Bob', 3);
INSERT INTO SONG VALUES ('Up Up and Away', 'Bob', 4);
INSERT INTO SONG VALUES ('Planets', 'Bob', 4);
INSERT INTO SONG VALUES ('Space n Stuff', 'Bob', 4);
INSERT INTO SONG VALUES ('LAZERS! (Remastered)', 'Bob', 4);
INSERT INTO SONG VALUES ('LAZERS! Pt2.', 'Bob', 4);

INSERT INTO INSTRUMENT VALUES (1, 'Electric Guitar #1', 'A');
INSERT INTO INSTRUMENT VALUES (2, 'Electric Guitar #2', 'C-Flat');
INSERT INTO INSTRUMENT VALUES (3, 'Synth #1', 'A-Flat');
INSERT INTO INSTRUMENT VALUES (4, 'Synth #2', 'F-Sharp');
INSERT INTO INSTRUMENT VALUES (5, 'Piano', 'C-Sharp');
INSERT INTO INSTRUMENT VALUES (6, 'Drum Machine #1', 'C-Sharp');
INSERT INTO INSTRUMENT VALUES (7, 'Drum Machine #2', 'A');

INSERT INTO PLAYS VALUES ('123-45-6789', 1);
INSERT INTO PLAYS VALUES ('123-45-6789', 2);
INSERT INTO PLAYS VALUES ('123-55-9999', 3);
INSERT INTO PLAYS VALUES ('123-55-9999', 5);
INSERT INTO PLAYS VALUES ('987-65-4321', 2);
INSERT INTO PLAYS VALUES ('987-65-4321', 3);
INSERT INTO PLAYS VALUES ('987-65-4321', 4);
INSERT INTO PLAYS VALUES ('987-65-4321', 7);

INSERT INTO PERFORMS VALUES ('123-45-6789', 'Happy Days');
INSERT INTO PERFORMS VALUES ('123-55-9999', 'Happy Days');
INSERT INTO PERFORMS VALUES ('123-45-6789', 'Needle and Thread');
INSERT INTO PERFORMS VALUES ('123-45-6789', 'Late Nights');
INSERT INTO PERFORMS VALUES ('123-55-9999', 'Late Nights');
INSERT INTO PERFORMS VALUES ('123-55-9999', 'Fast Times');
INSERT INTO PERFORMS VALUES ('123-45-6789', 'Old Man and The Sea');
INSERT INTO PERFORMS VALUES ('123-45-6789', 'Stormy Weather');
INSERT INTO PERFORMS VALUES ('123-55-9999', 'Stormy Weather');
INSERT INTO PERFORMS VALUES ('123-45-6789', 'Happy Days (Live)');
INSERT INTO PERFORMS VALUES ('123-45-6789', 'Needle and Thread (Live)');
INSERT INTO PERFORMS VALUES ('123-45-6789', 'Stormy Weather (Live)');
INSERT INTO PERFORMS VALUES ('123-45-6789', 'Old Man and The Sea (Live)');
INSERT INTO PERFORMS VALUES ('123-45-6789', 'Everything is Chrome');
INSERT INTO PERFORMS VALUES ('987-65-4321', 'Everything is Chrome');
INSERT INTO PERFORMS VALUES ('123-45-6789', 'Into the Abyss');
INSERT INTO PERFORMS VALUES ('987-65-4321', 'Into the Abyss');
INSERT INTO PERFORMS VALUES ('987-65-4321', 'Flying Cars');
INSERT INTO PERFORMS VALUES ('123-45-6789', 'Flying Cars');
INSERT INTO PERFORMS VALUES ('987-65-4321', 'Lost in Orbit');
INSERT INTO PERFORMS VALUES ('123-45-6789', 'Lost in Orbit');
INSERT INTO PERFORMS VALUES ('987-65-4321', 'LAZERS!');
INSERT INTO PERFORMS VALUES ('987-65-4321', 'Up Up and Away');
INSERT INTO PERFORMS VALUES ('987-65-4321', 'Planets');
INSERT INTO PERFORMS VALUES ('987-65-4321', 'Space n Stuff');
INSERT INTO PERFORMS VALUES ('987-65-4321', 'LAZERS! (Remastered)');
INSERT INTO PERFORMS VALUES ('987-65-4321', 'LAZERS! Pt2.');

