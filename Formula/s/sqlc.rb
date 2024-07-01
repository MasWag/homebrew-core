class Sqlc < Formula
  desc "Generate type safe Go from SQL"
  homepage "https://sqlc.dev/"
  url "https://github.com/sqlc-dev/sqlc/archive/refs/tags/v1.26.0.tar.gz"
  sha256 "8e730d4e145ac90c32f1c06eac9b831f425aacc616a898bc9d2d174dc8f39359"
  license "MIT"
  head "https://github.com/sqlc-dev/sqlc.git", branch: "main"

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_sonoma:   "5572a0e7b33f890bb42a981b6b448467b4c00701687c26237b9b46e328e21bee"
    sha256 cellar: :any_skip_relocation, arm64_ventura:  "5eddc1f5497ae7f6ad4174e6f6b874ed85a27c0d3e9fe49838fbf56aaa7972e8"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "96c9cbf6e6f6d0daf5747c07f16fcdc636aa12c3c9af5bd3ea87f0bf941b7656"
    sha256 cellar: :any_skip_relocation, sonoma:         "66e3eee3d5f95131470af94a524b3f15d41678ab551a37c43063f5b449589387"
    sha256 cellar: :any_skip_relocation, ventura:        "f871928b226f1488f655cfd4b8b4243032614d38dfbe59ff9ef965171573d829"
    sha256 cellar: :any_skip_relocation, monterey:       "c1f5995d992f4d2ac891c77dca9b675a741750c50b2c3ffbd4c845e8c59f643e"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "5c8e1d6ad0fb85cf2d584eeb8c382e655c9274ca6c11f2edf2d723f0e44e2645"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "./cmd/sqlc"

    generate_completions_from_executable(bin/"sqlc", "completion")
  end

  test do
    (testpath/"sqlc.json").write <<~SQLC
      {
        "version": "1",
        "packages": [
          {
            "name": "db",
            "path": ".",
            "queries": "query.sql",
            "schema": "query.sql",
            "engine": "postgresql"
          }
        ]
      }
    SQLC

    (testpath/"query.sql").write <<~EOS
      CREATE TABLE foo (bar text);

      -- name: SelectFoo :many
      SELECT * FROM foo;
    EOS

    system bin/"sqlc", "generate"
    assert_predicate testpath/"db.go", :exist?
    assert_predicate testpath/"models.go", :exist?
    assert_match "// Code generated by sqlc. DO NOT EDIT.", File.read(testpath/"query.sql.go")
  end
end
