load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive", "http_file")
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
        branch = "main"
    )

    maybe(
        http_file,
        name = "pact_prototuf_plugin_archive",
        sha256 = "e3b09357c4ca793b7f0d78716ffe18916a7e72ed346ca549dfed79a4ff85cfc3",
        urls = ["https://github.com/pactflow/pact-protobuf-plugin/releases/download/v-0.3.5/pact-protobuf-plugin-osx-x86_64.gz"],
    )

    maybe(
        http_file,
        name = "pact_plugin_json_archive",
        sha256 = "70fa091ec6728d0077470d7ab1125be02b9b8211b73a552ea37f14e0276b7a52",
        urls = ["https://github.com/pactflow/pact-protobuf-plugin/releases/download/v-0.3.5/pact-plugin.json"],
    )
