load("@rules_rust//crate_universe:defs.bzl", "crate", "crates_repository")

def crate_bazel_deps():
        crates_repository(
            name = "crate_index_protobuf",
            cargo_lockfile = "//:Cargo.lock",
            generator = "@cargo_bazel_bootstrap//:cargo-bazel",
            rust_toolchain_cargo_template = "@rust_host_tools//:bin/cargo",
            rust_toolchain_rustc_template = "@rust_host_tools//:bin/rustc",
            lockfile = "//:cargo-bazel-lock.json",
            manifests = [
                "//:Cargo.toml"
            ],
            render_config = '{"build_file_template": "//:BUILD.{name}-{version}.bazel", "crate_label_template": "@crate_index_protobuf__{name}-{version}//:{target}", "crate_repository_template": "crate_index_protobuf__{name}-{version}", "crates_module_template": "//:{file}", "platforms_template": "@rules_rust//rust/platform:{triple}"}'
        )