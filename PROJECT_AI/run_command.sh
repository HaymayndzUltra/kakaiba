#!/bin/bash
# Multi-Agent AI System Command Runner
# Usage: ./run_command.sh <COMMAND>

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${BLUE}[$(date '+%Y-%m-%d %H:%M:%S')]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[$(date '+%Y-%m-%d %H:%M:%S')] ✅ $1${NC}"
}

print_error() {
    echo -e "${RED}[$(date '+%Y-%m-%d %H:%M:%S')] ❌ $1${NC}"
}

print_warning() {
    echo -e "${YELLOW}[$(date '+%Y-%m-%d %H:%M:%S')] ⚠️ $1${NC}"
}

# Check if command is provided
if [ $# -eq 0 ]; then
    print_error "No command provided"
    echo "Usage: ./run_command.sh <COMMAND>"
    echo ""
    echo "Available commands:"
    echo "  INITIALIZE_MULTI_AGENT_SYSTEM"
    echo "  ACTIVATE_COMPLETE_MULTI_AGENT_SYSTEM"
    echo "  CHECK_SYSTEM_STATUS"
    echo "  VIEW_AGENT_STATUS"
    echo "  VALIDATE_WORKFLOWS"
    echo "  TEST_AGENT_COORDINATION"
    echo "  ACTIVATE_LEARNING_SYSTEM"
    echo "  OPTIMIZE_SYSTEM_PERFORMANCE"
    echo "  MONITOR_SYSTEM_PERFORMANCE"
    echo "  RUN_SYSTEM_DIAGNOSTICS"
    echo ""
    echo "For complete list, run: python execute_commands.py"
    exit 1
fi

COMMAND=$1

print_status "Executing command: $COMMAND"

# Check if Python script exists
if [ ! -f "execute_commands.py" ]; then
    print_error "execute_commands.py not found"
    exit 1
fi

# Execute the command
python3 execute_commands.py "$COMMAND"

# Check exit status
if [ $? -eq 0 ]; then
    print_success "Command executed successfully"
else
    print_error "Command failed"
    exit 1
fi
