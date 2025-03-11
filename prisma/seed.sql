-- Seed data for Teacher Ranker Database

-- First, delete all existing data (in reverse order of dependencies)
DELETE FROM "professor_tag";
DELETE FROM "professor_course";
DELETE FROM "professor_faculty";
DELETE FROM "professor_university";
DELETE FROM "reviews";
DELETE FROM "tags";
DELETE FROM "administrators";
DELETE FROM "users";
DELETE FROM "professors";
DELETE FROM "courses";
DELETE FROM "faculties";
DELETE FROM "universities";

-- Reset sequences
ALTER SEQUENCE "universities_ID_University_seq" RESTART WITH 1;
ALTER SEQUENCE "faculties_ID_Faculty_seq" RESTART WITH 1;
ALTER SEQUENCE "courses_ID_Course_seq" RESTART WITH 1;
ALTER SEQUENCE "professors_ID_Professor_seq" RESTART WITH 1;
ALTER SEQUENCE "tags_ID_Tag_seq" RESTART WITH 1;
ALTER SEQUENCE "users_ID_User_seq" RESTART WITH 1;
ALTER SEQUENCE "administrators_ID_Admin_seq" RESTART WITH 1;
ALTER SEQUENCE "reviews_ID_Review_seq" RESTART WITH 1;

-- Universities
INSERT INTO "universities" ("ID_University", "name", "acronym", "location", "department", "totalProfessorsCount", "generalAverageRating")
VALUES
  (1, 'Massachusetts Institute of Technology', 'MIT', 'Cambridge, MA', 'Engineering', 0, 0),
  (2, 'Stanford University', 'Stanford', 'Stanford, CA', 'Computer Science', 0, 0),
  (3, 'Harvard University', 'Harvard', 'Cambridge, MA', 'Business', 0, 0),
  (4, 'University of California, Berkeley', 'UC Berkeley', 'Berkeley, CA', 'Sciences', 0, 0),
  (5, 'University of Oxford', 'Oxford', 'Oxford, UK', 'Humanities', 0, 0);

-- Faculties
INSERT INTO "faculties" ("ID_Faculty", "name", "universityId")
VALUES
  (1, 'Computer Science', 1),
  (2, 'Electrical Engineering', 1),
  (3, 'Business Administration', 3),
  (4, 'Physics', 4),
  (5, 'Mathematics', 2),
  (6, 'Philosophy', 5),
  (7, 'Biology', 4),
  (8, 'Economics', 3);

-- Courses
INSERT INTO "courses" ("ID_Course", "name")
VALUES
  (1, 'Introduction to Programming'),
  (2, 'Data Structures and Algorithms'),
  (3, 'Machine Learning'),
  (4, 'Artificial Intelligence'),
  (5, 'Database Systems'),
  (6, 'Web Development'),
  (7, 'Quantum Physics'),
  (8, 'Microeconomics'),
  (9, 'Business Ethics'),
  (10, 'Calculus I');

-- Professors
INSERT INTO "professors" ("ID_Professor", "fullName", "averageRating", "reviewCount")
VALUES
  (1, 'John Smith', 4.5, 3),
  (2, 'Maria Garcia', 4.8, 5),
  (3, 'Robert Johnson', 3.9, 2),
  (4, 'Sarah Williams', 4.2, 4),
  (5, 'David Brown', 3.5, 3),
  (6, 'Jennifer Davis', 4.7, 6),
  (7, 'Michael Miller', 4.0, 4),
  (8, 'Elizabeth Wilson', 4.3, 3),
  (9, 'James Taylor', 3.8, 2),
  (10, 'Patricia Martinez', 4.6, 5);

-- Tags
INSERT INTO "tags" ("ID_Tag", "name", "type")
VALUES
  (1, 'Clear Explanations', 'professor'),
  (2, 'Engaging Lectures', 'professor'),
  (3, 'Fair Grading', 'professor'),
  (4, 'Helpful Feedback', 'professor'),
  (5, 'Challenging', 'course'),
  (6, 'Practical Applications', 'course'),
  (7, 'Well Organized', 'professor'),
  (8, 'Approachable', 'professor'),
  (9, 'Heavy Workload', 'course'),
  (10, 'Inspiring', 'professor');

