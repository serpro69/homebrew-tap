class Capy < Formula
  desc "Context-aware MCP server for LLM context reduction"
  homepage "https://github.com/serpro69/capy"
  version "0.12.1"
  license "Elastic-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/serpro69/capy/releases/download/v0.12.1/capy_0.12.1_darwin_arm64.tar.gz"
      sha256 "9a3dab3c8561f121fc362b0c3db1d2f8061bb3cd7041b689638e1253bd4805a4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/serpro69/capy/releases/download/v0.12.1/capy_0.12.1_linux_arm64.tar.gz"
      sha256 "6848f6d7b9d3c99a40a9b3608645b4816a7477fe41fa522ddd44f0374f247372"
    elsif Hardware::CPU.intel?
      url "https://github.com/serpro69/capy/releases/download/v0.12.1/capy_0.12.1_linux_amd64.tar.gz"
      sha256 "f0bb572b0eaf01974de50b6e12f00306e7feceb2532feaa9aa24f1d83c58346e"
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
