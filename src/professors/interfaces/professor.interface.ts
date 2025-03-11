/**
 * Interfaz que representa un profesor con sus relaciones
 * Esta interfaz se usa para tipar los resultados de las consultas a Prisma
 */
export interface ProfessorWithRelations {
  id: number;
  fullName: string;
  averageRating: number;
  reviewCount: number;
  universities: UniversityRelation[];
  faculties: FacultyRelation[];
  courses?: CourseRelation[];
  tags?: TagRelation[];
  reviews?: ReviewWithCourse[];
}

export interface UniversityRelation {
  university: {
    id: number;
    name: string;
    acronym?: string;
  };
}

export interface FacultyRelation {
  faculty: {
    id: number;
    name: string;
  };
}

export interface CourseRelation {
  course: {
    id: number;
    name: string;
  };
}

export interface TagRelation {
  tag: {
    id: number;
    name: string;
    type: string;
  };
}

export interface ReviewWithCourse {
  id: number;
  overallRating: number;
  teachingQuality: number;
  difficultyLevel: number;
  mandatoryAttendance: boolean;
  classInterest: number;
  detailedComment?: string;
  gradeObtained?: string;
  createdAt: Date;
  course: {
    id: number;
    name: string;
  };
} 