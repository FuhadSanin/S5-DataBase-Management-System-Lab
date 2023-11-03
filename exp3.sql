--------------------------------------------------------------GRANT / REVOKE-----------------------------------------------------------------

--Create and execute GRANT/REVOKE commands on tables?


CREATE USER 'newuser'@'localhost' IDENTIFIED BY 'newuser';
mysql -u newuser -p
USE library
--ERROR 1044 (42000): Access denied for user 'newuser'@'localhost' to database 'library'

--Granting access:-
mysql -u batch -p
GRANT ALL PRIVILEGES ON *.* TO 'newuser'@'localhost' WITH GRANT OPTION;


mysql -u newuser -p
USE library
/*	Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A


Database changed*/
SHOW tables;
/*
+-------------------+
| Tables_in_library |
+-------------------+
| author            |
| book_author       |
| book_issue        |
| book_return       |
| language          |
| member            |
| publisher         |
+-------------------+
*/


--Revoking:-
REVOKE ALL PRIVILEGES ON *.* FROM 'newuser'@'localhost';
SHOW GRANTS FOR 'newuser'@'localhost';
/*
+---------------------------------------------------------------+
| Grants for newuser@localhost                                  |
+---------------------------------------------------------------+
| GRANT USAGE ON *.* TO 'newuser'@'localhost' WITH GRANT OPTION |
+---------------------------------------------------------------+
*/


--------------------------------------------------------------IMPORT CSV FILE-----------------------------------------------------------------


--Learn and execute bulk import of data to tables from CSV files? 
--Using Mokaroo generate 1000 of dummy record by using AI

mysql -u batch -p
USE library

--To enable local infile
SET GLOBAL local_infile = 1;

--To remove the foreign key constraints
SET foreign_key_checks = 0;

--To load data from the file
LOAD DATA LOCAL INFILE '/home/s5d31/Downloads/MOCK_DATA(1).csv' INTO TABLE books FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

SELECT * FROM books;
/*
+---------+--------------------------+--------+----------------------+-----------+----------------+--------------+-----------+
| book_id | title                    | volume | status               | lang_id   | published_date | publisher_id | mrp       |
+---------+--------------------------+--------+----------------------+-----------+----------------+--------------+-----------+
|       1 | Action in the North      |      5 | available            | 680590013 | 0000-00-00     |            1 |        92 |
|       2 | "Quick and the Dead      |      0 | 4                    |         0 | 0000-00-00     |            5 |         2 |
|       3 | Fagbug                   |     10 | available            | 963618172 | 0000-00-00     |            3 |       769 |
|       4 | "Horrible Dr. Hichco     |      0 | 4                    |         0 | 0000-00-00     |           10 |         4 |
|       5 | Game Over: Kasparov      |      5 | available            | 100431284 | 0000-00-00     |            5 |       462 |
|       6 | King Solomon's Mines     |      8 | borrowed             | 970988414 | 0000-00-00     |            6 |       812 |
|       7 | "Moustache               |      0 | 6                    |         0 | 0000-00-00     |            4 |         7 |
|       8 | No Rest for the Brav     |      6 | available            | 856816907 | 0000-00-00     |            8 |       587 |
|       9 | My Man (Mon homme)       |      3 | available            | 407664869 | 0000-00-00     |            9 |        53 |
|      10 | Amar Akbar Anthony       |      9 | reserved             | 136637091 | 0000-00-00     |           10 |       203 |

						 ........................................
						 ........................................
						 ........................................

|     995 | "Wolfman                 |      0 | 3                    |         0 | 0000-00-00     |            9 |       995 |
|     996 | In This World            |      7 | reserved             | 555041123 | 0000-00-00     |          996 |        70 |
|     997 | Better Things            |      2 | borrowed             | 886869667 | 0000-00-00     |          997 |       383 |
|     998 | "Count Yorga             |      0 | 4                    |         0 | 0000-00-00     |           11 |       998 |
|     999 | Scarface                 |      7 | available            |  34771302 | 0000-00-00     |          999 |       294 |
|    1000 | Faithless                |      7 | borrowed             | 214247708 | 0000-00-00     |         1000 |       709 |
+---------+--------------------------+--------+----------------------+-----------+----------------+--------------+-----------+
*/