-- Users
INSERT INTO "users" ("ID_User", "fullName", "username", "email", "password", "createdAt", "verificationStatus", "accountStatus", "universityId")
VALUES
  (1, 'Alex Johnson', 'alexj', 'alex.johnson@example.com', '$2a$10$xJwRMXQNCYTIxpQpKexyL.C7YwEXLjS2h8QVKGUvK4SCnTYtOPUFS', '2023-01-15T08:30:00Z', true, 'active', 1),
  (2, 'Emma Davis', 'emmad', 'emma.davis@example.com', '$2a$10$LKJFDSALKJFDSALKJFDSALKJFDSALKJFDSALKJFDSALKJFDSALKJFDSa', '2023-02-20T10:15:00Z', true, 'active', 2),
  (3, 'Carlos Rodriguez', 'carlosr', 'carlos.rodriguez@example.com', '$2a$10$LKJFDSALKJFDSALKJFDSALKJFDSALKJFDSALKJFDSALKJFDSALKJFDSB', '2023-03-05T14:45:00Z', true, 'active', 3),
  (4, 'Sophie Martin', 'sophiem', 'sophie.martin@example.com', '$2a$10$LKJFDSALKJFDSALKJFDSALKJFDSALKJFDSALKJFDSALKJFDSALKJFDSc', '2023-04-10T09:20:00Z', true, 'active', 4),
  (5, 'Daniel Kim', 'danielk', 'daniel.kim@example.com', '$2a$10$LKJFDSALKJFDSALKJFDSALKJFDSALKJFDSALKJFDSALKJFDSALKJFDSd', '2023-05-15T11:30:00Z', true, 'active', 5),
  (6, 'Olivia Wilson', 'oliviaw', 'olivia.wilson@example.com', '$2a$10$LKJFDSALKJFDSALKJFDSALKJFDSALKJFDSALKJFDSALKJFDSALKJFDSe', '2023-06-20T16:10:00Z', true, 'active', 1),
  (7, 'Lucas Brown', 'lucasb', 'lucas.brown@example.com', '$2a$10$LKJFDSALKJFDSALKJFDSALKJFDSALKJFDSALKJFDSALKJFDSALKJFDSf', '2023-07-25T13:45:00Z', true, 'active', 2),
  (8, 'Isabella Garcia', 'isabellag', 'isabella.garcia@example.com', '$2a$10$LKJFDSALKJFDSALKJFDSALKJFDSALKJFDSALKJFDSALKJFDSALKJFDSg', '2023-08-30T10:20:00Z', true, 'active', 3),
  (9, 'Ethan Taylor', 'ethant', 'ethan.taylor@example.com', '$2a$10$LKJFDSALKJFDSALKJFDSALKJFDSALKJFDSALKJFDSALKJFDSALKJFDSh', '2023-09-05T15:30:00Z', true, 'active', 4),
  (10, 'Mia Anderson', 'miaa', 'mia.anderson@example.com', '$2a$10$LKJFDSALKJFDSALKJFDSALKJFDSALKJFDSALKJFDSALKJFDSALKJFDSi', '2023-10-10T12:15:00Z', true, 'active', 5);

-- Administrators
INSERT INTO "administrators" ("ID_Admin", "username", "password", "accessLevel")
VALUES
  (1, 'admin1', '$2a$10$xJwRMXQNCYTIxpQpKexyL.C7YwEXLjS2h8QVKGUvK4SCnTYtOPUFS', 'superadmin'),
  (2, 'admin2', '$2a$10$LKJFDSALKJFDSALKJFDSALKJFDSALKJFDSALKJFDSALKJFDSALKJFDSj', 'normal');

-- Professor-University Relations
INSERT INTO "professor_university" ("professorId", "universityId")
VALUES
  (1, 1),
  (2, 2),
  (3, 3),
  (4, 4),
  (5, 5),
  (6, 1),
  (7, 2),
  (8, 3),
  (9, 4),
  (10, 5),
  (1, 3),  -- Some professors belong to multiple universities
  (3, 5),
  (5, 2);

-- Professor-Faculty Relations
INSERT INTO "professor_faculty" ("professorId", "facultyId")
VALUES
  (1, 1),
  (2, 2),
  (3, 3),
  (4, 4),
  (5, 5),
  (6, 6),
  (7, 7),
  (8, 8),
  (9, 1),
  (10, 2),
  (1, 5),  -- Some professors belong to multiple faculties
  (3, 8),
  (5, 4);

