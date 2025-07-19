#!/bin/bash

# Test Claude Code's internal Bash tool timeout behavior
echo "=== Testing Claude Code Internal Bash Tool Timeout ==="
echo "Date: $(date)"
echo ""

RESULTS_FILE="claude_internal_timeout_results.txt"
echo "Claude Code Internal Bash Tool Timeout Results - $(date)" > "$RESULTS_FILE"
echo "======================================================" >> "$RESULTS_FILE"
echo "" >> "$RESULTS_FILE"

# Test different sleep durations to find the breaking point
test_durations=(30 60 120 300 600 900 1200)  # 30s, 1m, 2m, 5m, 10m, 15m, 20m

for duration in "${test_durations[@]}"; do
    echo "Testing ${duration} second command..."
    echo "Testing ${duration}s sleep command:" >> "$RESULTS_FILE"
    
    start_time=$(date +%s)
    
    # Test using claude --print to see if it times out
    if timeout $((duration + 60)) claude --print "sleep $duration; echo 'Command completed after ${duration}s'" &>/dev/null; then
        end_time=$(date +%s)
        actual_duration=$((end_time - start_time))
        echo "  ✓ ${duration}s command completed (actual: ${actual_duration}s)"
        echo "  PASSED - completed in ${actual_duration}s" >> "$RESULTS_FILE"
    else
        end_time=$(date +%s)
        actual_duration=$((end_time - start_time))
        echo "  ✗ ${duration}s command failed/timed out (actual: ${actual_duration}s)"
        echo "  FAILED/TIMEOUT after ${actual_duration}s" >> "$RESULTS_FILE"
        
        # If we hit a timeout, this might be the limit
        if [ $actual_duration -lt $duration ]; then
            echo "  → Likely hit Claude Code's internal timeout limit around ${actual_duration}s"
            echo "  → Estimated timeout limit: ~${actual_duration}s" >> "$RESULTS_FILE"
            break
        fi
    fi
    echo "" >> "$RESULTS_FILE"
done

echo ""
echo "Results saved to: $RESULTS_FILE"
echo ""
echo "Summary:"
cat "$RESULTS_FILE"