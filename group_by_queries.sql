-- Contare quanti iscritti ci sono stati ogni anno

SELECT COUNT(`id`) as `enrolled_students`, YEAR(`enrolment_date`) as `year`
FROM `students`
GROUP BY YEAR(`enrolment_date`);

-- Contare gli insegnanti che hanno l'ufficio nello stesso edificio

SELECT COUNT(`id`) as `teachers`, `office_address` as `address`
FROM `teachers`
GROUP BY `office_address`;

-- Calcolare la media dei voti di ogni appello d'esame

SELECT AVG(`vote`) as `average`, `exam_id`
FROM `exam_student`
GROUP BY `exam_id`;

--Contare quanti corsi di laurea ci sono per ogni dipartimento

SELECT COUNT(`id`) as `courses`, `department_id`
FROM `degrees`
GROUP BY `department_id`; 