CXX = g++
AR = ar rcs
CXXFLAGS = -std=c++14 -g -Wall -Iinclude -I../fluxions-gte/include -I../hatchetfish/include -I../fluxions-deps/include `python3-config --includes`
LDFLAGS = 

# We use this to 
SOURCES = $(wildcard src/*.cpp)
HEADERS = $(wildcard include/*.hpp) $(wildcard include/*.h)
OBJECTS = $(patsubst %.cpp,%.o,$(SOURCES))

# Write the name of your program here
TARGET = libdamselfish.a

.PHONY: all clean

# This "phony" target says we want the target to be built
all: $(TARGET)

# This "phony" target removes all built files
clean:
	$(RM) $(OBJECTS)
	$(RM) $(TARGET)

# Tells make how to make target out of objects
$(TARGET): $(OBJECTS)
	$(AR) $@ $(OBJECTS) $(LDFLAGS)

# Tells make how to make objects out of source code
# It also says when we change a header, recompile
# $< is the input, $@ is the output
%.o: %.cpp $(HEADERS)
	$(CXX) $(CXXFLAGS) -c $< -o $@
