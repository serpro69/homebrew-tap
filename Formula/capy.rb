class Capy < Formula
  desc "Context-aware MCP server for LLM context reduction"
  homepage "https://github.com/serpro69/capy"
  version "0.6.1"
  license "Elastic-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/serpro69/capy/releases/download/v0.6.1/capy_0.6.1_darwin_arm64.tar.gz"
      sha256 "c2347ffd70522fccc5b092cbeabefb5259a7b57ff5e391eeb46677fb2392020c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/serpro69/capy/releases/download/v0.6.1/capy_0.6.1_linux_arm64.tar.gz"
      sha256 "497fa7baef779d74de7fb81364d189523a70f238a36e43d0f684d4b9fdeadf52"
    elsif Hardware::CPU.intel?
      url "https://github.com/serpro69/capy/releases/download/v0.6.1/capy_0.6.1_linux_amd64.tar.gz"
      sha256 "a89ca08e829c8a804b646909cc7257461e7394046580eeb6ce1f8bd0143b05a5"
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
