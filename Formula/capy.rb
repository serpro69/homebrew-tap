class Capy < Formula
  desc "Context-aware MCP server for LLM context reduction"
  homepage "https://github.com/serpro69/capy"
  version "0.16.4"
  license "Elastic-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/serpro69/capy/releases/download/v0.16.4/capy_0.16.4_darwin_arm64.tar.gz"
      sha256 "f6bb831cf8958afa0e208394b77b126f376558a2620fc802f092095026870da0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/serpro69/capy/releases/download/v0.16.4/capy_0.16.4_linux_arm64.tar.gz"
      sha256 "4df5160b999bc79379b3de61e0bc38af90a028cedcd3deb3efbfec9f031a4ac3"
    elsif Hardware::CPU.intel?
      url "https://github.com/serpro69/capy/releases/download/v0.16.4/capy_0.16.4_linux_amd64.tar.gz"
      sha256 "3df3ba31bfcfbb2ef313d805e567b51e4a1b1a613b8ae690fb1a9baaefa018eb"
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
