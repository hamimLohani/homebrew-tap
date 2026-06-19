class SystemSuite < Formula
  desc "Terminal-based system maintenance and monitoring toolkit"
  homepage "https://github.com/hamimLohani/system_suite"
  url "https://github.com/hamimLohani/system_suite/archive/refs/tags/v1.2.0.tar.gz"
  sha256 "b1f7cc1d9f189a88101fcd920372154bd0cc1fd6490da1a825a8a22ad1f95712"
  license "MIT"
  version "1.2.0"

  depends_on "bash"

  def install
    bin.install "system_suite.sh" => "system-suite"
  end

  test do
    assert_match "System Suite v#{version}", shell_output("#{bin}/system-suite --version")
    system "#{bin}/system-suite", "--help"
  end
end
