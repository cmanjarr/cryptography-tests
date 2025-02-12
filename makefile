#cmanjarr 
#Usage: 
#  cd <Chapter>
#  make file.cpp -f ../makefile

#Compiler
CXX = g++

#Compiler flags
CXXFLAGS = -Wall -g

#Target executable
TARGET = $(SRCS:.cpp=)

#Clean
TARGET_CLEAN = $(TARGET)

#Source files
SRCS = CM_01-06-SimpleMDHash.cpp

#Object files
OBJS = $(SRCS:.cpp=.o)

#Build and run executable
all: $(TARGET) run

#Link object files into executable
$(TARGET): $(OBJS)
	$(CXX) $(CXXFLAGS) -o $(TARGET) $(OBJS)

#Compile
%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

#Run
run: $(TARGET)
	./$(TARGET)

#clean
clean:
	rm $(TARGET_CLEAN) $(OBJS)
