class Acpica < Formula
  desc "OS-independent implementation of the ACPI specification"
  homepage "https://www.acpica.org/"
  url "https://acpica.org/sites/acpica/files/acpica-unix-20210331.tar.gz"
  sha256 "b49237a2c3df58b57310612ec3a6ebee69e1a525b5efeec7152faf32a03b7068"
  license any_of: ["Intel-ACPI", "GPL-2.0-only", "BSD-3-Clause"]
  head "https://github.com/acpica/acpica.git"

  livecheck do
    url "https://acpica.org/downloads"
    regex(/current release of ACPICA is version <strong>v?(\d{6,8}) </i)
  end

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_big_sur: "981ccd20f769657e066a915afbefe4db83b5b292b8580017939e305d40b72923"
    sha256 cellar: :any_skip_relocation, big_sur:       "ea6c345fc7d1e7e7b0b4ec11230cd82272289837a0bdd1eda6e77bf7a8da3cb7"
    sha256 cellar: :any_skip_relocation, catalina:      "039f6aac0aa654c064d4115c365f95c924e064eb8f9d29560f68eaf0848131e6"
    sha256 cellar: :any_skip_relocation, mojave:        "c8a1a05b4aaf62c6d022a288da490366dcf8f5d6258e52a4dcbe77ef862077fa"
  end

  uses_from_macos "bison" => :build
  uses_from_macos "flex" => :build
  uses_from_macos "m4" => :build

  def install
    ENV.deparallelize
    system "make", "PREFIX=#{prefix}"
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    system "#{bin}/acpihelp", "-u"
  end
end
