# *******************************************************************************
# Copyright (c) 2025 Contributors to the Eclipse Foundation
#
# See the NOTICE file(s) distributed with this work for additional
# information regarding copyright ownership.
#
# This program and the accompanying materials are made available under the
# terms of the Apache License Version 2.0 which is available at
# https://www.apache.org/licenses/LICENSE-2.0
#
# SPDX-License-Identifier: Apache-2.0
# *******************************************************************************

# Sanitizer flags are applied globally via quality/sanitizer/sanitizer.bazelrc
# using --cxxopt / --linkopt, which instruments all C++ targets in the build.
# These constants are kept as empty lists for backward compatibility with
# cc_*_with_common_opts wrappers, which pass them through to each target.
SANITIZER_CXXOPTS = []
SANITIZER_LINKOPTS = []
