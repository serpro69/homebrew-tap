class Capy < Formula
  desc "Context-aware MCP server for LLM context reduction"
  homepage "https://github.com/serpro69/capy"
  version "0.15.0"
  license "Elastic-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/serpro69/capy/releases/download/v0.15.0/capy_0.15.0_darwin_arm64.tar.gz"
      sha256 "0db7f78a00afeb3a17fde7a723e356f1bdd9bc5d6dc2ec4c653dc9325bff00d1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/serpro69/capy/releases/download/v0.15.0/capy_0.15.0_linux_arm64.tar.gz"
      sha256 "18ad7862a8654c31ee3cebfd8f816d1091591f060e0217be10c0dc3da6f5ede5"
    elsif Hardware::CPU.intel?
      url "https://github.com/serpro69/capy/releases/download/v0.15.0/capy_0.15.0_linux_amd64.tar.gz"
      sha256 "fa744c3e3629ccece31b17acf24c2f5dd9a34aa8d97383ec1bcfa22c3eeff5b6"
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
