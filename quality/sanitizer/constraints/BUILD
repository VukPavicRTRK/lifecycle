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

# A dummy constraint setting whose default value is always satisfied by any
# platform.  The aliases below resolve to either :always_true (compatible) or
# @platforms//:incompatible depending on the active sanitizer flag, giving
# targets a way to express sanitizer-only or sanitizer-excluded compatibility.

constraint_setting(
    name = "dummy_setting",
    default_constraint_value = ":always_true",
)

constraint_value(
    name = "always_true",
    constraint_setting = ":dummy_setting",
)

alias(
    name = "any_sanitizer",
    actual = select({
        "//quality/sanitizer/flags:asan_ubsan_lsan": ":always_true",
        "//quality/sanitizer/flags:tsan": ":always_true",
        "//conditions:default": "@platforms//:incompatible",
    }),
    visibility = ["//:__subpackages__"],
)

alias(
    name = "no_asan_ubsan_lsan",
    actual = select({
        "//quality/sanitizer/flags:asan_ubsan_lsan": "@platforms//:incompatible",
        "//conditions:default": ":always_true",
    }),
    visibility = ["//:__subpackages__"],
)

alias(
    name = "no_tsan",
    actual = select({
        "//quality/sanitizer/flags:tsan": "@platforms//:incompatible",
        "//conditions:default": ":always_true",
    }),
    visibility = ["//:__subpackages__"],
)
