class Fbz < Formula
  desc "Fast parallel compression and decompression"
  homepage "https://github.com/AnswerDotAI/fbz"
  url "https://static.crates.io/crates/fbz/fbz-0.1.10.crate"
  sha256 "8af05470c0d99d72c8f0d0cf85c90f80fcb346f9f37c9044c299da6781ad5d44"
  license "Apache-2.0"
  head "https://github.com/AnswerDotAI/fbz.git", branch: "main"

  bottle do
    root_url "https://github.com/AnswerDotAI/homebrew-tap/releases/download/fbz-0.1.9"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "685881291709765d46a68d404e4d3dd65374615f62e40b6df9d47c6d4d94098b"
    sha256 cellar: :any,                 x86_64_linux: "0b3ffe9ed81c7ac43914477724c8bc559fc0e1547be13bcfc2f9fd73aa96292c"
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