-- Professor-Course Relations
INSERT INTO "professor_course" ("professorId", "courseId")
VALUES
  (1, 1),
  (1, 2),
  (2, 3),
  (3, 4),
  (4, 5),
  (5, 6),
  (6, 7),
  (7, 8),
  (8, 9),
  (9, 10),
  (10, 1),
  (2, 5),
  (3, 9),
  (4, 2),
  (5, 3);

-- Professor-Tag Relations
INSERT INTO "professor_tag" ("professorId", "tagId")
VALUES
  (1, 1),
  (1, 2),
  (2, 3),
  (2, 4),
  (3, 7),
  (4, 8),
  (5, 1),
  (6, 2),
  (7, 3),
  (8, 4),
  (9, 7),
  (10, 8);

-- Reviews
INSERT INTO "reviews" ("ID_Review", "overallRating", "teachingQuality", "difficultyLevel", "mandatoryAttendance", "classInterest", "detailedComment", "gradeObtained", "createdAt", "visibilityStatus", "reportStatus", "userId", "professorId", "courseId")
VALUES
  (1, 4.5, 4.7, 3.8, true, 4.6, 'Excellent professor who explains complex concepts clearly. Very engaging lectures and always available for questions.', 'A', '2023-02-15T09:30:00Z', 'visible', 'normal', 1, 1, 1),
  (2, 4.8, 4.9, 4.2, false, 4.7, 'One of the best professors I''ve had. Makes the subject interesting and provides great real-world examples.', 'A+', '2023-03-20T14:15:00Z', 'visible', 'normal', 2, 2, 3),
  (3, 3.9, 3.7, 4.5, true, 3.8, 'Challenging course but the professor is fair. Lectures can be dry sometimes but the content is valuable.', 'B+', '2023-04-10T11:45:00Z', 'visible', 'normal', 3, 3, 4),
  (4, 4.2, 4.3, 3.5, false, 4.4, 'Very knowledgeable professor who is passionate about the subject. Assignments are reasonable and helpful.', 'A-', '2023-05-05T10:20:00Z', 'visible', 'normal', 4, 4, 5),
  (5, 3.5, 3.3, 4.8, true, 3.4, 'Extremely difficult course with high expectations. The professor knows the material well but could improve teaching methods.', 'B-', '2023-06-15T16:30:00Z', 'visible', 'normal', 5, 5, 6),
  (6, 4.7, 4.8, 3.6, false, 4.9, 'Fantastic professor who makes learning enjoyable. Clear explanations and always willing to help students.', 'A', '2023-07-20T13:10:00Z', 'visible', 'normal', 6, 6, 7),
  (7, 4.0, 4.1, 4.0, true, 3.9, 'Good balance of theory and practical applications. The professor provides helpful feedback on assignments.', 'B+', '2023-08-25T09:45:00Z', 'visible', 'normal', 7, 7, 8),
  (8, 4.3, 4.5, 3.7, false, 4.2, 'Engaging lectures and well-organized course materials. The professor is approachable and responsive to questions.', 'A-', '2023-09-10T15:20:00Z', 'visible', 'normal', 8, 8, 9),
  (9, 3.8, 3.6, 4.3, true, 3.7, 'Challenging but rewarding course. The professor has high standards but is fair in grading.', 'B', '2023-10-15T11:30:00Z', 'visible', 'normal', 9, 9, 10),
  (10, 4.6, 4.7, 3.9, false, 4.8, 'Excellent teaching style that makes complex topics accessible. The professor is passionate and inspiring.', 'A', '2023-11-20T14:15:00Z', 'visible', 'normal', 10, 10, 1);

-- Update professor ratings based on reviews
UPDATE "professors" 
SET "averageRating" = (
  SELECT AVG("overallRating") 
  FROM "reviews" 
  WHERE "reviews"."professorId" = "professors"."ID_Professor"
),
"reviewCount" = (
  SELECT COUNT(*) 
  FROM "reviews" 
  WHERE "reviews"."professorId" = "professors"."ID_Professor"
);

-- Update university ratings based on professor ratings
UPDATE "universities"
SET "generalAverageRating" = (
  SELECT AVG(p."averageRating")
  FROM "professors" p
  JOIN "professor_university" pu ON p."ID_Professor" = pu."professorId"
  WHERE pu."universityId" = "universities"."ID_University"
),
"totalProfessorsCount" = (
  SELECT COUNT(DISTINCT pu."professorId")
  FROM "professor_university" pu
  WHERE pu."universityId" = "universities"."ID_University"
); 