load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

#### RUST ####
http_archive(
    name = "rules_rust",
    sha256 = "d125fb75432dc3b20e9b5a19347b45ec607fabe75f98c6c4ba9badaab9c193ce",
    urls = ["https://github.com/bazelbuild/rules_rust/releases/download/0.17.0/rules_rust-v0.17.0.tar.gz"],
)
load("@rules_rust//rust:repositories.bzl", "rules_rust_dependencies", "rust_register_toolchains")

rust_register_toolchains(
    edition = "2021",
)

rules_rust_dependencies()

load("@rules_rust//crate_universe:repositories.bzl", "crate_universe_dependencies")
crate_universe_dependencies(bootstrap = True)

load("@rules_rust//crate_universe:defs.bzl", "crate", "crates_repository", "splicing_config")
load("@rules_rust//crate_universe:defs.bzl", "crates_repository", "crate")
crates_repository(
    name = "crate_index_protobuf",
    cargo_lockfile = "//:Cargo.lock",
    generator = "@cargo_bazel_bootstrap//:cargo-bazel",
    lockfile = "//:cargo-bazel-lock.json",
    manifests = [
        "//:Cargo.toml"
    ],
)

load("@crate_index_protobuf//:defs.bzl", "crate_repositories")
crate_repositories()

http_archive(
    name = "io_bazel_rules_docker",
    sha256 = "b1e80761a8a8243d03ebca8845e9cc1ba6c82ce7c5179ce2b295cd36f7e394bf",
    urls = ["https://github.com/bazelbuild/rules_docker/releases/download/v0.25.0/rules_docker-v0.25.0.tar.gz"],
)

load("@rules_rust//rust:repositories.bzl", "rust_repositories")

rust_repositories()

load(
    "@io_bazel_rules_docker//repositories:repositories.bzl",
    container_repositories = "repositories",
)

container_repositories()

load("@io_bazel_rules_docker//repositories:deps.bzl", container_deps = "deps")

container_deps()

load(
    "@io_bazel_rules_docker//rust:image.bzl",
    _rust_image_repos = "repositories",
)

_rust_image_repos()