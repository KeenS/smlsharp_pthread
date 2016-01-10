SMLSHARP=/usr/local/bin/smlsharp
SMLSHARP_FLAGS=-I../src
LDFLAGS=
SRC=simple_thread.sml
OBJ=$(SRC:.sml=.o)

TARGET=simple_thread
ENTRY_POINT=simple_thread.smi


all: $(TARGET)

$(TARGET): $(OBJ)
	$(MAKE) -C ../../src all
	$(SMLSHARP)  $(ENTRY_POINT) -o $(TARGET) $(LDFLAGS) $(LIBS)


%.o: %.sml %.smi
	$(SMLSHARP) $(SMLSHARP_CFLAGS) $(SMLSHARP_FLAGS) -c -o $@ $<

clean:
	rm -f $(OBJ) $(TEST_OBJ)
	rm -f $(TARGET) $(TEST_TARGET)

.PHONY: all test clean	
