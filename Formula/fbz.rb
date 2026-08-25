class Fbz < Formula
  desc "Fast parallel compression and decompression"
  homepage "https://github.com/AnswerDotAI/fbz"
  url "https://static.crates.io/crates/fbz/fbz-0.1.9.crate"
  sha256 "c2ad6dfdee1fb584e74abc13feceb5f0361c7d37a08b7c6b157c04d9b3499968"
  license "Apache-2.0"
  head "https://github.com/AnswerDotAI/fbz.git", branch: "main"

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
