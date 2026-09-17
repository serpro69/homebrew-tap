class Capy < Formula
  desc "Context-aware MCP server for LLM context reduction"
  homepage "https://github.com/serpro69/capy"
  version "0.16.0"
  license "Elastic-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/serpro69/capy/releases/download/v0.16.0/capy_0.16.0_darwin_arm64.tar.gz"
      sha256 "093c3596256ca6ee0f166535316ce066077f09a64e8c645778531058e1321d58"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/serpro69/capy/releases/download/v0.16.0/capy_0.16.0_linux_arm64.tar.gz"
      sha256 "b8337cb7a47d5a4533c2f03d3ce09d1cfc203fa5ad248c76a5073d16cb4bfe5c"
    elsif Hardware::CPU.intel?
      url "https://github.com/serpro69/capy/releases/download/v0.16.0/capy_0.16.0_linux_amd64.tar.gz"
      sha256 "33590bf34ddf3040fb376d977ec546a4783167fdf285f966673f4d4612c08183"
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
