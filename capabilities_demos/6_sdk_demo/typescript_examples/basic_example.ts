import { ClaudeCode } from '@anthropic-ai/claude-code-sdk';

// Basic SDK Usage Example
async function basicExample() {
  // Initialize Claude Code
  const claude = new ClaudeCode({
    apiKey: process.env.ANTHROPIC_API_KEY,
    model: 'claude-3-5-sonnet-20241022'
  });

  // Example 1: Simple code generation
  const response = await claude.send({
    message: "Create a TypeScript function to validate email addresses"
  });
  
  console.log(response.content);

  // Example 2: File analysis
  const analysis = await claude.send({
    message: "Analyze this file for potential improvements",
    attachments: [{
      type: 'file',
      path: './src/index.ts'
    }]
  });

  // Example 3: Multi-file refactoring
  const refactor = await claude.send({
    message: "Refactor these files to use async/await instead of callbacks",
    attachments: [
      { type: 'file', path: './src/old-api.js' },
      { type: 'file', path: './src/old-service.js' }
    ]
  });

  // Example 4: Streaming responses
  const stream = await claude.stream({
    message: "Generate comprehensive tests for the User class"
  });

  for await (const chunk of stream) {
    process.stdout.write(chunk.content);
  }
}

// Advanced: Custom tool integration
async function advancedExample() {
  const claude = new ClaudeCode({
    apiKey: process.env.ANTHROPIC_API_KEY,
    tools: {
      runTests: async (args) => {
        // Custom test runner
        console.log(`Running tests: ${args.pattern}`);
        return { success: true, passed: 10, failed: 0 };
      }
    }
  });

  const result = await claude.send({
    message: "Generate tests for the Auth module and run them"
  });
}

// Batch processing example
async function batchProcessing() {
  const claude = new ClaudeCode({
    apiKey: process.env.ANTHROPIC_API_KEY
  });

  const files = [
    'component1.tsx',
    'component2.tsx',
    'component3.tsx'
  ];

  // Process files in parallel
  const results = await Promise.all(
    files.map(file => 
      claude.send({
        message: `Add TypeScript types to ${file}`,
        attachments: [{ type: 'file', path: file }]
      })
    )
  );

  console.log(`Processed ${results.length} files`);
}

// Error handling
async function errorHandling() {
  const claude = new ClaudeCode({
    apiKey: process.env.ANTHROPIC_API_KEY
  });

  try {
    const response = await claude.send({
      message: "Analyze this code",
      timeout: 30000 // 30 second timeout
    });
  } catch (error) {
    if (error.code === 'TIMEOUT') {
      console.error('Request timed out');
    } else if (error.code === 'RATE_LIMIT') {
      console.error('Rate limit exceeded');
    } else {
      console.error('Unexpected error:', error);
    }
  }
}

// Main execution
if (require.main === module) {
  basicExample()
    .then(() => advancedExample())
    .then(() => batchProcessing())
    .then(() => errorHandling())
    .catch(console.error);
}