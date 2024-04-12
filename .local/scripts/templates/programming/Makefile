 # Compiler
CXX := g++

# Compiler flags
CXXFLAGS := -std=c++20 -Wall -Wextra

# Source file
SRC := $(wildcard *.cpp)

# Executable name
EXEC := myprogram

# Build rule
$(EXEC): $(SRC)
	$(CXX) $(CXXFLAGS) $^ -o $@

# Clean rule
clean: 
	rm -f $(EXEC)

# Run rule
run: clean $(EXEC)
	./$(EXEC)
