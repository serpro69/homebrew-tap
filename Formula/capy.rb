class Capy < Formula
  desc "Context-aware MCP server for LLM context reduction"
  homepage "https://github.com/serpro69/capy"
  version "0.10.1"
  license "Elastic-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/serpro69/capy/releases/download/v0.10.1/capy_0.10.1_darwin_arm64.tar.gz"
      sha256 "1b39d9a7a931c29ba329d385d600271421328461c12b774b22b3e404157ab477"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/serpro69/capy/releases/download/v0.10.1/capy_0.10.1_linux_arm64.tar.gz"
      sha256 "3a0d92cb347b3c6e1e923e1ecc5a96a7d210aa58f55c10e95634712b1f6e44e3"
    elsif Hardware::CPU.intel?
      url "https://github.com/serpro69/capy/releases/download/v0.10.1/capy_0.10.1_linux_amd64.tar.gz"
      sha256 "e86ba14bd8710a244dedb0e7f7d98e0d94d716a8b47905d2dc48213d739d381a"
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
