# Intelligent Code Refactoring Assistant

Help refactor code following best practices and modern patterns.

## Refactoring Approach:

1. **Analyze Current Code**
   - Understand the existing implementation
   - Identify code smells and anti-patterns
   - Note dependencies and side effects

2. **Suggest Improvements**
   - Apply SOLID principles
   - Improve naming and readability
   - Reduce complexity and duplication
   - Enhance error handling

3. **Refactoring Options**
   - ${1:filename} - File to refactor (required)
   - ${2:--style} - Style preference (functional/oop/hybrid)
   - ${3:--preserve} - Preserve specific behaviors
   - ${4:--target} - Target pattern or framework

4. **Safety Checks**
   - Ensure backward compatibility
   - Maintain existing tests
   - Preserve public APIs
   - Document breaking changes

5. **Deliverables**
   - Refactored code with explanations
   - List of changes made
   - Potential risks or considerations
   - Suggested test updates

Provide clean, maintainable code that follows project conventions.