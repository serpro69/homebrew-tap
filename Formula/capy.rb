class Capy < Formula
  desc "Context-aware MCP server for LLM context reduction"
  homepage "https://github.com/serpro69/capy"
  version "0.1.1"
  license "Elastic-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/serpro69/capy/releases/download/v0.1.1/capy_0.1.1_darwin_arm64.tar.gz"
      sha256 "fffabaeb5af99e6742250f97123ca6a9be7cde6535349bc9780ada4e188238e1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/serpro69/capy/releases/download/v0.1.1/capy_0.1.1_linux_arm64.tar.gz"
      sha256 "df948578cf30897b6a54f048e7010086be60eb6328465eedc3cc3f9a6189bf32"
    elsif Hardware::CPU.intel?
      url "https://github.com/serpro69/capy/releases/download/v0.1.1/capy_0.1.1_linux_amd64.tar.gz"
      sha256 "28262e70c5ed00a9e0dc5830c1e5ff188fd58609e018d10fadec4417bc981259"
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
