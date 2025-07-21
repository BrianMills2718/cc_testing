# Comprehensive Test Generator

Generate thorough test suites for the specified code.

## Test Generation Strategy:

1. **Analysis Phase**
   - Analyze ${1:target} (file/function/class)
   - Identify test scenarios
   - Determine edge cases
   - Note dependencies to mock

2. **Test Framework**
   - Use ${2:--framework} (jest/pytest/mocha/unittest)
   - Follow project's testing conventions
   - Include proper setup/teardown

3. **Test Coverage**
   - Happy path scenarios
   - Error handling cases
   - Edge cases and boundaries
   - Integration points
   - Performance considerations

4. **Test Types**
   - Unit tests for individual functions
   - Integration tests for components
   - Mock external dependencies
   - Data-driven test cases

5. **Best Practices**
   - Descriptive test names
   - Arrange-Act-Assert pattern
   - One assertion per test
   - Isolated and repeatable
   - Fast execution

Generate complete, runnable tests with high coverage.