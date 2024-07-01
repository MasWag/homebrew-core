require "language/node"

class Copilot < Formula
  desc "CLI tool for Amazon ECS and AWS Fargate"
  homepage "https://aws.github.io/copilot-cli/"
  url "https://github.com/aws/copilot-cli.git",
      tag:      "v1.34.0",
      revision: "204bdba62d2e57d60868158d6a8c3bee2fba479f"
  license "Apache-2.0"
  head "https://github.com/aws/copilot-cli.git", branch: "mainline"

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_sonoma:   "8fc475e69d0ded4336e64ef5a2fd1ed4e529395855e6a9793396fdcd63490419"
    sha256 cellar: :any_skip_relocation, arm64_ventura:  "03c0787759692dac390026739780ce95bb7d620506e40c3cc97b6a16aefb62b1"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "fbe01c17821a9a69ef225f3f1d8ecd6be8603899e0faea082296a75448567c6f"
    sha256 cellar: :any_skip_relocation, sonoma:         "bc263d1431a6f039c7598c58a4bc8108d5fed4ea36b5711614d35cf98c805389"
    sha256 cellar: :any_skip_relocation, ventura:        "b9e512e1f5e911b80712ac57ab2ea88aafa618802d56e12a841edebfb0c1399f"
    sha256 cellar: :any_skip_relocation, monterey:       "a469bb0b4f8faaa68cd01f530a6875e6128075c00810a5f8431034a530dd8e36"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "fa605d9516c08d36db9a01a42bc304f5e6a81a51af2edd77ac90228a1e87d28c"
  end

  depends_on "go" => :build
  depends_on "node" => :build

  def install
    Language::Node.setup_npm_environment

    system "make", "tools"
    system "make", "package-custom-resources"
    system "make", "build"

    bin.install "bin/local/copilot"

    generate_completions_from_executable(bin/"copilot", "completion")
  end

  test do
    ENV["AWS_ACCESS_KEY_ID"] = "test"
    ENV["AWS_SECRET_ACCESS_KEY"] = "test"
    begin
      _, stdout, wait_thr = Open3.popen2("AWS_REGION=eu-west-1 #{bin}/copilot init 2>&1")
      assert_match "Note: It's best to run this command in the root of your Git repository", stdout.gets("\n")
    ensure
      Process.kill 9, wait_thr.pid
    end

    assert_match "Run `copilot app init` to create an application",
      shell_output("AWS_REGION=eu-west-1 #{bin}/copilot pipeline init 2>&1", 1)
  end
end
