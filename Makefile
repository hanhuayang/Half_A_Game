# 编译器
CXX = g++

# 编译选项
CXXFLAGS = -std=c++17 -Wall -Wextra

# 包含头文件目录
INCLUDES = -Iinclude

# 源文件目录
SRCDIR = src

# 目标文件目录
OBJDIR = obj

# 可执行文件名称
TARGET = Half_A_Game

# 自动收集所有源文件
SOURCES = $(wildcard $(SRCDIR)/*.cpp)

# 自动生成对应的对象文件列表
OBJECTS = $(patsubst $(SRCDIR)/%.cpp, $(OBJDIR)/%.o, $(SOURCES))

# 默认目标
all: $(TARGET)

# 链接目标文件生成可执行文件
$(TARGET): $(OBJECTS)
	@mkdir -p bin
	$(CXX) $(CXXFLAGS) -o bin/$@ $^

# 编译源文件生成对象文件
$(OBJDIR)/%.o: $(SRCDIR)/%.cpp
	@mkdir -p $(OBJDIR)
	$(CXX) $(CXXFLAGS) $(INCLUDES) -c $&lt; -o $@

# 清理生成的文件
clean:
	rm -rf bin $(OBJDIR)

# 伪目标，不生成文件
.PHONY: all clean
