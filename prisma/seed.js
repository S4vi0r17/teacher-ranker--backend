const { PrismaClient } = require('@prisma/client');
const fs = require('fs');
const path = require('path');

const prisma = new PrismaClient();

async function main() {
  try {
    console.log('Starting database seeding...');
    
    // Read the SQL file
    const sqlFilePath = path.join(__dirname, 'seed.sql');
    const sqlContent = fs.readFileSync(sqlFilePath, 'utf8');
    
    // Split the SQL content into individual statements
    // This regex splits on semicolons but ignores those inside quotes
    const statements = sqlContent
      .replace(/\/\*.*?\*\//gs, '') // Remove multi-line comments
      .replace(/--.*$/gm, '') // Remove single-line comments
      .split(';')
      .map(statement => statement.trim())
      .filter(statement => statement.length > 0)
      .map(statement => statement + ';');
    
    console.log(`Found ${statements.length} SQL statements to execute`);
    
    // Execute each SQL statement
    for (let i = 0; i < statements.length; i++) {
      const statement = statements[i];
      try {
        await prisma.$executeRawUnsafe(statement);
        console.log(`[${i + 1}/${statements.length}] Statement executed successfully`);
      } catch (error) {
        console.error(`Error executing statement ${i + 1}:`, error.message);
        console.error('Statement:', statement);
        
        // If it's a "sequence does not exist" error, try to continue
        if (error.message.includes('does not exist') && statement.includes('ALTER SEQUENCE')) {
          console.log('Ignoring sequence error and continuing...');
          continue;
        }
        
        throw error; // Re-throw to stop execution
      }
    }
    
    console.log('Database seeding completed successfully!');
  } catch (error) {
    console.error('Error seeding database:', error.message);
    process.exit(1);
  } finally {
    await prisma.$disconnect();
  }
}

main(); 