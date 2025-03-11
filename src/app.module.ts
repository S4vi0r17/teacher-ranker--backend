import { Module } from '@nestjs/common';
import { PrismaModule } from './prisma/prisma.module';
import { ProfessorsModule } from './professors/professors.module';

@Module({
  imports: [
    PrismaModule,
    ProfessorsModule,
  ],
  controllers: [],
  providers: [],
})
export class AppModule {}
