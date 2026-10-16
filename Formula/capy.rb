class Capy < Formula
  desc "Context-aware MCP server for LLM context reduction"
  homepage "https://github.com/serpro69/capy"
  version "0.17.2"
  license "Elastic-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/serpro69/capy/releases/download/v0.17.2/capy_0.17.2_darwin_arm64.tar.gz"
      sha256 "7f6512c35fea13bb31e8233ae1b3c1a6953d59c63df2f0144966e172e75b0263"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/serpro69/capy/releases/download/v0.17.2/capy_0.17.2_linux_arm64.tar.gz"
      sha256 "3f2e94592d3651cfd6c909229028a59f228ca2cb67d3023390ba0d9a267e0ae3"
    elsif Hardware::CPU.intel?
      url "https://github.com/serpro69/capy/releases/download/v0.17.2/capy_0.17.2_linux_amd64.tar.gz"
      sha256 "6eccf1963874b91deb2b1bf3df4d2f8c4e7f76da5b5f3c443cb7471ae541bc95"
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
