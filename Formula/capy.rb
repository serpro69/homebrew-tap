class Capy < Formula
  desc "Context-aware MCP server for LLM context reduction"
  homepage "https://github.com/serpro69/capy"
  version "0.3.0"
  license "Elastic-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/serpro69/capy/releases/download/v0.3.0/capy_0.3.0_darwin_arm64.tar.gz"
      sha256 "2484f966a5c5eb107e20b1ea517fb53a392d355c6789afd69c41a551ffb5d5f6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/serpro69/capy/releases/download/v0.3.0/capy_0.3.0_linux_arm64.tar.gz"
      sha256 "cb05405c357f4406caf43af42e252369b71c995d70472f3e2a086710ff255166"
    elsif Hardware::CPU.intel?
      url "https://github.com/serpro69/capy/releases/download/v0.3.0/capy_0.3.0_linux_amd64.tar.gz"
      sha256 "1bcab0e5bc6bdcd640dc367472800dd5fe49282058474d239e6e6049ebc32c4d"
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
