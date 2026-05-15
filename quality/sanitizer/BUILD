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

# Selects the env template matching the active sanitizer.
filegroup(
    name = "env_template",
    srcs = select({
        "//quality/sanitizer/flags:tsan": ["tsan.env.template"],
        "//quality/sanitizer/flags:asan_ubsan_lsan": ["asan_ubsan_lsan.env.template"],
    }),
    target_compatible_with = ["//quality/sanitizer/constraints:any_sanitizer"],
)

# Generates the env file with %ROOT% substituted for a relative path ("./").
# Used by wrapper.sh at test runtime to locate suppression files.
genrule(
    name = "relative_env",
    srcs = [":env_template"],
    outs = ["relative_sanitizer.env"],
    cmd = "sed 's|%ROOT%|./|g' $(location :env_template) > $@",
    target_compatible_with = ["//quality/sanitizer/constraints:any_sanitizer"],
    visibility = ["//:__subpackages__"],
)

# Bundles the suppression files that match the active sanitizer.
filegroup(
    name = "suppressions",
    srcs = select({
        "//quality/sanitizer/flags:tsan": ["tsan.supp"],
        "//quality/sanitizer/flags:asan_ubsan_lsan": [
            "asan.supp",
            "lsan.supp",
            "ubsan.supp",
        ],
    }),
    target_compatible_with = ["//quality/sanitizer/constraints:any_sanitizer"],
)

# Shell wrapper used as --run_under in sanitizer test configs.
# Exports sanitizer runtime options before executing the test binary.
sh_binary(
    name = "wrapper",
    srcs = ["wrapper.sh"],
    data = [
        ":relative_env",
        ":suppressions",
    ],
    target_compatible_with = ["//quality/sanitizer/constraints:any_sanitizer"],
)
