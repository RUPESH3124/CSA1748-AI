% Facts: teacher(Teacher, SubjectCode).
teacher(mr_smith, cs101).
teacher(ms_jones, cs102).
teacher(mr_williams, cs103).

% Facts: student(Student, SubjectCode).
student(john, cs101).
student(charan, cs101).
student(kalyan, cs102).


% Rule to find which teacher teaches a student.
teaches_teacher(Student, Teacher) :-
    student(Student, SubjectCode),
    teacher(Teacher, SubjectCode).

% Rule to find the subject a teacher is teaching to a student.
teaches_subject(Student, SubjectCode) :-
    student(Student, SubjectCode),
    teacher(_, SubjectCode).

% Rule to get all students taught by a particular teacher.
students_of_teacher(Teacher, Student) :-
    teacher(Teacher, SubjectCode),
    student(Student, SubjectCode).
