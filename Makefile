##==============================================================================
## Copyright 2010 Trifork A/S
##
## Licensed under the Apache License, Version 2.0 (the "License");
## you may not use this file except in compliance with the License.
## You may obtain a copy of the License at
##
## http://www.apache.org/licenses/LICENSE-2.0
##
## Unless required by applicable law or agreed to in writing, software
## distributed under the License is distributed on an "AS IS" BASIS,
## WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
## See the License for the specific language governing permissions and
## limitations under the License.
##==============================================================================

.PHONY: doc

all:
	./rebar compile

test: xref eunit qc

ci: clean debug test

ci-dialyze: clean debug dialyze

doc:
	./rebar doc

clean:
	./rebar clean

xref:
	./rebar xref

eunit:
	./rebar eunit

qc:
	./rebar qc

maybe_build_plt:
	./rebar -vv check-plt || ./rebar -vv build-plt

dialyze: maybe_build_plt
	./rebar -vv dialyze
