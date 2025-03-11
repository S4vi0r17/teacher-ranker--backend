-- CreateTable
CREATE TABLE "users" (
    "ID_User" SERIAL NOT NULL,
    "fullName" TEXT NOT NULL,
    "username" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "verificationStatus" BOOLEAN NOT NULL DEFAULT false,
    "accountStatus" TEXT NOT NULL DEFAULT 'active',
    "universityId" INTEGER,

    CONSTRAINT "users_pkey" PRIMARY KEY ("ID_User")
);

-- CreateTable
CREATE TABLE "professors" (
    "ID_Professor" SERIAL NOT NULL,
    "fullName" TEXT NOT NULL,
    "averageRating" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "reviewCount" INTEGER NOT NULL DEFAULT 0,

    CONSTRAINT "professors_pkey" PRIMARY KEY ("ID_Professor")
);

-- CreateTable
CREATE TABLE "universities" (
    "ID_University" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "acronym" TEXT,
    "location" TEXT,
    "department" TEXT,
    "totalProfessorsCount" INTEGER NOT NULL DEFAULT 0,
    "generalAverageRating" DOUBLE PRECISION NOT NULL DEFAULT 0,

    CONSTRAINT "universities_pkey" PRIMARY KEY ("ID_University")
);

-- CreateTable
CREATE TABLE "faculties" (
    "ID_Faculty" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "universityId" INTEGER NOT NULL,

    CONSTRAINT "faculties_pkey" PRIMARY KEY ("ID_Faculty")
);

-- CreateTable
CREATE TABLE "courses" (
    "ID_Course" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "courses_pkey" PRIMARY KEY ("ID_Course")
);

-- CreateTable
CREATE TABLE "reviews" (
    "ID_Review" SERIAL NOT NULL,
    "overallRating" DOUBLE PRECISION NOT NULL,
    "teachingQuality" DOUBLE PRECISION NOT NULL,
    "difficultyLevel" DOUBLE PRECISION NOT NULL,
    "mandatoryAttendance" BOOLEAN NOT NULL,
    "classInterest" DOUBLE PRECISION NOT NULL,
    "detailedComment" TEXT,
    "gradeObtained" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "visibilityStatus" TEXT NOT NULL DEFAULT 'visible',
    "reportStatus" TEXT NOT NULL DEFAULT 'normal',
    "userId" INTEGER NOT NULL,
    "professorId" INTEGER NOT NULL,
    "courseId" INTEGER NOT NULL,

    CONSTRAINT "reviews_pkey" PRIMARY KEY ("ID_Review")
);

-- CreateTable
CREATE TABLE "administrators" (
    "ID_Admin" SERIAL NOT NULL,
    "username" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "accessLevel" TEXT NOT NULL DEFAULT 'normal',

    CONSTRAINT "administrators_pkey" PRIMARY KEY ("ID_Admin")
);

-- CreateTable
CREATE TABLE "tags" (
    "ID_Tag" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "type" TEXT NOT NULL,

    CONSTRAINT "tags_pkey" PRIMARY KEY ("ID_Tag")
);

-- CreateTable
CREATE TABLE "professor_university" (
    "professorId" INTEGER NOT NULL,
    "universityId" INTEGER NOT NULL,

    CONSTRAINT "professor_university_pkey" PRIMARY KEY ("professorId","universityId")
);

-- CreateTable
CREATE TABLE "professor_faculty" (
    "professorId" INTEGER NOT NULL,
    "facultyId" INTEGER NOT NULL,

    CONSTRAINT "professor_faculty_pkey" PRIMARY KEY ("professorId","facultyId")
);

-- CreateTable
CREATE TABLE "professor_course" (
    "professorId" INTEGER NOT NULL,
    "courseId" INTEGER NOT NULL,

    CONSTRAINT "professor_course_pkey" PRIMARY KEY ("professorId","courseId")
);

-- CreateTable
CREATE TABLE "professor_tag" (
    "professorId" INTEGER NOT NULL,
    "tagId" INTEGER NOT NULL,

    CONSTRAINT "professor_tag_pkey" PRIMARY KEY ("professorId","tagId")
);

-- CreateIndex
CREATE UNIQUE INDEX "users_username_key" ON "users"("username");

-- CreateIndex
CREATE UNIQUE INDEX "users_email_key" ON "users"("email");

-- CreateIndex
CREATE UNIQUE INDEX "reviews_userId_professorId_key" ON "reviews"("userId", "professorId");

-- CreateIndex
CREATE UNIQUE INDEX "administrators_username_key" ON "administrators"("username");

-- CreateIndex
CREATE UNIQUE INDEX "tags_name_key" ON "tags"("name");

-- AddForeignKey
ALTER TABLE "users" ADD CONSTRAINT "users_universityId_fkey" FOREIGN KEY ("universityId") REFERENCES "universities"("ID_University") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "faculties" ADD CONSTRAINT "faculties_universityId_fkey" FOREIGN KEY ("universityId") REFERENCES "universities"("ID_University") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "reviews" ADD CONSTRAINT "reviews_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("ID_User") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "reviews" ADD CONSTRAINT "reviews_professorId_fkey" FOREIGN KEY ("professorId") REFERENCES "professors"("ID_Professor") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "reviews" ADD CONSTRAINT "reviews_courseId_fkey" FOREIGN KEY ("courseId") REFERENCES "courses"("ID_Course") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "professor_university" ADD CONSTRAINT "professor_university_professorId_fkey" FOREIGN KEY ("professorId") REFERENCES "professors"("ID_Professor") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "professor_university" ADD CONSTRAINT "professor_university_universityId_fkey" FOREIGN KEY ("universityId") REFERENCES "universities"("ID_University") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "professor_faculty" ADD CONSTRAINT "professor_faculty_professorId_fkey" FOREIGN KEY ("professorId") REFERENCES "professors"("ID_Professor") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "professor_faculty" ADD CONSTRAINT "professor_faculty_facultyId_fkey" FOREIGN KEY ("facultyId") REFERENCES "faculties"("ID_Faculty") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "professor_course" ADD CONSTRAINT "professor_course_professorId_fkey" FOREIGN KEY ("professorId") REFERENCES "professors"("ID_Professor") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "professor_course" ADD CONSTRAINT "professor_course_courseId_fkey" FOREIGN KEY ("courseId") REFERENCES "courses"("ID_Course") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "professor_tag" ADD CONSTRAINT "professor_tag_professorId_fkey" FOREIGN KEY ("professorId") REFERENCES "professors"("ID_Professor") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "professor_tag" ADD CONSTRAINT "professor_tag_tagId_fkey" FOREIGN KEY ("tagId") REFERENCES "tags"("ID_Tag") ON DELETE RESTRICT ON UPDATE CASCADE;
