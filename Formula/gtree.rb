class Gtree < Formula
  desc "Scan your directory tree for git repositories and display their status"
  homepage "https://github.com/hamimLohani/gtree"
  url "https://github.com/hamimlohani/gtree/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "6ca070125792e00a87fd887b750176eedf59cf7a71983e82e6db0a9f16aa7c6f"
  license "MIT"
  head "https://github.com/hamimlohani/gtree.git", branch: "main"

  depends_on "go" => :build
  depends_on "git"

  def install
    ldflags = %W[
      -s -w
      -X github.com/hamimlohani/gtree/cmd.Version=#{version}
      -X github.com/hamimlohani/gtree/cmd.BuildDate=#{time.iso8601}
    ]
    system "go", "build", *std_go_args(ldflags: ldflags), "."
    man1.install Dir["man/*.1"] if Dir.exist?("man")
  end

  test do
    assert_match "gtree", shell_output("#{bin}/gtree --version")
    system bin/"gtree", testpath.to_s, "--depth", "1"
  end
end
