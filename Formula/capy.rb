class Capy < Formula
  desc "Context-aware MCP server for LLM context reduction"
  homepage "https://github.com/serpro69/capy"
  version "0.8.0"
  license "Elastic-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/serpro69/capy/releases/download/v0.8.0/capy_0.8.0_darwin_arm64.tar.gz"
      sha256 "dc5bfe64127348a7890aa074472432a2ef07a927e1d1a2141bd1ca81357d6ca1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/serpro69/capy/releases/download/v0.8.0/capy_0.8.0_linux_arm64.tar.gz"
      sha256 "5ee7c4af827e1232c9f807d36d6b160552f5e0f3c3b6a401341ea9ee07b36c47"
    elsif Hardware::CPU.intel?
      url "https://github.com/serpro69/capy/releases/download/v0.8.0/capy_0.8.0_linux_amd64.tar.gz"
      sha256 "08199b03d85f92aeeacfdffa111217b9d68c9e8274cddbdbee48f61c66656329"
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
