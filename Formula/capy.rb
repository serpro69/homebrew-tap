class Capy < Formula
  desc "Context-aware MCP server for LLM context reduction"
  homepage "https://github.com/serpro69/capy"
  version "0.13.0"
  license "Elastic-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/serpro69/capy/releases/download/v0.13.0/capy_0.13.0_darwin_arm64.tar.gz"
      sha256 "590e5dd9b290babc97e4a773bee2c9e1f88f658e6cb83ab471561cc2e48f54ff"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/serpro69/capy/releases/download/v0.13.0/capy_0.13.0_linux_arm64.tar.gz"
      sha256 "17a18ab7c57b71f91c04eed6f999a1aecf8e19d39f9e8da83b69e6db71d4996c"
    elsif Hardware::CPU.intel?
      url "https://github.com/serpro69/capy/releases/download/v0.13.0/capy_0.13.0_linux_amd64.tar.gz"
      sha256 "76d70af1cf6dba04d79d8e3a1d1cad6d80bab69bff870b4530749aea4df70e45"
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
