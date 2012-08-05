DMD=dmd
DFLAGS=-w

D_MODULE=log
TEST_DIR=test

.PHONY : test
test : $(addprefix $(TEST_DIR)/, $(D_MODULE))

$(TEST_DIR)/%: src/%.d src/emptymain.d
	@echo Testing $@
	@mkdir -p $(TEST_DIR)
	@$(DMD) -unittest $(DFLAGS) -of$@ src/emptymain.d $<
	@touch -t 197001230123 $@
	@$@
	@touch $@
