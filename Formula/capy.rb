class Capy < Formula
  desc "Context-aware MCP server for LLM context reduction"
  homepage "https://github.com/serpro69/capy"
  version "0.6.0"
  license "Elastic-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/serpro69/capy/releases/download/v0.6.0/capy_0.6.0_darwin_arm64.tar.gz"
      sha256 "5c4ed3efe25ab87a03e50def732ea290bfff28e4195a3f7e4bce299209b9e617"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/serpro69/capy/releases/download/v0.6.0/capy_0.6.0_linux_arm64.tar.gz"
      sha256 "423b4fceba22728b7751391ca86f8e0e9196d8895ea44f6f321b654e7be32a10"
    elsif Hardware::CPU.intel?
      url "https://github.com/serpro69/capy/releases/download/v0.6.0/capy_0.6.0_linux_amd64.tar.gz"
      sha256 "303880346ee46da900b57429bd3a0d7ab56ba72aa8f1f931adde22657ec4434a"
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
