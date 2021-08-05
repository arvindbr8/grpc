#!/bin/bash
# Copyright 2016 gRPC authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set -ex

cd $(dirname $0)/../..

tools/buildgen/generate_projects.sh
tools/distrib/check_copyright.py --fix
tools/distrib/check_trailing_newlines.sh --fix
tools/run_tests/sanity/check_port_platform.py --fix
tools/distrib/clang_format_code.sh
tools/distrib/buildifier_format_code.sh || true

