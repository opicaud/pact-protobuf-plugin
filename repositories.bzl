load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")
load("@bazel_tools//tools/build_defs/repo:git.bzl","git_repository")

def repos():
    maybe(
        http_archive,
        name = "rules_rust",
        sha256 = "4a9cb4fda6ccd5b5ec393b2e944822a62e050c7c06f1ea41607f14c4fdec57a2",
        urls = ["https://github.com/bazelbuild/rules_rust/releases/download/0.25.1/rules_rust-v0.25.1.tar.gz"],
    )

    maybe(
        git_repository,
        name = "source_protobuf",
        remote = "https://github.com/opicaud/pact-protobuf-plugin",
        commit = "3a2b8b621beb044b675c5809389844a304574370",
    )

