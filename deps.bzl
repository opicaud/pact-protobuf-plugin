load("@rules_rust//rust:repositories.bzl", "rules_rust_dependencies", "rust_register_toolchains")
load("@rules_rust//crate_universe:repositories.bzl", "crate_universe_dependencies")
load("@rules_rust//crate_universe:defs.bzl", "crates_repository", "crate")

def deps(json = "cargo-bazel-lock.json"):
    rules_rust_dependencies()
    rust_register_toolchains(edition = "2021")
    crate_universe_dependencies(bootstrap = True)
    load_crat(json)

def load_crat(json):
    crates_repository(
        name = "crate_index",
        cargo_lockfile = "@source//:Cargo.lock",
        generator = "@cargo_bazel_bootstrap//:cargo-bazel",
        lockfile = "@//:"+json,
        manifests = [
            "@source//:Cargo.toml"
        ]
    )
