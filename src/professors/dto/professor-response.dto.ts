export class ProfessorResponseDto {
  id: number;
  fullName: string;
  averageRating: number;
  reviewCount: number;
  universities: {
    id: number;
    name: string;
    acronym?: string;
  }[];
  faculties: {
    id: number;
    name: string;
  }[];
}

export class ProfessorDetailResponseDto extends ProfessorResponseDto {
  courses: {
    id: number;
    name: string;
  }[];
  tags: {
    id: number;
    name: string;
    type: string;
  }[];
  reviews: {
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
  }[];
}

export class PaginatedProfessorsResponseDto {
  data: ProfessorResponseDto[];
  meta: {
    total: number;
    page: number;
    lastPage: number;
    limit: number;
  };
} 