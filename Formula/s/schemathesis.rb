class Schemathesis < Formula
  include Language::Python::Virtualenv

  desc "Testing tool for web applications with specs"
  homepage "https://schemathesis.readthedocs.io/"
  url "https://files.pythonhosted.org/packages/f6/63/8f08ebb76fe1face6a92d28ef0566ac06c86de7ed8be47413a3b99eb4749/schemathesis-3.31.0.tar.gz"
  sha256 "334068ff2d39f6bad46cd61e6e1fb64e55042da9fc727a5ba8d5e2789fbf73a6"
  license "MIT"

  bottle do
    sha256 cellar: :any,                 arm64_sonoma:   "05aa780dddd4952cb35bb57cf4245fc52e0f3538bdc49891575457cdd2ffc7e4"
    sha256 cellar: :any,                 arm64_ventura:  "3e170aa20a1f282b7cdc8ffe463fea5fa3c7b4317a1676b010ab518af22d3881"
    sha256 cellar: :any,                 arm64_monterey: "074d66b64e575b50fff229c1b465528542f36f1ecf1f2b64870328fd6c95aa99"
    sha256 cellar: :any,                 sonoma:         "bfae6cb5eb1cba10fa5bfdf07c150ecfc58cd505d7160ff7245539222b34a288"
    sha256 cellar: :any,                 ventura:        "b7f3f9dea767f0a336c24917717c497977eec89c25e58f58f63a26bf10921057"
    sha256 cellar: :any,                 monterey:       "604582251bee99246567513213f49601b908c6c844aecc5542af94988a0beccc"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "78e53a3d270be809e481d4ae97e5113433df10119dcaaec8eb9a69c24e8c783f"
  end

  depends_on "rust" => :build # for rpds-py
  depends_on "certifi"
  depends_on "libyaml"
  depends_on "python@3.12"

  resource "anyio" do
    url "https://files.pythonhosted.org/packages/e6/e3/c4c8d473d6780ef1853d630d581f70d655b4f8d7553c6997958c283039a2/anyio-4.4.0.tar.gz"
    sha256 "5aadc6a1bbb7cdb0bede386cac5e2940f5e2ff3aa20277e991cf028e0585ce94"
  end

  resource "attrs" do
    url "https://files.pythonhosted.org/packages/e3/fc/f800d51204003fa8ae392c4e8278f256206e7a919b708eef054f5f4b650d/attrs-23.2.0.tar.gz"
    sha256 "935dc3b529c262f6cf76e50877d35a4bd3c1de194fd41f47a2b7ae8f19971f30"
  end

  resource "backoff" do
    url "https://files.pythonhosted.org/packages/47/d7/5bbeb12c44d7c4f2fb5b56abce497eb5ed9f34d85701de869acedd602619/backoff-2.2.1.tar.gz"
    sha256 "03f829f5bb1923180821643f8753b0502c3b682293992485b0eef2807afa5cba"
  end

  resource "charset-normalizer" do
    url "https://files.pythonhosted.org/packages/63/09/c1bc53dab74b1816a00d8d030de5bf98f724c52c1635e07681d312f20be8/charset-normalizer-3.3.2.tar.gz"
    sha256 "f30c3cb33b24454a82faecaf01b19c18562b1e89558fb6c56de4d9118a032fd5"
  end

  resource "click" do
    url "https://files.pythonhosted.org/packages/96/d3/f04c7bfcf5c1862a2a5b845c6b2b360488cf47af55dfa79c98f6a6bf98b5/click-8.1.7.tar.gz"
    sha256 "ca9853ad459e787e2192211578cc907e7594e294c7ccc834310722b41b9ca6de"
  end

  resource "colorama" do
    url "https://files.pythonhosted.org/packages/d8/53/6f443c9a4a8358a93a6792e2acffb9d9d5cb0a5cfd8802644b7b1c9a02e4/colorama-0.4.6.tar.gz"
    sha256 "08695f5cb7ed6e0531a20572697297273c47b8cae5a63ffc6d6ed5c201be6e44"
  end

  resource "graphql-core" do
    url "https://files.pythonhosted.org/packages/ee/a6/94df9045ca1bac404c7b394094cd06713f63f49c7a4d54d99b773ae81737/graphql-core-3.2.3.tar.gz"
    sha256 "06d2aad0ac723e35b1cb47885d3e5c45e956a53bc1b209a9fc5369007fe46676"
  end

  resource "h11" do
    url "https://files.pythonhosted.org/packages/f5/38/3af3d3633a34a3316095b39c8e8fb4853a28a536e55d347bd8d8e9a14b03/h11-0.14.0.tar.gz"
    sha256 "8f19fbbe99e72420ff35c00b27a34cb9937e902a8b810e2c88300c6f0a3b699d"
  end

  resource "harfile" do
    url "https://files.pythonhosted.org/packages/6d/0f/fc074af5572e3faeadce77c9bc82d7bd3bacd522ffae8f76599ecf1af8e3/harfile-0.3.0.tar.gz"
    sha256 "23be8037e1296bb4787a15543a37835ed91f408c8296988f9ba022a44accad9e"
  end

  resource "httpcore" do
    url "https://files.pythonhosted.org/packages/17/b0/5e8b8674f8d203335a62fdfcfa0d11ebe09e23613c3391033cbba35f7926/httpcore-1.0.5.tar.gz"
    sha256 "34a38e2f9291467ee3b44e89dd52615370e152954ba21721378a87b2960f7a61"
  end

  resource "httpx" do
    url "https://files.pythonhosted.org/packages/5c/2d/3da5bdf4408b8b2800061c339f240c1802f2e82d55e50bd39c5a881f47f0/httpx-0.27.0.tar.gz"
    sha256 "a0cb88a46f32dc874e04ee956e4c2764aba2aa228f650b06788ba6bda2962ab5"
  end

  resource "hypothesis" do
    url "https://files.pythonhosted.org/packages/b5/54/8fa003725080d9d2c575e8007342f2c9276194d48e7961534b8972a6d480/hypothesis-6.104.2.tar.gz"
    sha256 "6f2a1489bc8fe1c87ffd202707319b66ec46b2bc11faf6e0161e957b8b9b1eab"
  end

  resource "hypothesis-graphql" do
    url "https://files.pythonhosted.org/packages/d7/d2/d81cf17dfdd83482dd13c0e1e22f38375db2e14affae5f9f1e23e57db78c/hypothesis_graphql-0.11.0.tar.gz"
    sha256 "a1a1b693170591dd37d9b40a94e6f37181770c21cebad993e2e14e58ddfebaba"
  end

  resource "hypothesis-jsonschema" do
    url "https://files.pythonhosted.org/packages/4f/ad/2073dd29d8463a92c243d0c298370e50e0d4082bc67f156dc613634d0ec4/hypothesis-jsonschema-0.23.1.tar.gz"
    sha256 "f4ac032024342a4149a10253984f5a5736b82b3fe2afb0888f3834a31153f215"
  end

  resource "idna" do
    url "https://files.pythonhosted.org/packages/21/ed/f86a79a07470cb07819390452f178b3bef1d375f2ec021ecfc709fc7cf07/idna-3.7.tar.gz"
    sha256 "028ff3aadf0609c1fd278d8ea3089299412a7a8b9bd005dd08b9f8285bcb5cfc"
  end

  resource "iniconfig" do
    url "https://files.pythonhosted.org/packages/d7/4b/cbd8e699e64a6f16ca3a8220661b5f83792b3017d0f79807cb8708d33913/iniconfig-2.0.0.tar.gz"
    sha256 "2d91e135bf72d31a410b17c16da610a82cb55f6b0477d1a902134b24a455b8b3"
  end

  resource "jsonschema" do
    url "https://files.pythonhosted.org/packages/19/f1/1c1dc0f6b3bf9e76f7526562d29c320fa7d6a2f35b37a1392cc0acd58263/jsonschema-4.22.0.tar.gz"
    sha256 "5b22d434a45935119af990552c862e5d6d564e8f6601206b305a61fdf661a2b7"
  end

  resource "jsonschema-specifications" do
    url "https://files.pythonhosted.org/packages/f8/b9/cc0cc592e7c195fb8a650c1d5990b10175cf13b4c97465c72ec841de9e4b/jsonschema_specifications-2023.12.1.tar.gz"
    sha256 "48a76787b3e70f5ed53f1160d2b81f586e4ca6d1548c5de7085d1682674764cc"
  end

  resource "junit-xml" do
    url "https://files.pythonhosted.org/packages/98/af/bc988c914dd1ea2bc7540ecc6a0265c2b6faccc6d9cdb82f20e2094a8229/junit-xml-1.9.tar.gz"
    sha256 "de16a051990d4e25a3982b2dd9e89d671067548718866416faec14d9de56db9f"
  end

  resource "markupsafe" do
    url "https://files.pythonhosted.org/packages/87/5b/aae44c6655f3801e81aa3eef09dbbf012431987ba564d7231722f68df02d/MarkupSafe-2.1.5.tar.gz"
    sha256 "d283d37a890ba4c1ae73ffadf8046435c76e7bc2247bbb63c00bd1a709c6544b"
  end

  resource "multidict" do
    url "https://files.pythonhosted.org/packages/f9/79/722ca999a3a09a63b35aac12ec27dfa8e5bb3a38b0f857f7a1a209a88836/multidict-6.0.5.tar.gz"
    sha256 "f7e301075edaf50500f0b341543c41194d8df3ae5caf4702f2095f3ca73dd8da"
  end

  resource "packaging" do
    url "https://files.pythonhosted.org/packages/51/65/50db4dda066951078f0a96cf12f4b9ada6e4b811516bf0262c0f4f7064d4/packaging-24.1.tar.gz"
    sha256 "026ed72c8ed3fcce5bf8950572258698927fd1dbda10a5e981cdf0ac37f4f002"
  end

  resource "pluggy" do
    url "https://files.pythonhosted.org/packages/96/2d/02d4312c973c6050a18b314a5ad0b3210edb65a906f868e31c111dede4a6/pluggy-1.5.0.tar.gz"
    sha256 "2cffa88e94fdc978c4c574f15f9e59b7f4201d439195c3715ca9e2486f1d0cf1"
  end

  resource "pyrate-limiter" do
    url "https://files.pythonhosted.org/packages/30/ec/7e53e6b1f0737976e942fc1f7c42e97f9906b79522983f49f90f44c72fa7/pyrate_limiter-3.6.1.tar.gz"
    sha256 "78bdaaf31d76ffb3f6e9b9d26d676a52824492b9f4578d48530d1fa657ac6d8f"
  end

  resource "pytest" do
    url "https://files.pythonhosted.org/packages/a6/58/e993ca5357553c966b9e73cb3475d9c935fe9488746e13ebdf9b80fae508/pytest-8.2.2.tar.gz"
    sha256 "de4bb8104e201939ccdc688b27a89a7be2079b22e2bd2b07f806b6ba71117977"
  end

  resource "pytest-subtests" do
    url "https://files.pythonhosted.org/packages/b9/ea/3971817de038f8a03e8a1d1833ce5708965c67bacf1455d140f836c6f7f4/pytest-subtests-0.7.0.tar.gz"
    sha256 "95c44c77e3fbede9848bb88ca90b384815fcba8090ef9a9f55659ab163b1681c"
  end

  resource "pyyaml" do
    url "https://files.pythonhosted.org/packages/cd/e5/af35f7ea75cf72f2cd079c95ee16797de7cd71f29ea7c68ae5ce7be1eda0/PyYAML-6.0.1.tar.gz"
    sha256 "bfdf460b1736c775f2ba9f6a92bca30bc2095067b8a9d77876d1fad6cc3b4a43"
  end

  resource "referencing" do
    url "https://files.pythonhosted.org/packages/99/5b/73ca1f8e72fff6fa52119dbd185f73a907b1989428917b24cff660129b6d/referencing-0.35.1.tar.gz"
    sha256 "25b42124a6c8b632a425174f24087783efb348a6f1e0008e63cd4466fedf703c"
  end

  resource "requests" do
    url "https://files.pythonhosted.org/packages/63/70/2bf7780ad2d390a8d301ad0b550f1581eadbd9a20f896afe06353c2a2913/requests-2.32.3.tar.gz"
    sha256 "55365417734eb18255590a9ff9eb97e9e1da868d4ccd6402399eaf68af20a760"
  end

  resource "rpds-py" do
    url "https://files.pythonhosted.org/packages/2d/aa/e7c404bdee1db7be09860dff423d022ffdce9269ec8e6532cce09ee7beea/rpds_py-0.18.1.tar.gz"
    sha256 "dc48b479d540770c811fbd1eb9ba2bb66951863e448efec2e2c102625328e92f"
  end

  resource "six" do
    url "https://files.pythonhosted.org/packages/71/39/171f1c67cd00715f190ba0b100d606d440a28c93c7714febeca8b79af85e/six-1.16.0.tar.gz"
    sha256 "1e61c37477a1626458e36f7b1d82aa5c9b094fa4802892072e49de9c60c4c926"
  end

  resource "sniffio" do
    url "https://files.pythonhosted.org/packages/a2/87/a6771e1546d97e7e041b6ae58d80074f81b7d5121207425c964ddf5cfdbd/sniffio-1.3.1.tar.gz"
    sha256 "f4324edc670a0f49750a81b895f35c3adb843cca46f0530f79fc1babb23789dc"
  end

  resource "sortedcontainers" do
    url "https://files.pythonhosted.org/packages/e8/c4/ba2f8066cceb6f23394729afe52f3bf7adec04bf9ed2c820b39e19299111/sortedcontainers-2.4.0.tar.gz"
    sha256 "25caa5a06cc30b6b83d11423433f65d1f9d76c4c6a0c90e3379eaa43b9bfdb88"
  end

  resource "starlette" do
    url "https://files.pythonhosted.org/packages/61/b5/6bceb93ff20bd7ca36e6f7c540581abb18f53130fabb30ba526e26fd819b/starlette-0.37.2.tar.gz"
    sha256 "9af890290133b79fc3db55474ade20f6220a364a0402e0b556e7cd5e1e093823"
  end

  resource "starlette-testclient" do
    url "https://files.pythonhosted.org/packages/cd/64/6debec8fc6e9abde0c7042145dc27a562bd1cd79350a55b80bf612a10ccb/starlette_testclient-0.4.1.tar.gz"
    sha256 "9e993ffe12fab45606116257813986612262fe15c1bb6dc9e39cc68693ac1fc5"
  end

  resource "tomli" do
    url "https://files.pythonhosted.org/packages/c0/3f/d7af728f075fb08564c5949a9c95e44352e23dee646869fa104a3b2060a3/tomli-2.0.1.tar.gz"
    sha256 "de526c12914f0c550d15924c62d72abc48d6fe7364aa87328337a31007fe8a4f"
  end

  resource "tomli-w" do
    url "https://files.pythonhosted.org/packages/49/05/6bf21838623186b91aedbda06248ad18f03487dc56fbc20e4db384abde6c/tomli_w-1.0.0.tar.gz"
    sha256 "f463434305e0336248cac9c2dc8076b707d8a12d019dd349f5c1e382dd1ae1b9"
  end

  resource "urllib3" do
    url "https://files.pythonhosted.org/packages/43/6d/fa469ae21497ddc8bc93e5877702dca7cb8f911e337aca7452b5724f1bb6/urllib3-2.2.2.tar.gz"
    sha256 "dd505485549a7a552833da5e6063639d0d177c04f23bc3864e41e5dc5f612168"
  end

  resource "werkzeug" do
    url "https://files.pythonhosted.org/packages/02/51/2e0fc149e7a810d300422ab543f87f2bcf64d985eb6f1228c4efd6e4f8d4/werkzeug-3.0.3.tar.gz"
    sha256 "097e5bfda9f0aba8da6b8545146def481d06aa7d3266e7448e2cccf67dd8bd18"
  end

  resource "yarl" do
    url "https://files.pythonhosted.org/packages/e0/ad/bedcdccbcbf91363fd425a948994f3340924145c2bc8ccb296f4a1e52c28/yarl-1.9.4.tar.gz"
    sha256 "566db86717cf8080b99b58b083b773a908ae40f06681e87e589a976faf8246bf"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    (testpath/"example.json").write <<~EOS
      {
        "openapi": "3.0.3",
        "paths": {}
      }
    EOS
    output = shell_output("#{bin}/st run ./example.json --dry-run")
    assert_match "Schemathesis test session starts", output
    assert_match "Specification version: Open API 3.0.3", output
    assert_match "No checks were performed.", output
  end
end
