#!/bin/bash

# Actual Timeout Behavior Testing Script
# This script tests if the timeout values actually work by triggering real timeouts

echo "=== Claude Code Actual Timeout Behavior Testing ==="
echo "Date: $(date)"
echo ""

RESULTS_FILE="actual_timeout_results.txt"
echo "Claude Code Actual Timeout Testing Results - $(date)" > "$RESULTS_FILE"
echo "====================================================" >> "$RESULTS_FILE"
echo "" >> "$RESULTS_FILE"

# Function to test actual bash timeout behavior
test_actual_bash_timeout() {
    local param_name="$1"
    local timeout_ms="$2"
    local sleep_seconds="$3"
    
    echo "Testing $param_name with ${timeout_ms}ms timeout and ${sleep_seconds}s sleep..."
    echo "Testing $param_name: timeout=${timeout_ms}ms, sleep=${sleep_seconds}s" >> "$RESULTS_FILE"
    
    start_time=$(date +%s)
    
    # Run command with timeout and capture result
    if eval "$param_name=$timeout_ms timeout ${sleep_seconds}s claude --print 'sleep $sleep_seconds; echo completed'" &>/dev/null; then
        end_time=$(date +%s)
        duration=$((end_time - start_time))
        echo "  ✓ Command completed in ${duration}s"
        echo "  Result: COMPLETED in ${duration}s" >> "$RESULTS_FILE"
        return 0
    else
        end_time=$(date +%s)
        duration=$((end_time - start_time))
        echo "  ✗ Command timed out or failed in ${duration}s"
        echo "  Result: FAILED/TIMEOUT in ${duration}s" >> "$RESULTS_FILE"
        return 1
    fi
}

# Test 1: Small timeout should fail with longer command
echo "=== Test 1: Short timeout (2 seconds) with long command (5 seconds) ==="
test_actual_bash_timeout "BASH_DEFAULT_TIMEOUT_MS" "2000" "5"
echo "" >> "$RESULTS_FILE"

# Test 2: Adequate timeout should succeed
echo "=== Test 2: Adequate timeout (10 seconds) with short command (2 seconds) ==="
test_actual_bash_timeout "BASH_DEFAULT_TIMEOUT_MS" "10000" "2"
echo "" >> "$RESULTS_FILE"

# Test 3: Test BASH_MAX_TIMEOUT_MS vs BASH_DEFAULT_TIMEOUT_MS
echo "=== Test 3: Testing relationship between BASH_MAX_TIMEOUT_MS and actual timeout ==="
echo "Setting BASH_MAX_TIMEOUT_MS=3000 and trying a 5 second command..."
test_actual_bash_timeout "BASH_MAX_TIMEOUT_MS" "3000" "5"
echo "" >> "$RESULTS_FILE"

# Test 4: Very small timeout
echo "=== Test 4: Very small timeout (100ms) ==="
test_actual_bash_timeout "BASH_DEFAULT_TIMEOUT_MS" "100" "1"
echo "" >> "$RESULTS_FILE"

# Test 5: Default behavior (no timeout set)
echo "=== Test 5: Default behavior (no custom timeout) ==="
echo "Testing default timeout behavior..." >> "$RESULTS_FILE"
start_time=$(date +%s)
if timeout 10s claude --print 'sleep 2; echo completed' &>/dev/null; then
    end_time=$(date +%s)
    duration=$((end_time - start_time))
    echo "  ✓ Default behavior completed in ${duration}s"
    echo "  Default: COMPLETED in ${duration}s" >> "$RESULTS_FILE"
else
    end_time=$(date +%s)
    duration=$((end_time - start_time))
    echo "  ✗ Default behavior failed in ${duration}s"
    echo "  Default: FAILED in ${duration}s" >> "$RESULTS_FILE"
fi

echo ""
echo "=== Testing Complete ==="
echo "Results saved to: $RESULTS_FILE"
echo ""
echo "Final Results:"
cat "$RESULTS_FILE"