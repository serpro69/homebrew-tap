class Capy < Formula
  desc "Context-aware MCP server for LLM context reduction"
  homepage "https://github.com/serpro69/capy"
  version "0.5.1"
  license "Elastic-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/serpro69/capy/releases/download/v0.5.1/capy_0.5.1_darwin_arm64.tar.gz"
      sha256 "d95fd4a11c824733f0bef503dfeb655ae98159ddd11eb7cd486cdffc884e5f8d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/serpro69/capy/releases/download/v0.5.1/capy_0.5.1_linux_arm64.tar.gz"
      sha256 "90436188d5c3626682a1b553e2edd3043262ee6c888249c89a45d18fde6a155e"
    elsif Hardware::CPU.intel?
      url "https://github.com/serpro69/capy/releases/download/v0.5.1/capy_0.5.1_linux_amd64.tar.gz"
      sha256 "9444bcdf29917ffd51faa73f1389663d9039d0d8af1c6589b0fefa2a342f20a0"
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
