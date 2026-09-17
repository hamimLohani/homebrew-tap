class Gtree < Formula
  desc "Scan your directory tree for git repositories and display their status"
  homepage "https://github.com/hamimLohani/gtree"
  license "MIT"
  head "https://github.com/hamimLohani/gtree.git", branch: "main"

  depends_on "go" => :build
  depends_on "git"

  def install
    ldflags = %W[
      -s -w
      -X github.com/hamimlohani/gtree/cmd.Version=#{version}
      -X github.com/hamimlohani/gtree/cmd.BuildDate=#{time.iso8601}
    ]
    system "go", "build", *std_go_args(ldflags: ldflags), "."
  end

  test do
    assert_match "gtree", shell_output("#{bin}/gtree --version")
    system bin/"gtree", testpath.to_s, "--depth", "1"
  end
end
