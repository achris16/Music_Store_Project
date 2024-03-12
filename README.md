# Music Store Project 

This Java project is a small CLI interactive program that allows users for "Notown Records" to create various data types in the database instance according to the rules in the prompt. For the database in this project we used postgresql.

To run the code you must first run project1.sql to create the schemas. You can also run project1_populate.sql to insert sample data into the database. You will also need to create the triggers using the trigger*.sql files.

Once all of this is set up, replace the database URL, username, and password in Project1.java. Now you can compile and run your Java program.

Note: you will need to include the postgresql-42.5.1.jar in your class path to run this program
https://jdbc.postgresql.org/download/postgresql-42.5.1.jar


## Prompt
Please design and implement the following university database application:

Notown Records has decided to store information about musicians who perform on its albums (as well as other company data) in a database. The company has wisely chosen to hire you as a database designer (at your usual consulting fee of $2500/day).
- Each musician that records at Notown has an SSN, a name, an address, and a phone number. Poorly paid musicians often share the same address, and no address has more than one phone.
- Each instrument used in songs recorded at Notown has a unique identification number, a name (e.g.,
guitar, synthesizer, flute) and a musical key (e.g., C, B- flat, E-flat).
- Each album recorded on the Notown label has a unique identification number, a title, a copyright date, a format (e.g., CD or MC), and an album identifier. - Each song recorded at Notown has a title and an author.
- Each musician may play several instruments, and a
given instrument may be played by several musicians. - Each album has a number of songs on it, but no song may appear on more than one album.
- Each song is performed by one or more musicians,
and a musician may perform a number of songs.
- Each album has exactly one musician who acts as its
producer. A musician may produce several albums, of
course.