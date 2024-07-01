class Grokmirror < Formula
  include Language::Python::Virtualenv

  desc "Framework to smartly mirror git repositories"
  homepage "https://github.com/mricon/grokmirror"
  url "https://files.pythonhosted.org/packages/b0/ef/ffad6177d84dafb7403ccaca2fef735745d5d43200167896a2068422ae89/grokmirror-2.0.11.tar.gz"
  sha256 "6bc1310dc9a0e97836201e6bb14ecbbee332b0f812b9ff345a8386cb267c908c"
  license "GPL-3.0-or-later"
  revision 7
  head "https://github.com/mricon/grokmirror.git", branch: "master"

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_sonoma:   "876d748f82f612d1e03a8b388851f66723657d111f994ea3baecd25a55fd662b"
    sha256 cellar: :any_skip_relocation, arm64_ventura:  "876d748f82f612d1e03a8b388851f66723657d111f994ea3baecd25a55fd662b"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "876d748f82f612d1e03a8b388851f66723657d111f994ea3baecd25a55fd662b"
    sha256 cellar: :any_skip_relocation, sonoma:         "517640b908e4f0a45943066a9a1f892b1ff23c7b1db2fc37d57250c2cf5899e8"
    sha256 cellar: :any_skip_relocation, ventura:        "517640b908e4f0a45943066a9a1f892b1ff23c7b1db2fc37d57250c2cf5899e8"
    sha256 cellar: :any_skip_relocation, monterey:       "876d748f82f612d1e03a8b388851f66723657d111f994ea3baecd25a55fd662b"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "fa39b7c533aa0a674759cc9c6906ec07cfdbf0c930e76e63bd8df310705249c8"
  end

  depends_on "certifi"
  depends_on "python@3.12"

  resource "charset-normalizer" do
    url "https://files.pythonhosted.org/packages/63/09/c1bc53dab74b1816a00d8d030de5bf98f724c52c1635e07681d312f20be8/charset-normalizer-3.3.2.tar.gz"
    sha256 "f30c3cb33b24454a82faecaf01b19c18562b1e89558fb6c56de4d9118a032fd5"
  end

  resource "idna" do
    url "https://files.pythonhosted.org/packages/21/ed/f86a79a07470cb07819390452f178b3bef1d375f2ec021ecfc709fc7cf07/idna-3.7.tar.gz"
    sha256 "028ff3aadf0609c1fd278d8ea3089299412a7a8b9bd005dd08b9f8285bcb5cfc"
  end

  resource "requests" do
    url "https://files.pythonhosted.org/packages/63/70/2bf7780ad2d390a8d301ad0b550f1581eadbd9a20f896afe06353c2a2913/requests-2.32.3.tar.gz"
    sha256 "55365417734eb18255590a9ff9eb97e9e1da868d4ccd6402399eaf68af20a760"
  end

  resource "urllib3" do
    url "https://files.pythonhosted.org/packages/43/6d/fa469ae21497ddc8bc93e5877702dca7cb8f911e337aca7452b5724f1bb6/urllib3-2.2.2.tar.gz"
    sha256 "dd505485549a7a552833da5e6063639d0d177c04f23bc3864e41e5dc5f612168"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    mkdir "repos/repo" do
      system "git", "init"
      system "git", "config", "user.name", "BrewTestBot"
      system "git", "config", "user.email", "BrewTestBot@test.com"
      (testpath/"repos/repo/test").write "foo"
      system "git", "add", "test"
      system "git", "commit", "-m", "Initial commit"
      system "git", "config", "--bool", "core.bare", "true"
      mv testpath/"repos/repo/.git", testpath/"repos/repo.git"
    end
    rm_rf testpath/"repos/repo"

    system bin/"grok-manifest", "-m", testpath/"manifest.js.gz", "-t", testpath/"repos"
    system "gzip", "-d", testpath/"manifest.js.gz"
    refs = Utils.safe_popen_read("git", "--git-dir", testpath/"repos/repo.git", "show-ref")
    manifest = JSON.parse (testpath/"manifest.js").read
    assert_equal Digest::SHA1.hexdigest(refs), manifest["/repo.git"]["fingerprint"]
  end
end