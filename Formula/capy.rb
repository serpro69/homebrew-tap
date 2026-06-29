class Capy < Formula
  desc "Context-aware MCP server for LLM context reduction"
  homepage "https://github.com/serpro69/capy"
  version "0.11.1"
  license "Elastic-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/serpro69/capy/releases/download/v0.11.1/capy_0.11.1_darwin_arm64.tar.gz"
      sha256 "ff5ca8147a6533686149eeef04caa6180f285e95b1d3fee26fc41f18236c0550"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/serpro69/capy/releases/download/v0.11.1/capy_0.11.1_linux_arm64.tar.gz"
      sha256 "6623d065c21859268c578e8dcc35ffe23ea416bdacecaac57a4abf81eecbf732"
    elsif Hardware::CPU.intel?
      url "https://github.com/serpro69/capy/releases/download/v0.11.1/capy_0.11.1_linux_amd64.tar.gz"
      sha256 "c15614d76a9a96a90ae098792fe4ae8d04293f4f5ca263aea2e5cacd4278956c"
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
