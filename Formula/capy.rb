class Capy < Formula
  desc "Context-aware MCP server for LLM context reduction"
  homepage "https://github.com/serpro69/capy"
  version "0.16.2"
  license "Elastic-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/serpro69/capy/releases/download/v0.16.2/capy_0.16.2_darwin_arm64.tar.gz"
      sha256 "c641988c4eb48f057fe4882ddf3e597c516b94d0184d7b6d95b0f6d73ebbc69c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/serpro69/capy/releases/download/v0.16.2/capy_0.16.2_linux_arm64.tar.gz"
      sha256 "cdaa2c04b3dbd5ac6a076bbdcf7accfea2607ccf7379a635729229304307353c"
    elsif Hardware::CPU.intel?
      url "https://github.com/serpro69/capy/releases/download/v0.16.2/capy_0.16.2_linux_amd64.tar.gz"
      sha256 "178d66310313955aafc2148d9dc686d556151d87b521b7d1065877cdc8bca869"
    end
  end

  def install
    bin.install "capy"
    generate_completions_from_executable(bin/"capy", shell_parameter_format: :cobra)
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/capy --version")
  end
end
