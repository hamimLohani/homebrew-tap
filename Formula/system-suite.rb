class SystemSuite < Formula
  desc "Terminal-based system maintenance and monitoring toolkit"
  homepage "https://github.com/hamim-24/system_suite"
  url "https://github.com/hamim-24/system_suite/archive/refs/tags/v1.2.0.tar.gz"
  sha256 "758ab09000c90b551783cd79e1530e6c0f2403b8d781fb3e44f40e001ead407c"
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
