class SystemSuite < Formula
  desc "Terminal-based system maintenance and monitoring toolkit"
  homepage "https://github.com/hamimLohani/system_suite"
  url "https://github.com/hamimLohani/system_suite/archive/refs/tags/v1.2.1.tar.gz"
  version "1.2.1"
  sha256 "a2b55f872c316da2753bd5ef20753a3b53ec0b9b69b8fef49363225126730f3e"
  license "MIT"

  depends_on "bash"

  def install
    bin.install "system_suite.sh" => "system-suite"
  end

  test do
    assert_match "System Suite v#{version}", shell_output("#{bin/"system-suite"} --version")
    system bin/"system-suite", "--help"
  end
end
