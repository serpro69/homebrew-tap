class Capy < Formula
  desc "Context-aware MCP server for LLM context reduction"
  homepage "https://github.com/serpro69/capy"
  version "0.13.0"
  license "Elastic-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/serpro69/capy/releases/download/v0.13.0/capy_0.13.0_darwin_arm64.tar.gz"
      sha256 "384b8f7f3dc084322c11edfc44e40caba7345c376f102b01e6f01c33c5a0d10a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/serpro69/capy/releases/download/v0.13.0/capy_0.13.0_linux_arm64.tar.gz"
      sha256 "b3570b0c43db94e894d77f19455c0f6627ffd66f654c641477b167bf713c9bf6"
    elsif Hardware::CPU.intel?
      url "https://github.com/serpro69/capy/releases/download/v0.13.0/capy_0.13.0_linux_amd64.tar.gz"
      sha256 "d41b6a063fa6c0f77a944c883aa6891e61be3ddac86ad702e5f06157678ff7cc"
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
