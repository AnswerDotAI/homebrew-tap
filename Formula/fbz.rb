class Fbz < Formula
  desc "Fast parallel compression and decompression"
  homepage "https://github.com/AnswerDotAI/fbz"
  url "https://static.crates.io/crates/fbz/fbz-0.1.12.crate"
  sha256 "2a8974dccb1145946e37b31b83ec6e8603a7ca5b780815891a080fddeef0eb5f"
  license "Apache-2.0"
  head "https://github.com/AnswerDotAI/fbz.git", branch: "main"

  bottle do
    root_url "https://github.com/AnswerDotAI/homebrew-tap/releases/download/fbz-0.1.10"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "bb172df5405fd9b089f570c2eabaddbe78b60d43480abde327664c1a1d08119a"
    sha256 cellar: :any,                 x86_64_linux: "c639e6c78f14108980af4286954258ef22aa0ac9a0fd7d0897ae7dc32af244b9"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    contents = "hello from fbz\n" * 1_000
    (testpath/"input").write(contents)
    system bin/"fbz", "-z", "--format", "gzip", testpath/"input", "-o", testpath/"input.gz"
    system bin/"fbz", testpath/"input.gz", "-o", testpath/"decoded"
    assert_equal contents, (testpath/"decoded").read
  end
end
