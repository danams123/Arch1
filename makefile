# CC		:=	gcc -m32
# CC_FLAGS	:=	-Wall -g
# ASM		:=	nasm
# ASM_FLAGS	:=	-f elf -g
# LINK		:=	ld

# SRC_DIR		:=	src
# OBJ_DIR		:=	obj
# LIST_DIR	:=	list
# BIN_DIR		:=	bin

# all: task1 # task2

# task1:	$(OBJ_DIR)/main1.o $(OBJ_DIR)/task1.o
# 	$(CC) -o $(BIN_DIR)/task1.bin $(OBJ_DIR)/main1.o $(OBJ_DIR)/task1.o

# # task2:
# # add your makefile code here...
# # uncomment task2 in section 'all'

# # .c/.s compile rules
# $(OBJ_DIR)/%.o : $(SRC_DIR)/%.c
# 	$(CC) -c $(CC_FLAGS) $< -o $@

# $(OBJ_DIR)/%.o : $(SRC_DIR)/%.s
# 	$(ASM) $(ASM_FLAGS) $< -o $@ -l $(subst .o,.lst,$(subst $(OBJ_DIR),$(LIST_DIR),$@))

# clean:
# 	rm $(BIN_DIR)/*.bin $(OBJ_DIR)/*.o $(LIST_DIR)/*.lst

all: ass

ass: ass.o start.o
	gcc -m32 -g -Wall -o ass ass.o start.o

# Depends on the source and header files
ass.o: main_task1Assignment1.c
	gcc -g -Wall -m32  -c -o ass.o main_task1Assignment1.c
 
start.o: asm_task1Assignment1.s
	nasm -g -f elf -w+all -o start.o asm_task1Assignment1.s


#tell make that "clean" is not a file name!
.PHONY: clean

#Clean the build directory
clean: 
	rm -f *.o ass