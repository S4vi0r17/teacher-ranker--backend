const { PrismaClient } = require('@prisma/client');
const { execSync } = require('child_process');
const path = require('path');

const prisma = new PrismaClient();

async function resetDatabase() {
  try {
    console.log('Starting database reset...');
    
    // Drop all tables and recreate the schema
    console.log('Dropping all tables and recreating schema...');
    execSync('npx prisma migrate reset --force', { stdio: 'inherit' });
    
    console.log('Database has been reset successfully!');
    console.log('To seed the database with test data, run: npm run db:seed');
  } catch (error) {
    console.error('Error resetting database:', error.message);
    process.exit(1);
  } finally {
    await prisma.$disconnect();
  }
}

resetDatabase(); 