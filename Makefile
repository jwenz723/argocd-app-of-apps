# Special make variables: https://www.gnu.org/software/make/manual/html_node/Automatic-Variables.html
# $@ : The file name of the target of the rule. If the target is an archive member, then ‘$@’ is the name of the archive file. In a pattern rule that has multiple targets (see Introduction to Pattern Rules), ‘$@’ is the name of whichever target caused the rule’s recipe to be run.
# $< : The name of the first prerequisite. If the target got its recipe from an implicit rule, this will be the first prerequisite added by the implicit rule (see Implicit Rules).


# Set default variables that will be used if values are not already specified as env vars
OUTPUT_DIR ?= releases
OUTPUT_FILE ?= output.yaml

# All clusters that need to be built as a release should be declared here
build: account1/cluster1

# Define each unique cluster/release here:
account1/cluster1: accounts/account1/cluster1
	mkdir -p ${OUTPUT_DIR}/$@
	helm template apps $< > ${OUTPUT_DIR}/$@/${OUTPUT_FILE}
