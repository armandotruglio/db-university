-- 1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia

SELECT * 
FROM `students`
JOIN `degrees` ON `degree_id` = `degrees`.`id`
WHERE `degrees`.`name` = "Corso di Laurea in Economia";

-- 2. Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento di Neuroscienze

SELECT *
FROM `degrees`
JOIN `departments` ON `department_id` = `departments`.`id`
WHERE `departments`.`name` = "Dipartimento di Neuroscienze";

-- 3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)

SELECT *
FROM `courses`
JOIN `course_teacher` ON `id` = `course_teacher`.`course_id`
JOIN `teachers` ON `course_teacher`.`teacher_id` = `teachers`.`id`
WHERE `teachers`.`id` = 44;

-- 4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti 
-- e il relativo dipartimento, in ordine alfabetico per cognome e nome

SELECT *
FROM `students`
JOIN `degrees` ON `degree_id` = `degrees`.`id`
JOIN `departments` ON `degrees`.`department_id` = `departments`.`id`
WHERE `degree_id` IS NOT NULL
ORDER BY `students`.`surname` ASC, `students`.`name` ASC;

-- 5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti

SELECT *
FROM `degrees`
JOIN `courses` ON `degrees`.`id` = `courses`.`degree_id`
JOIN `course_teacher` ON `courses`.`id` = `course_teacher`.`course_id`
JOIN `teachers` ON `course_teacher`.`teacher_id` = `teachers`.`id`;

-- 6. Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)

SELECT `teachers`.`id`, `teachers`.`name`, `teachers`.`surname`, `teachers`.`phone`, 
`teachers`.`email`, `teachers`.`office_address`, `teachers`.`office_number`
FROM `teachers`
JOIN `course_teacher` ON `teachers`.`id` = `course_teacher`.`teacher_id`
JOIN `courses` ON `course_teacher`.`course_id` = `courses`.`id`
JOIN `degrees` ON `courses`.`degree_id` = `degrees`.`id`
JOIN `departments` ON `degrees`.`department_id` = `departments`.`id`
WHERE `departments`.`name`  = "Dipartimento di Matematica"
GROUP BY `teachers`.`id`;

-- 7. BONUS: Selezionare per ogni studente il numero di tentativi sostenuti per ogni esame, 
-- stampando anche il voto massimo. Successivamente, filtrare i tentativi con voto minimo 18.