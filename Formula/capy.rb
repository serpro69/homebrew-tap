class Capy < Formula
  desc "Context-aware MCP server for LLM context reduction"
  homepage "https://github.com/serpro69/capy"
  version "0.9.0"
  license "Elastic-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/serpro69/capy/releases/download/v0.9.0/capy_0.9.0_darwin_arm64.tar.gz"
      sha256 "41ec0d1baf8e10f2c11b59a7d23a784901fe73fe38d8b2241f042fa7e23c2e4f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/serpro69/capy/releases/download/v0.9.0/capy_0.9.0_linux_arm64.tar.gz"
      sha256 "b803e6086668dad2a7d18b28c388979db0f58d95d2d9651692c4400be0d75b0f"
    elsif Hardware::CPU.intel?
      url "https://github.com/serpro69/capy/releases/download/v0.9.0/capy_0.9.0_linux_amd64.tar.gz"
      sha256 "7ea1d0780f456afe42637f70dd9a9993fb710f92b42438f604fa7f6bce4ff7d5"
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
