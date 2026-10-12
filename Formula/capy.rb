class Capy < Formula
  desc "Context-aware MCP server for LLM context reduction"
  homepage "https://github.com/serpro69/capy"
  version "0.17.0"
  license "Elastic-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/serpro69/capy/releases/download/v0.17.0/capy_0.17.0_darwin_arm64.tar.gz"
      sha256 "364c3bda0404e140ff5c797dbf7c1989f2e814657381c8b7ee76962d10ac0add"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/serpro69/capy/releases/download/v0.17.0/capy_0.17.0_linux_arm64.tar.gz"
      sha256 "46d7d62ee620c5c69ae1d5e4cb3a6c20ee2734863b32fbc87476802fea89f26c"
    elsif Hardware::CPU.intel?
      url "https://github.com/serpro69/capy/releases/download/v0.17.0/capy_0.17.0_linux_amd64.tar.gz"
      sha256 "9c61d6b2621e4502deae05145ad116f96d1a84ceb554c101872abed562082253"
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
