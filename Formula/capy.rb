class Capy < Formula
  desc "Context-aware MCP server for LLM context reduction"
  homepage "https://github.com/serpro69/capy"
  version "0.17.3"
  license "Elastic-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/serpro69/capy/releases/download/v0.17.3/capy_0.17.3_darwin_arm64.tar.gz"
      sha256 "67521d5b32ea10aa2173b305b4dd902afc3c5056c6db632d2c272fd6cabdeba2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/serpro69/capy/releases/download/v0.17.3/capy_0.17.3_linux_arm64.tar.gz"
      sha256 "4aeda349fea282f906d8d17b39145f1376a555bb7ac1c349bf8bde62d890ea24"
    elsif Hardware::CPU.intel?
      url "https://github.com/serpro69/capy/releases/download/v0.17.3/capy_0.17.3_linux_amd64.tar.gz"
      sha256 "76b8365b2c23ca60c943108facf08fbe781dbd4bdde26ae6938fb32731c3a04e"
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
