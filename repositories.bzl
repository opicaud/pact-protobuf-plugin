load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")
load("@bazel_tools//tools/build_defs/repo:git.bzl","git_repository")

def repos():
    maybe(
        http_archive,
        name = "rules_rust",
        sha256 = "d125fb75432dc3b20e9b5a19347b45ec607fabe75f98c6c4ba9badaab9c193ce",
        urls = ["https://github.com/bazelbuild/rules_rust/releases/download/0.17.0/rules_rust-v0.17.0.tar.gz"],
    )

    maybe(
        git_repository,
        name = "source_protobuf",
        remote = "https://github.com/opicaud/pact-protobuf-plugin",
        commit = "fe83f2688d5fa12e67e58b348b6a83806dd7e2af",
        shallow_since = "1684236709 +0200"
    )
