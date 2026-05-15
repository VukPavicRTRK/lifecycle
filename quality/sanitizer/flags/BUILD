# *******************************************************************************
# Copyright (c) 2026 Contributors to the Eclipse Foundation
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

# Sanitizer flag: set via --define sanitizer=<value> in .bazelrc configs.
# Valid values: "asan_ubsan_lsan", "tsan"

config_setting(
    name = "asan_ubsan_lsan",
    define_values = {"sanitizer": "asan_ubsan_lsan"},
    visibility = ["//:__subpackages__"],
)

config_setting(
    name = "tsan",
    define_values = {"sanitizer": "tsan"},
    visibility = ["//:__subpackages__"],
)
