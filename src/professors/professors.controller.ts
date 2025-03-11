import { Controller, Get, Param, Query, ParseIntPipe } from '@nestjs/common';
import { ProfessorsService } from './professors.service';
import { SearchProfessorDto } from './dto/search-professor.dto';
import { PaginatedProfessorsResponseDto, ProfessorDetailResponseDto } from './dto/professor-response.dto';
import { ApiTags, ApiOperation, ApiResponse, ApiParam, ApiQuery } from '@nestjs/swagger';

@ApiTags('professors')
@Controller('professors')
export class ProfessorsController {
  constructor(private readonly professorsService: ProfessorsService) {}

  @Get()
  @ApiOperation({ summary: 'Buscar profesores', description: 'Permite buscar profesores por nombre y aplicar diversos filtros' })
  @ApiResponse({ status: 200, description: 'Lista paginada de profesores', type: PaginatedProfessorsResponseDto })
  @ApiQuery({ name: 'name', required: false, description: 'Nombre del profesor a buscar' })
  @ApiQuery({ name: 'universityId', required: false, description: 'ID de la universidad para filtrar' })
  @ApiQuery({ name: 'facultyId', required: false, description: 'ID de la facultad para filtrar' })
  @ApiQuery({ name: 'department', required: false, description: 'Departamento para filtrar' })
  @ApiQuery({ name: 'minRating', required: false, description: 'Calificación mínima (0-5)' })
  @ApiQuery({ name: 'maxRating', required: false, description: 'Calificación máxima (0-5)' })
  @ApiQuery({ name: 'minReviews', required: false, description: 'Número mínimo de reseñas' })
  @ApiQuery({ name: 'page', required: false, description: 'Número de página', example: 1 })
  @ApiQuery({ name: 'limit', required: false, description: 'Elementos por página (máx. 100)', example: 20 })
  async findAll(@Query() searchDto: SearchProfessorDto): Promise<PaginatedProfessorsResponseDto> {
    return this.professorsService.findAll(searchDto);
  }

  @Get(':id')
  @ApiOperation({ summary: 'Obtener detalles de un profesor', description: 'Devuelve información detallada de un profesor específico' })
  @ApiResponse({ status: 200, description: 'Detalles del profesor', type: ProfessorDetailResponseDto })
  @ApiResponse({ status: 404, description: 'Profesor no encontrado' })
  @ApiParam({ name: 'id', description: 'ID del profesor' })
  async findOne(@Param('id', ParseIntPipe) id: number): Promise<ProfessorDetailResponseDto> {
    return this.professorsService.findOne(id);
  }
} 