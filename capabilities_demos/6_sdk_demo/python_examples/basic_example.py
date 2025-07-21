import os
import asyncio
from claude_code_sdk import ClaudeCode, ClaudeCodeError

# Basic SDK Usage Example
async def basic_example():
    # Initialize Claude Code
    claude = ClaudeCode(
        api_key=os.environ.get('ANTHROPIC_API_KEY'),
        model='claude-3-5-sonnet-20241022'
    )
    
    # Example 1: Simple code generation
    response = await claude.send(
        message="Create a Python function to validate email addresses using regex"
    )
    print(response.content)
    
    # Example 2: File analysis
    analysis = await claude.send(
        message="Analyze this file for potential improvements",
        attachments=[{
            'type': 'file',
            'path': './src/main.py'
        }]
    )
    
    # Example 3: Multi-file refactoring
    refactor = await claude.send(
        message="Refactor these files to use type hints",
        attachments=[
            {'type': 'file', 'path': './src/models.py'},
            {'type': 'file', 'path': './src/services.py'}
        ]
    )
    
    # Example 4: Streaming responses
    stream = await claude.stream(
        message="Generate comprehensive tests for the User class"
    )
    
    async for chunk in stream:
        print(chunk.content, end='', flush=True)

# Advanced: Custom tool integration
async def advanced_example():
    # Define custom tools
    async def run_tests(pattern: str):
        """Custom test runner"""
        print(f"Running tests matching: {pattern}")
        return {"success": True, "passed": 10, "failed": 0}
    
    claude = ClaudeCode(
        api_key=os.environ.get('ANTHROPIC_API_KEY'),
        tools={
            'run_tests': run_tests
        }
    )
    
    result = await claude.send(
        message="Generate tests for the Auth module and run them"
    )

# Batch processing example
async def batch_processing():
    claude = ClaudeCode(
        api_key=os.environ.get('ANTHROPIC_API_KEY')
    )
    
    files = [
        'module1.py',
        'module2.py', 
        'module3.py'
    ]
    
    # Process files concurrently
    tasks = [
        claude.send(
            message=f"Add docstrings to all functions in {file}",
            attachments=[{'type': 'file', 'path': file}]
        )
        for file in files
    ]
    
    results = await asyncio.gather(*tasks)
    print(f"Processed {len(results)} files")

# Context management example
async def context_management():
    claude = ClaudeCode(
        api_key=os.environ.get('ANTHROPIC_API_KEY')
    )
    
    # Create a conversation with context
    conversation = claude.create_conversation()
    
    # First message
    await conversation.send(
        message="I need help refactoring a large codebase"
    )
    
    # Follow-up with context
    await conversation.send(
        message="Let's start with the authentication module"
    )
    
    # Continue with retained context
    await conversation.send(
        message="Now update the tests accordingly"
    )

# Error handling
async def error_handling():
    claude = ClaudeCode(
        api_key=os.environ.get('ANTHROPIC_API_KEY')
    )
    
    try:
        response = await claude.send(
            message="Analyze this code",
            timeout=30  # 30 second timeout
        )
    except ClaudeCodeError as e:
        if e.code == 'TIMEOUT':
            print('Request timed out')
        elif e.code == 'RATE_LIMIT':
            print('Rate limit exceeded')
        else:
            print(f'Unexpected error: {e}')

# Automation script example
async def automation_example():
    """Example of using SDK for automated code review"""
    claude = ClaudeCode(
        api_key=os.environ.get('ANTHROPIC_API_KEY')
    )
    
    # Get list of changed files (from git or CI)
    changed_files = [
        'src/new_feature.py',
        'tests/test_feature.py'
    ]
    
    # Automated review
    for file in changed_files:
        print(f"\\nReviewing {file}...")
        
        review = await claude.send(
            message=f"""Review this file for:
            1. Security vulnerabilities
            2. Performance issues
            3. Code style violations
            4. Missing tests
            
            Provide specific line numbers for issues.""",
            attachments=[{'type': 'file', 'path': file}]
        )
        
        print(review.content)

# Main execution
async def main():
    print("=== Basic Example ===")
    await basic_example()
    
    print("\\n=== Advanced Example ===")
    await advanced_example()
    
    print("\\n=== Batch Processing ===")
    await batch_processing()
    
    print("\\n=== Context Management ===")
    await context_management()
    
    print("\\n=== Error Handling ===")
    await error_handling()
    
    print("\\n=== Automation Example ===")
    await automation_example()

if __name__ == "__main__":
    asyncio.run(main())