-- Selezionare tutti gli studenti nati nel 1990 (160)

SELECT *
FROM `students`
WHERE `date_of_birth` LIKE "1990%";

-- Selezionare tutti i corsi che valgono più di 10 crediti (479)

SELECT *
FROM `courses`
WHERE `cfu` > 10;

-- Selezionare tutti gli studenti che hanno più di 30 anni

SELECT *
FROM `students`
WHERE YEAR(FROM_DAYS(DATEDIFF(CURDATE(),`date_of_birth`))) > 30;

-- Selezionare tutti i corsi del primo semestre del primo anno di un qualsiasi corso di laurea (286)
 
SELECT *
FROM `courses`
WHERE `year` = 1 AND `period` LIKE "I %";

-- Selezionare tutti gli appelli d'esame che avvengono nel pomeriggio (dopo le 14) del 20/06/2020 (21)

SELECT *
FROM `exams`
WHERE `date` = "2020-06-20" AND `hour` > "14:00:00";

-- Selezionare tutti i corsi di laurea magistrale (38)

SELECT *
FROM `degrees`
WHERE `level` = "magistrale";

-- Da quanti dipartimenti è composta l'università? (12)

SELECT COUNT(`id`)
FROM `departments`;

-- Quanti sono gli insegnanti che non hanno un numero di telefono? (50)

SELECT COUNT(`id`)
FROM `teachers`
WHERE `phone` IS NULL;

-- Inserire nella tabella degli studenti un nuovo record con i propri dati (per il campo degree_id, inserire un valore casuale)

INSERT INTO `students` (`degree_id`, `name`, `surname`, `date_of_birth`, `fiscal_code`, `enrolment_date`, `registration_number`, `email`)
VALUES (FLOOR(RAND()*100), "Armando", "Truglio", "1999-09-24", "TRGRND96P12F167D", "2019-10-1", "625033", "armandotruglio@gmail.com");

-- Cambiare il numero dell’ufficio del professor Pietro Rizzo in 126

UPDATE `teachers`
SET `office_number` = 126
WHERE `name` = "Pietro" AND `surname` = "Rizzo";

-- Eliminare dalla tabella studenti il record creato precedentemente al punto 9

DELETE FROM `students`
WHERE `fiscal_code` = "TRGRND96P12F167D";


