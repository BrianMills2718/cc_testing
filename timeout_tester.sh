#!/bin/bash

# Claude Code Timeout Limits Testing Script
# This script systematically tests the maximum values for timeout-related parameters

echo "=== Claude Code Timeout Limits Testing ==="
echo "Date: $(date)"
echo "Testing timeout parameters to find maximum values..."
echo ""

# Results file
RESULTS_FILE="timeout_test_results.txt"
echo "Claude Code Timeout Testing Results - $(date)" > "$RESULTS_FILE"
echo "================================================" >> "$RESULTS_FILE"
echo "" >> "$RESULTS_FILE"

# Test values - using powers of 10 and some edge cases
TEST_VALUES=(
    1000          # 1 second
    10000         # 10 seconds  
    60000         # 1 minute
    300000        # 5 minutes
    600000        # 10 minutes
    1800000       # 30 minutes
    3600000       # 1 hour
    86400000      # 24 hours
    2147483647    # Max 32-bit signed int
    4294967295    # Max 32-bit unsigned int
    9223372036854775807  # Max 64-bit signed int
)

# Function to test a timeout parameter
test_timeout_param() {
    local param_name="$1"
    local test_command="$2"
    local description="$3"
    
    echo "Testing $param_name ($description)..."
    echo "Testing $param_name ($description)..." >> "$RESULTS_FILE"
    echo "----------------------------------------" >> "$RESULTS_FILE"
    
    for value in "${TEST_VALUES[@]}"; do
        echo -n "  Testing $value ms... "
        
        # Set the environment variable and run test command
        if eval "$param_name=$value $test_command" &>/dev/null; then
            echo "✓ PASSED"
            echo "  $value ms: PASSED" >> "$RESULTS_FILE"
        else
            echo "✗ FAILED"
            echo "  $value ms: FAILED" >> "$RESULTS_FILE"
            # Once we hit a failure, test a few more to confirm the limit
            break
        fi
    done
    echo "" >> "$RESULTS_FILE"
}

# Function to test bash timeout with a sleep command
test_bash_timeout() {
    local param_name="$1"
    local description="$2"
    
    echo "Testing $param_name ($description)..."
    echo "Testing $param_name ($description)..." >> "$RESULTS_FILE"
    echo "----------------------------------------" >> "$RESULTS_FILE"
    
    for value in "${TEST_VALUES[@]}"; do
        echo -n "  Testing $value ms... "
        
        # Test with a very short sleep to see if the timeout value is accepted
        if eval "$param_name=$value claude --print 'sleep 0.1; echo success'" &>/dev/null; then
            echo "✓ PASSED"
            echo "  $value ms: PASSED" >> "$RESULTS_FILE"
        else
            echo "✗ FAILED"
            echo "  $value ms: FAILED" >> "$RESULTS_FILE"
            break
        fi
    done
    echo "" >> "$RESULTS_FILE"
}

# Function to test MCP timeouts (these might not be easily testable without MCP setup)
test_mcp_timeout() {
    local param_name="$1"
    local description="$2"
    
    echo "Testing $param_name ($description)..."
    echo "Testing $param_name ($description)..." >> "$RESULTS_FILE"
    echo "----------------------------------------" >> "$RESULTS_FILE"
    
    for value in "${TEST_VALUES[@]}"; do
        echo -n "  Testing $value ms... "
        
        # Test by setting the env var and running a simple claude command
        if eval "$param_name=$value claude --print 'echo test'" &>/dev/null; then
            echo "✓ PASSED"
            echo "  $value ms: PASSED" >> "$RESULTS_FILE"
        else
            echo "✗ FAILED"
            echo "  $value ms: FAILED" >> "$RESULTS_FILE"
            break
        fi
    done
    echo "" >> "$RESULTS_FILE"
}

# Run tests for each timeout parameter
echo "1. Testing BASH_DEFAULT_TIMEOUT_MS..."
test_bash_timeout "BASH_DEFAULT_TIMEOUT_MS" "Default timeout for bash commands"

echo "2. Testing BASH_MAX_TIMEOUT_MS..."
test_bash_timeout "BASH_MAX_TIMEOUT_MS" "Maximum timeout for bash commands"

echo "3. Testing CLAUDE_CODE_API_KEY_HELPER_TTL_MS..."
test_mcp_timeout "CLAUDE_CODE_API_KEY_HELPER_TTL_MS" "API key helper refresh interval"

echo "4. Testing MCP_TIMEOUT..."
test_mcp_timeout "MCP_TIMEOUT" "MCP server startup timeout"

echo "5. Testing MCP_TOOL_TIMEOUT..."
test_mcp_timeout "MCP_TOOL_TIMEOUT" "MCP tool execution timeout"

echo ""
echo "=== Testing Complete ==="
echo "Results saved to: $RESULTS_FILE"
echo ""
echo "Summary of findings:"
cat "$RESULTS_FILE"