class Capy < Formula
  desc "Context-aware MCP server for LLM context reduction"
  homepage "https://github.com/serpro69/capy"
  version "0.17.1"
  license "Elastic-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/serpro69/capy/releases/download/v0.17.1/capy_0.17.1_darwin_arm64.tar.gz"
      sha256 "fe56d08c883f74ba24ef0dca94b2c09e34b7c9ceb959a3bb334989989d93497f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/serpro69/capy/releases/download/v0.17.1/capy_0.17.1_linux_arm64.tar.gz"
      sha256 "5d4cdc2dcd6764a538f5c557ec99f56d0d8f4d19d3c47460ed4dac8d7a4c866c"
    elsif Hardware::CPU.intel?
      url "https://github.com/serpro69/capy/releases/download/v0.17.1/capy_0.17.1_linux_amd64.tar.gz"
      sha256 "21c161332e92bf692109f682d569dc5ac47fea410b454507ea772943b5d09740"
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
