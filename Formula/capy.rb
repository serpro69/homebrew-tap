class Capy < Formula
  desc "Context-aware MCP server for LLM context reduction"
  homepage "https://github.com/serpro69/capy"
  version "0.18.2"
  license "Elastic-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/serpro69/capy/releases/download/v0.18.2/capy_0.18.2_darwin_arm64.tar.gz"
      sha256 "da0cd3328f8c2bd46452461698c04580065a2b577063d27101e084515e946928"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/serpro69/capy/releases/download/v0.18.2/capy_0.18.2_linux_arm64.tar.gz"
      sha256 "88a27398b2c9a3bb70cc4365038ed48534243899aeb167e1b6cbc57bb6588319"
    elsif Hardware::CPU.intel?
      url "https://github.com/serpro69/capy/releases/download/v0.18.2/capy_0.18.2_linux_amd64.tar.gz"
      sha256 "f9e5e0296fc44df3ebcfa21e7e0c90a9d1a5a7300de4957c924239cd0c015672"
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
