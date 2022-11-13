-- Select all tutors that have a date of birth between 1/1/1985 and 31/12/1999. 
-- Order by forename, surname (both ascending) and date of birth (most recent first)

select
  *
from
  tblTutor
where
  dateOfBirth >= date('1985-01-01') and
  dateOfBirth <= date('1999-12-31')
order by
  forename,
  surname,
  dateOfBirth desc

-- Select the individual test results.
-- Include the subject name and percentage scored.
-- Order by subject name and percentage score both ascending.

select
  s.title,
  r.student,
  r.percentageScore
from
  tblTestResults r join
  tblSubject s on r.subject = s.idx
order by
  s.title,
  r.percentageScore

-- Select the total percentage scored for each subject where the student has scored in excess of 60%

select
  subject,
  sum(percentageScore)
from
  tblTestResults
where
  percentageScore > 60
group by
  subject

-- As indicated beside the tblTutor data, a number of tutors teach multiple subjects.
-- Create a new table that allows for the many-to-many relationship and populate it with the appropriate data.
-- Either show the data that should be included in the table or, preferably, write the SQL scripts to create and populate the table.

create table tblTutorSubject (
	tutor	integer not null,
	subject	integer not null,
	unique(tutor, subject)
)

insert into tblTutorSubject(tutor, subject) values (1, 2);
insert into tblTutorSubject(tutor, subject) values (1, 3);
insert into tblTutorSubject(tutor, subject) values (2, 1);
insert into tblTutorSubject(tutor, subject) values (3, 3);
insert into tblTutorSubject(tutor, subject) values (5, 1);
insert into tblTutorSubject(tutor, subject) values (5, 2);
insert into tblTutorSubject(tutor, subject) values (6, 1);
insert into tblTutorSubject(tutor, subject) values (6, 2);
insert into tblTutorSubject(tutor, subject) values (6, 3);
insert into tblTutorSubject(tutor, subject) values (8, 1);
insert into tblTutorSubject(tutor, subject) values (8, 4);
insert into tblTutorSubject(tutor, subject) values (9, 4);
insert into tblTutorSubject(tutor, subject) values (10, 1);
insert into tblTutorSubject(tutor, subject) values (10, 2);
insert into tblTutorSubject(tutor, subject) values (10, 3);
insert into tblTutorSubject(tutor, subject) values (10, 4);

-- Using the new table, select a full list of tutors and subjects that they teach.
-- Include tutors that do not teach any subjects.

select
  t.forename,
  t.surname,
  s.title
from
  tblTutor t left join
  tblTutorSubject ts on t.idx = ts.tutor left join
  tblSubject s on ts.subject = s.idx

-- Using the new table, select all tutors that teach the subject entitled 'Maths' (assume that you have no knowledge of the subject indexes)

select
  t.forename,
  t.surname
from
  tblTutor t join
  tblTutorSubject ts on t.idx = ts.tutor join
  tblSubject s on ts.subject = s.idx
where
  s.title = 'Maths'

-- Select the total percentage scored in Maths where the tutor's name is Lisa Holland (again, assume that you have no knowledge of subject or tutor indexes)

select
  sum(r.percentageScore)
from
  tblTutor t join
  tblTutorSubject ts on t.idx = ts.tutor join
  tblTestResults r on r.subject = s.idx join
  tblSubject s on ts.subject = s.idx
where
  t.forename = 'Lisa' and
  t.surname = 'Holland' and
  s.title = 'Maths'

-- Write an SQL script (or scripts) to update the data so that Sally Thompson now teaches Geography in addition to History
-- (use the name and subject title in the update command – do not assume that indexes are known).

insert into tblTutorSubject (tutor, subject) values (
  (select idx from tblTutor where forename = 'Sally' and surname = 'Thompson'),
  (select idx from tblSubject where title = 'Geography')
)

-- Write an SQL script (or scripts) to update the data so that Fred Bloggs no longer teaches History (use the name and subject title in the update command – do not assume that indexes are known).

delete
from
  tblTutorSubject 
where
  tutor = (select idx from tblTutor where forename = 'Fred' and surname = 'Bloggs') and
  subejct = (select idx from tblSubject where title = 'History')

-- Select each subject where the average percentage score is > 75%. Include the subject title and average percentage score.
-- Order by descending average percentage score.

select
  s.title,
  avg(percentageScore) score
from
  tblTestResults r join
  tblSubject s on r.subject = s.idx
group by
  s.title
having
  avg(percentageScore) > 75
order by
  score

-- Delete all records from tblTestResults where the subject is 'Maths' (use the subject title in the deletion command) and the percentage score is less than 40%.

delete
  r
from
	tblTestResults r join
	tblSubject s on r.subject = s.idx
where
  r.percentageScore < 40 and
  s.title = 'Maths'

-- Select the average percentage for each subject from the remaining tblTestResults records showing the subject name and average percentage.
-- Order by average percentage score descending.

select
	s.title,
	avg(r.percentageScore) score
from
	tblTestResults r join
	tblSubject s on r.subject = s.idx
  group by
    s.title
order by
  score desc


