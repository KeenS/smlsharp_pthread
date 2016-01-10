SMLSHARP=/usr/local/bin/smlsharp
SMLSHARP_FLAGS=-I../src
LDFLAGS=
TARGET=thread_incr_mutex

SRC=$(TARGET).sml
OBJ=$(SRC:.sml=.o)
ENTRY_POINT=$(TARGET).smi


all: $(TARGET)
run: $(TARGET)
	 ./$(TARGET)

$(TARGET): $(OBJ)
	$(MAKE) -C ../../src all
	$(SMLSHARP)  $(ENTRY_POINT) -o $(TARGET) $(LDFLAGS) $(LIBS)


%.o: %.sml %.smi
	$(SMLSHARP) $(SMLSHARP_CFLAGS) $(SMLSHARP_FLAGS) -c -o $@ $<

clean:
	rm -f $(OBJ) $(TEST_OBJ)
	rm -f $(TARGET) $(TEST_TARGET)

.PHONY: all test clean	
