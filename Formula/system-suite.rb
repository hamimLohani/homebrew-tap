class SystemSuite < Formula
  desc "Terminal-based system maintenance and monitoring toolkit"
  homepage "https://github.com/hamimLohani/system_suite"
  url "https://github.com/hamimLohani/system_suite/archive/refs/tags/v1.3.1.tar.gz"
  version "1.3.1"
  sha256 "9ffacbfb0ec79c4ea52a7eb968c640fe3ef6fe7e3859e365f92c3ca485b2969e"
  license "MIT"
  head "https://github.com/hamimlohani/system_suite.git", branch: "main"

  depends_on "bash"

  def install
    bin.install "system_suite.sh" => "system-suite"
    man1.install Dir["man/*.1"] if Dir.exist?("man")
    bash_completion.install "completions/system-suite.bash" => "system-suite" if File.exist?("completions/system-suite.bash")
    zsh_completion.install "completions/system-suite.zsh" => "_system-suite" if File.exist?("completions/system-suite.zsh")
  end

  test do
    assert_match "System Suite", shell_output("#{bin/"system-suite"} --version")
    system bin/"system-suite", "--help"
  end
end
