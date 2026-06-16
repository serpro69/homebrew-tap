class Capy < Formula
  desc "Context-aware MCP server for LLM context reduction"
  homepage "https://github.com/serpro69/capy"
  version "0.10.2"
  license "Elastic-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/serpro69/capy/releases/download/v0.10.2/capy_0.10.2_darwin_arm64.tar.gz"
      sha256 "8e336b2743690df436b3d6b6cdd533dfcc9d4108f629c504fd17d31d9e1f4be6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/serpro69/capy/releases/download/v0.10.2/capy_0.10.2_linux_arm64.tar.gz"
      sha256 "b010a4115a3c35f53664f74513f50f98704633325bee3dc68f583bdf01964a30"
    elsif Hardware::CPU.intel?
      url "https://github.com/serpro69/capy/releases/download/v0.10.2/capy_0.10.2_linux_amd64.tar.gz"
      sha256 "a0619c976cea97ac420f52e4cf9d8bca7b412082053d700f2aab709e9fb5be81"
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
