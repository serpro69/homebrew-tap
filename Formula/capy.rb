class Capy < Formula
  desc "Context-aware MCP server for LLM context reduction"
  homepage "https://github.com/serpro69/capy"
  version "0.18.0"
  license "Elastic-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/serpro69/capy/releases/download/v0.18.0/capy_0.18.0_darwin_arm64.tar.gz"
      sha256 "573674cf78551ef7eeb520b4088b4695e62d14fa02c73ac92d71b1d567b9c954"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/serpro69/capy/releases/download/v0.18.0/capy_0.18.0_linux_arm64.tar.gz"
      sha256 "cdbf37281d2ba7da3159b051039a4b8dd8cddd8bb3ac39d107c92ad4ca33b6d8"
    elsif Hardware::CPU.intel?
      url "https://github.com/serpro69/capy/releases/download/v0.18.0/capy_0.18.0_linux_amd64.tar.gz"
      sha256 "3d4eb945cf2365f06d6870cc9f9676e786130e79fa270dfdfecff382ba36508d"
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
