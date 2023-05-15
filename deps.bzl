load("@rules_rust//rust:repositories.bzl", "rules_rust_dependencies", "rust_register_toolchains")
load("@rules_rust//crate_universe:repositories.bzl", "crate_universe_dependencies")
load("@rules_rust//crate_universe:defs.bzl", "crates_repository", "crate")

def deps():
    rules_rust_dependencies()
    rust_register_toolchains(edition = "2021")
    crate_universe_dependencies(bootstrap = True)
    load_crat()

def load_crat():
    crates_repository(
        name = "crate_index_protobuf",
        cargo_lockfile = "@source_protobuf//:Cargo.lock",
        generator = "@cargo_bazel_bootstrap//:cargo-bazel",
        lockfile = "@source_protobuf//:cargo-bazel-lock.json",
        manifests = [
            "@source_protobuf//:Cargo.toml"
        ]
    )
