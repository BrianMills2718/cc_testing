# Test file for hooks demo
# This file will trigger the afterFileChange hook

def hello_hooks():
    print("Testing Claude Code hooks!")
    return "Hooks are working"

if __name__ == "__main__":
    hello_hooks()