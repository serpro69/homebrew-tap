class Capy < Formula
  desc "Context-aware MCP server for LLM context reduction"
  homepage "https://github.com/serpro69/capy"
  version "0.7.3"
  license "Elastic-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/serpro69/capy/releases/download/v0.7.3/capy_0.7.3_darwin_arm64.tar.gz"
      sha256 "a444e543b4fe4065d76b05ae8e0c28bb01000b60aa45cf02088f1a8bf255913a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/serpro69/capy/releases/download/v0.7.3/capy_0.7.3_linux_arm64.tar.gz"
      sha256 "4f63171828649d5ed2d79ca029ba40b5c02bd5beabf3d347541052a17b85603d"
    elsif Hardware::CPU.intel?
      url "https://github.com/serpro69/capy/releases/download/v0.7.3/capy_0.7.3_linux_amd64.tar.gz"
      sha256 "fdcbc42c5d86e2698f6ddb41e31b31adfa2dfa3b04926105a18cb261011c9a75"
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
