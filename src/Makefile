CPP=cpp
SED=sed
SMLSHARP=/usr/local/bin/smlsharp
SMLSHARP_FLAGS=-I../src
LDFLAGS=
SRC=pthread.sml pthread_compat.prl escapes.sml
OBJ=$(patsubst %.sml, %.o, $(patsubst %.prl, %.sml, $(SRC)))


all: $(OBJ)


%.o: %.sml %.smi
	$(SMLSHARP) $(SMLSHARP_CFLAGS) $(SMLSHARP_FLAGS) -c -o $@ $<

pthread.smi: pthread_compat.smi

%.sml: %.prl
	$(CPP) -pipe -E $< | $(SED) '1,/====END_OF_HEADER====/d;/^#/d' > $@
%.smi: %.pri
	$(CPP) -pipe -E $< | $(SED) '1,/====END_OF_HEADER====/d;/^#/d' > $@

clean:
	rm -f $(OBJ) $(TEST_OBJ)
	rm -f $(TARGET) $(TEST_TARGET)
	rm -f pthread_compat.sml pthread_compat.smi

.PHONY: all test clean	
